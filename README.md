# penv
A bash script to manage Python environments

This script provides a simple way to manage Python 2 or 3 environments
## Installation
To install penv just run the following command
```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/fortizc/penv/master/installer.sh)" --install
```
If you want to remove penv use this command
```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/fortizc/penv/master/installer.sh)" --uninstall
```

## Options
```
Usage ./cli.sh {options}:

Arguments:
-l, --list				List all availables environments
-p, --packages {environment}		Show instaled packages
-a, --activate {environment}		Activate the given environment
-c, --create {python_version} {name}	Create a new environment
-i, --interpreter			Show all availables interpreters
-d, --delete {environment}		Delete the given environment
-h, --help				Show this help and exit
```
