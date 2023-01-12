#!/bin/bash

RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
YELLOW=$'\e[1;33m'
WHITE=$'\e[0m'

get_color()
{
	local color=$1
	local default_color=$WHITE

	if [ "$color" ]; then
		default_color=$color
	fi
	echo $default_color
}

print_text()
{
	local text=$1
	local color=$2

	color=$(get_color $color)
	echo -e $color $text $WHITE
}

print_text_br()
{
	local text=$1
	local color=$2

	print_text "$text" "$color"
	print_text ""
}

exist_file()
{
	local file=$1

	if [ ! -f "$file" ]
	then
		print_text ""
		print_text_br "ERROR: The \"$file\" file does not exist." $RED
		exit 1
	fi
}

read_var()
{
	local env_file=$1
	local key_variable=$2

	if [ -z "$env_file" ]; then
		print_text_br ".env file path is required" $RED
		return 1
	fi

	if [ -z "$key_variable" ]; then
		print_text_br "environment variable name is required" $RED
		return 1
	fi

	local var=$(grep $key_variable "$env_file" | xargs)
	IFS="=" read -ra var <<< "$var"
	echo ${var[1]}
}


VARIABLE_TO_REPLACE=(
	"EMAIL_ADMIN"
	"WEB_DOMAIN"
	"CONTAINER_NAME"
	"PHP_VIRTUALHOST_WORKDIR"
)

set_virtualhost_file()
{
	local env_file=$1
	local virtualhost_file=$2

	for variable in "${VARIABLE_TO_REPLACE[@]}"; do
		local env_value=$(read_var $env_file $variable)
		sed -i "s#\${$variable}#$env_value#" $virtualhost_file
	done
}

delete_unnecessary_files()
{
	rm -rf template_joomla_projects
	rm -rf dev/index.html
	rm -rf mysql/data/index.html
}

get_vitualhost_file()
{
	# Check md5 of 000-default.conf file, if not is the same, this file were download of github
	print_text_br "TODO: get_vitualhost_file()" $YELLOW
}

main()
{
	local env_file=$1
	exist_file $env_file

	local virtualhost_path=$(read_var $env_file PHP_VIRTUALHOST_PATH)
	local virtualhost_file=$(read_var $env_file PHP_VIRTUALHOST_FILE)

	get_vitualhost_file

	virtualhost_file="${virtualhost_path}${virtualhost_file}"
	
	exist_file $virtualhost_file

	set_virtualhost_file $env_file $virtualhost_file

	delete_unnecessary_files
}

ENV_FILE=".env"
main $ENV_FILE
