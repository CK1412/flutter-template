# flutter_web_template

## Project description

Flutter template project for android, ios and web. You can generate a new repository by clicking
"**Use this template**" above.

## Setup and Installation

### Bootstrap the project

```bash
echo "Bootstrap the project"
clear 
flutter clean 
flutter pub get 
dart run build_runner build --delete-conflicting-outputs 
dart run intl_utils:generate
echo "Bootstrap finished"
```

## Gen code

Watches the files system for edits and does rebuilds as necessary.

```bash
dart run build_runner watch
```

## Troubleshooting

### Clear git local cached

When you think your git is messed up, you can use this command to do everything up-to-date.

```bash
git rm -r --cached . 
git add . 
git commit -m 'git cache cleared'
```

> Note: Only use when the project has no changes waiting to be committed.

### Markdown bash/shell scripts run in reverse order on Windows

- How to
  fix: https://youtrack.jetbrains.com/issue/IDEA-294997/Markdown-shell-scripts-run-in-reverse-order