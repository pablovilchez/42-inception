# 42 - Inception

![42 School](https://img.shields.io/badge/42%20School-Project-blue)
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)
![Debian](https://img.shields.io/badge/Debian-A81D33?logo=debian&logoColor=white)
![MariaDB](https://img.shields.io/badge/MariaDB-003545?logo=mariadb&logoColor=white)
![WordPress](https://img.shields.io/badge/WordPress-21759B?logo=wordpress&logoColor=white)
![Nginx](https://img.shields.io/badge/Nginx-009639?logo=nginx&logoColor=white)

## Description

Inception is a project from 42 School focusing on system administration using Docker. The goal of this project is to understand and implement a multi-container setup using Docker. The setup includes Debian-based containers running MariaDB, WordPress, and Nginx.

## Features

- Multi-container setup using Docker
- Containers include:
  - **MariaDB**: Database management system
  - **WordPress**: Content management system
  - **Nginx**: Web server
- Network configuration between containers
- Volume management for persistent storage
- Environment variable configuration

## Requirements

- Unix-based operating system (Linux or macOS)
- Docker and Docker Compose installed

## Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/pablovilchez/42-inception.git
    ```

2. Navigate to the project directory:

    ```sh
    cd inception
    ```

3. Build and start the containers using Makefile:

    ```sh
    make
    ```

## Usage

Access the services provided by the containers via their respective ports:
- Web: `https://pvilchez.42.fr` or `https://localhost:443` (by default)
- WordPress: `http://localhost:443/wp-admin`

## Configuration

- **MariaDB**: Configured with a persistent volume for data storage.
- **WordPress**: Configured to connect to the MariaDB container for its database.
- **Nginx**: Configured to serve WordPress and handle incoming HTTP requests.

## License

This project is licensed under the MIT License.

## Acknowledgments

- Thanks to 42 School for the project guidelines and support.

---
