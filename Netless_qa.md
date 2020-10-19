## Tutorials

### 1. Where to get started?
```bash
$ cd /Users/hanmeitang/web-repos/docs/website
$ git checkout dev-en
$ yarn install  # Run this the frist time you load
$ yarn start
```

## QA

### Q1: docusaurus-start: command not found

```bash
$ yarn start
yarn run v1.17.3
warning ../../package.json: No license field
$ docusaurus-start
/bin/sh: docusaurus-start: command not found
error Command failed with exit code 127.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
```
Solution:
```bash
$ yarn global add docusaurus -D
```
