# Dockerized Django with PostGIS Project

## Overview

This project is a Dockerized environment for a Django application using PostgreSQL with PostGIS for geospatial data support. It includes a Django container and a PostgreSQL with PostGIS container, suitable for developing geospatially-enabled web applications.

## Prerequisites

- Docker and Docker Compose should be installed on your machine.
- Familiarity with Docker, Docker Compose, Django, and PostgreSQL is assumed.

## Configuration Files

- `docker-compose.yml`: Orchestrates the Django application container and the PostgreSQL with PostGIS container.
- `Dockerfile`: Instructions for building the Django application Docker image.
- `.env`: A file for environment variables for database credentials and Django configurations.

## Services in docker-compose.yml

- **`postgres_server`**: PostgreSQL database with PostGIS extension.
- **`test_django_project`**: The Django web application.

## Quick Start

1. **Clone the Project**: Ensure you have the project files, including `Dockerfile`, `docker-compose.yml`, and Django project files.

2. **Set Up .env File**: Create a `.env` file in the project's root directory with the following content:

    ```env
    # PostgreSQL environment variables
    POSTGRES_DB=TestProject
    POSTGRES_USER=postgres_user
    POSTGRES_PASSWORD=your_secure_password

    # Django environment variables
    DB_NAME=TestProject
    DB_USER=postgres
    DB_PASSWORD=postgres
    DB_HOST=postgres_server
    DB_PORT=5432
    ```

3. **Build and Run**: Execute `docker-compose up --build` to start the services.

4. **Accessing the Application**: The Django app will be available at `http://localhost:8000`.

5. **Stopping the Services**: Run `docker-compose down` to stop and remove the containers.

## Important Notes

- **Database Persistence**: Data is stored in the `postgres_data` volume. The database persists across container restarts.
- **Environment Variables**: Are crucial for managing database credentials and should be kept secure.
- **Security in Production**: Set `DEBUG` to `False` in production and use a secure `SECRET_KEY`.

## File Descriptions

- `Dockerfile`: Sets up the Django environment, installs dependencies, and prepares the application for running in a Docker container.
- `docker-compose.yml`: Defines the services, networks, and volumes for the Dockerized application.
- `entrypoint.sh`: A script that runs at the container's startup, handling database migrations and server start.
- `.env`: Contains environment variables for database configuration and Django settings. This file should not be committed to version control if it contains sensitive information.

## Security Considerations

- Avoid committing sensitive data, like the `.env` file, to version control.
- In production environments, use more secure methods for managing sensitive information, such as Docker secrets or a dedicated configuration management system.

## Author

Faizan Shoukat Abbasi
