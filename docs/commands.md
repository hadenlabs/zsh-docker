<!-- Space: ZshDocker -->
<!-- Parent: Project -->
<!-- Title: Commands ZshDocker -->

<!-- Label: ZshDocker -->
<!-- Label: Project -->
<!-- Label: Commands -->
<!-- Include: disclaimer.md -->
<!-- Include: ac:toc -->

## Commands

### Confluence

#### Sync Markdown with confluence

```{.bash}
task mark:sync
```

### Diagrams

#### Publish diagrams

```{.bash}
task diagrams:publish
```

### Changelog

#### Generate Changelog Next Tag

```{.bash}
task changelog:next APP_TAG={{tag name}}
```

#### Parameters

| Name     | Description   | sample | Required |
| -------- | ------------- | ------ | :------: |
| tag name | Name next tag | 0.1.0  |   yes    |

### Version

#### Version Major

```{.bash}
task version:major
```

#### Version Minor

```{.bash}
task version:minor
```

#### Version Patch

```{.bash}
task version:patch
```
