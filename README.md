# Github Action Collection

This repository contains reusable github actions for notification, build and testing.

## Microsoft Teams Notifications

Available events:

* New issue
* New issue comment
* Closed issue
* New star
* New pull request
* New PR review comment
* New release

Input|Type|Required|Description
-|-|-|-
`teams-webhook-url`|secret|true|Microsoft Teams webhook URL
`image-url`|input|false|Optional image URL to display in the card header (e.g. extension icon)

To trigger all notifications from your repository, simply add the following `.github/workflows/notifications.yml` to your project and configure the `TEAMS_WEBHOOK_URL` secret in your project settings:

```yaml
name: Send notifications

on: [release, issues, issue_comment, watch, pull_request_target, pull_request_review_comment]

jobs:
  notification:
    uses: maikschneider/reusable-workflows/.github/workflows/notifications.yml@main
    secrets:
      teams-webhook-url: ${{ secrets.TEAMS_WEBHOOK_URL }}
    with:
      image-url: 'https://example.com/icon.png'
```

## Static Code Analysis

This workflow runs static code analysis checks on PHP projects including file permissions, trailing spaces, PHP linting, PHPStan, PHP-CS-Fixer, shell script checks, and PHPMD.

Input|Type|Required|Description
-|-|-|-
`php-version`|input|false|PHP version to use (default: `8.1`)
`operating-system`|input|false|Runner OS (default: `ubuntu-20.04`)
`php-extensions`|input|false|Additional PHP extensions to install

```yaml
name: Static Code Analysis

on: [push, pull_request]

jobs:
  sca:
    uses: maikschneider/reusable-workflows/.github/workflows/sca.yml@main
    with:
      php-version: '8.1'
```

## TYPO3 extension release

This action creates a new github release, if not existing for the pushed tag. It uses [typo3/tailor](https://github.com/TYPO3/tailor) to publish the extension to the TER.

Input|Type|Required|Description
-|-|-|-
`typo3-extension-key`|input|true|Extension key
`typo3-api-token`|secret|true|Token of typo3.org account that has access to the extension

```yaml
name: Release
on:
    push:
        tags:
            - '*'

jobs:
    ter-publish:
        uses: maikschneider/reusable-workflows/.github/workflows/release.yml@main
        secrets:
            typo3-api-token: ${{ secrets.TYPO3_API_TOKEN }}
        with:
            typo3-extension-key: 'my_extension'

```
