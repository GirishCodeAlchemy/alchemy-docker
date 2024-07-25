# Terraform Docker Setup

This repository contains Terraform configurations to set up a Docker environment with a PostgreSQL database and an Nginx web server.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (>= 1.5)
- Docker installed and running on your machine
- Access to the Docker daemon via `unix:///var/run/docker.sock`

## Providers

This configuration uses the following Terraform providers:

- [kreuzwerker/docker](https://registry.terraform.io/providers/kreuzwerker/docker/latest)

## Resources

The following resources will be created:

1. **Docker Network**: A custom Docker network named `my_network`.
2. **Docker Volume**: A Docker volume named `db_data` for persistent storage of the PostgreSQL database.
3. **Docker Containers**:
   - **Web Container**: A container running Nginx with the image `girishcodealchemy/alchemy-nginx:v5`.
   - **Db Container**: A container running PostgreSQL with the latest image.

## Configuration Details

### Docker Network

```kotlin
resource "docker_network" "my_network" {
  name = "my_network"
}
```

### Docker Volume

```kotlin
resource "docker_volume" "db_data" {
  name = "db_data"
}
```

### Web Container

```kotlin
resource "docker_container" "web" {
  name  = "web"
  image = "girishcodealchemy/alchemy-nginx:v5"
  ports {
    internal = 80
    external = 80
  }
  networks_advanced {
    name = docker_network.my_network.name
  }
}

```

### Db container

```kotlin
resource "docker_container" "db" {
  name  = "db"
  image = "postgres:latest"
  env = [
    "POSTGRES_USER=postgres",
    "POSTGRES_PASSWORD=password",
    "POSTGRES_DB=mydb"
  ]
  volumes {
    volume_name    = docker_volume.db_data.name
    container_path = "/var/lib/postgresql/data"
  }
  networks_advanced {
    name = docker_network.my_network.name
  }
}
```

## Usage

Follow these steps to set up the Docker environment using Terraform:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/GirishCodeAlchemy/alchemy-docker.git
   cd terraform
   ```

2. **Initialize Terraform:**

   Before you can apply the configuration, you need to initialize the Terraform working directory. This step downloads the necessary provider plugins:

   ```bash
   terraform init
   ```

3. **Apply the Terraform configuration:**

   Apply the Terraform configuration to create the Docker resources. This command will prompt you to confirm before making any changes:

   ```bash
   terraform apply
   ```

   You will see a plan of the actions Terraform will take. Type `yes` to confirm and proceed.

4. **Verify the setup:**

   After applying the configuration, you can verify that the Docker containers are running:

   ```bash
   docker ps
   ```

   You should see both the Web and Db containers running.

5. **Access the web server:**

   Open your web browser and go to `http://localhost`. You should see the Nginx welcome page or the content served by the `girishcodealchemy/alchemy-nginx:v5` image.

6. **Connect to the Database:**

   Use any PostgreSQL client to connect to the database. The connection details are as follows:

   - **Host:** `localhost`
   - **Port:** `5432`
   - **Username:** `postgres`
   - **Password:** `password`
   - **Database Name:** `mydb`

   Example connection command using `psql`:

   ```bash
   psql -h localhost -U postgres -d mydb
   ```

   You will be prompted to enter the password (`password`).

## Cleanup

To remove all resources created by this Terraform configuration, run:

```bash
terraform destroy
```

Type yes when prompted to confirm the destruction of resources.

## License

This project is licensed under the MIT License. See the [LICENSE](../LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes.
