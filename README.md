# Docker Compose Configuration for Vapor

This Docker Compose configuration file is intended to help you set up a development and testing environment for your Vapor application using Docker. It includes services for your Vapor app, a database, and migration/reversion processes. Please note that this setup is primarily for testing and may not adhere to best practices for production deployments.

## Prerequisites

Before using this Docker Compose configuration, ensure that you have the following prerequisites:

- [Docker](https://docs.docker.com/get-docker/): Make sure Docker is installed on your system.

## Usage

You can use this Docker Compose file to build and run your Vapor application in a Dockerized environment. Here are some common commands and steps:

1. **Build Docker Images:**

   Before running your application, build the Docker images using the following command:

   ```bash
   docker-compose build
   ```
   
2. **Start the Application:**

    To start your Vapor application, use the following command:
    
   ```bash
   docker-compose up -d
   ```
   
3. **Run Migrations:**
     You can run the database migrations with the following command:
     
        ```bash
   docker-compose run migrate
   ```
   
   
## Environment Variables

This Docker Compose configuration utilizes environment variables defined in the .env file. These variables include:

`LOG_LEVEL`: Log level for your Vapor app.

`DATABASE_HOST`: Hostname for the PostgreSQL database.

`DATABASE_NAME`: Name of the PostgreSQL database.

`DATABASE_USERNAME`: Username for the PostgreSQL database.

`DATABASE_PASSWORD`: Password for the PostgreSQL database.

You can customize these variables in your .env file.


## Notes

- The configuration includes services for the Vapor app, migrations, and the PostgreSQL database.
- Make sure to adjust the image field in the app, migrate, and revert services to match your Vapor application image.
- The depends_on directive ensures that services start in the correct order.
- The database data is stored in a Docker volume to persist data across container restarts.

This Docker Compose setup provides a convenient way to develop and test your Vapor application in a Dockerized environment. Adjust the configuration as needed for your project, and always consider security and best practices when moving to a production deployment.
