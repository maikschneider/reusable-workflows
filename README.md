# Github Action Collection

This repository contains reusable github actions for notification, build and testing.

## Microsoft Teams Notifications
    
Available events:

* New issue
* New issue comment
* Closed issue
* New star
* New pull request
* New release

Input|Type|Required|Description
-|-|-|-
`teams-webhook-url`|secret|true|Microsoft Teams webhook URL

To trigger all notifications from your repository, simply add the following `.github/workflow/notifications.yml` to your project and add configure the `TEAMS_WEBHOOK_URL` secret in your project settings:

```
name: Send notifications

on: [release, issues, issue_comment, watch, pull_request]

jobs:
  notification:
    uses: maikschneider/reusable-workflows/.github/workflows/notifications.yml@main
    secrets:
      teams-webhook-url: ${{ secrets.TEAMS_WEBHOOK_URL }}
```

## TYPO3 Extension release

The release action compoares the extension version in the `ext_emconf.php` with the latest release tag. 

Input|Type|Required|Description
-|-|-|-
`base-branch`|input|yes|Name of the branch the action will create and merge a pull request
`teams-webhook-url`|secret|false|Microsoft Teams webhook for notification after successful release

```

```