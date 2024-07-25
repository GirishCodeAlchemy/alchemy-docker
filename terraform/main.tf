terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }

  required_version = "~> 1.5"
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_network" "my_network" {
  name = "my_network"
}

resource "docker_volume" "db_data" {
  name = "db_data"
}

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
