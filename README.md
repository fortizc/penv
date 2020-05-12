# penv
A bash script to manage Python 2 and 3 environments

## Installation
To install penv just run the following command
```
bash -c "$(curl -fsSL https://gitlab.com/fortizc/penv/raw/master/installer.sh)" --install
```
If you want to remove penv use this
```
bash -c "$(curl -fsSL https://gitlab.com/fortizc/penv/raw/master/installer.sh)" --uninstall
```

## Options
```
Usage penv {options}:

Arguments:
-l, --list                            List all availables environments
-p, --packages {environment}          Show instaled packages
-a, --activate {environment}          Activate the given environment
-c, --create {python_version} {name}  Create a new environment
-i, --interpreter                     Show all availables interpreters
-d, --delete {environment}            Delete the given environment
-C, --clean {environment}             Clean the given environment
-h, --help                            Show this help and exit
```
