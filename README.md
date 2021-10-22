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
Clone this project in folder root
Move template files
```sh
mv template_joomla_projects/template/* .
mv template_joomla_projects/template/.* .
```

Configure .env file

Run bash script
```sh
chmod +x init.sh; ./init.sh
```

---

## License

This project is open-sourced software licensed under the [MIT license](LICENSE).
