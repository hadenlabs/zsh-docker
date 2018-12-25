# Docker
.PHONY: docker.help docker.build docker.test docker.pkg
PATH_DOCKER_COMPOSE:=provision/docker-compose
DOCKER_NETWORK = $(PROJECT)_network

docker: docker.help

docker.help:
	@echo '    Docker:'
	@echo ''
	@echo '        docker.build         build all or one example: make docker.build service={{services}}  args=(--pull|...)'
	@echo '        docker.down          down services docker-compose'
	@echo '        docker.exec          exec command in container by {{services}} {{command}}'
	@echo '        docker.ssh           connect by ssh to container'
	@echo '        docker.stop          stop services by env'
	@echo '        docker.verify_network           verify network'
	@echo '        docker.up             up services of docker-compose'
	@echo '        docker.run            run {service} {env}'
	@echo '        docker.restart        restart by {env}'
	@echo '        docker.list           list services of docker'
	@echo ''

docker.run: clean
	@if [ -z "${env}" ]; then \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/dev.yml run --rm ${service} bash; \
	else \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/"${env}".yml run --rm ${service} bash; \
	fi

docker.restart: clean
	@if [ "${env}" == "" ]; then \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/dev.yml restart; \
	else \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/"${env}".yml restart; \
	fi

docker.build: clean
	@echo $(MESSAGE) "Building environment: ${env} ${service}"
	@if [ -z "${env}" ] && [ -z "${service}" ]; then \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/dev.yml build ${args}; \
	elif [ -z "${env}" ] && [ -n "${service}" ]; then \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/dev.yml build ${service} ${args}; \
	elif [ -n "${env}" ] && [ -z "${service}" ]; then \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/"${env}".yml build ${args}; \
	elif [ -n "${env}" ] && [ -n "${service}" ]; then \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/"${env}".yml build ${service} ${args}; \
	fi

docker.down: clean
	@echo $(MESSAGE) "Down Services Environment: ${env}"
	@if [ -z  "${env}" ]; then \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/dev.yml down --remove-orphans; \
	else \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/"${env}".yml down --remove-orphans; \
	fi

docker.exec: clean
	@echo $(MESSAGE) "Exec Services Environment: ${env}"
	@if [ -z "${env}" ]; then \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/dev.yml exec ${service} ${command} ; \
	else \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/"${env}".yml exec ${service} ${command} ; \
	fi

docker.stop: clean
	@echo $(MESSAGE) "Stop Services: ${env}"
	@if [ "${env}" == "" ]; then \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/dev.yml stop; \
	else \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/"${env}".yml stop; \
	fi

docker.verify_network: ## Verify network
	@if [ -z $$(docker network ls | grep $(DOCKER_NETWORK) | awk '{print $$2}') ]; then\
		(docker network create $(DOCKER_NETWORK));\
	fi

docker.up: clean
	@echo $(MESSAGE) "Up Services: ${env}"
	@if [ "${env}" == "" ]; then \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/dev.yml up --remove-orphans; \
	else \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/"${env}".yml up --remove-orphans; \
	fi

docker.list: clean
	@echo $(MESSAGE) "List Services: ${env}"
	@if [ "${env}" == "" ]; then \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/dev.yml ps; \
	else \
		$(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/"${env}".yml ps; \
	fi
