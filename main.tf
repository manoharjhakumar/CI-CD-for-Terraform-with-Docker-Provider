terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Create a Docker image from nginx
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Run Nginx container
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "nginx-server"
  ports {
    internal = 80
    external = 8080
  }
}

