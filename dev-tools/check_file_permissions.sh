#!/bin/sh
set -eu

files_with_wrong_permissions=$(
    git ls-files --stage . \
        ':!*.sh' \
        ':!php-cs-fixer' \
        ':!dev-tools/*.php' \
        ':!.ddev/commands/web/init-typo3' \
    | grep -P "^100755 " \
    | sort -fh
)

if [ "$files_with_wrong_permissions" ]
then
    printf '\033[97;41mWrong permissions detected:\033[0m\n'
    echo "${files_with_wrong_permissions}"
    exit 3
fi

printf '\033[0;32mNo wrong permissions detected.\033[0m\n'
