# Template of Joomla Projects

## Table of contents

- [Description](#description)
	- [Technologies](#technologies)
- [How to use](#how-to-use)
- [License](#license)

---

## Description
Template of Joomla to use in any project with **docker**.

### Technologies
- PHP 7.4
- MySQL 5
- Docker
- Docker-compose
- GIT

---

## How to use

Create root folder of the project
```sh
mkdir folder_project
```

Change to root folder of the project
```sh
cd folder_project
```

Clone this project
```sh
git clone https://github.com/pablo247/template_joomla_projects.git
```

or clone this project whit branch php74
```sh
git clone --branch php74 https://github.com/pablo247/template_joomla_projects.git
```

Move template files
```sh
mv template_joomla_projects/template/* .
mv template_joomla_projects/template/.* .
```

Copy de .env.example file to .env file
```sh
cp .env.example .env
```

Configure .env file

Run bash script
```sh
chmod +x init.sh; ./init.sh
```

Your project is ready to work with docker!

---

## License

This project is open-sourced software licensed under the [MIT license](LICENSE).
