terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.18.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "docker" {
  # Use the local docker socket. Works on Linux and macOS (Docker Desktop).
  host = "unix:///var/run/docker.sock"
}

# Build a Docker image from the local Dockerfile in the current folder.
resource "docker_image" "hello_http" {
  name = "homework3-hello-http:latest"

  build {
    context    = "${path.module}"
    dockerfile = "Dockerfile"
  }
}

# Run the container from the built image.
# This maps container port 8081 -> host port 8081. Adjust ports if your app uses another port.
resource "docker_container" "hello_http" {
  name  = "homework3-hello-http"
  image = docker_image.hello_http.latest

  # If your container listens on a different port, change internal/external accordingly.
  ports {
    internal = 8081
    external = 8081
  }

  restart = "on-failure"
  # Optional: environment = ["VAR=value"]
}

output "image_name" {
  description = "Name of the built docker image"
  value       = docker_image.hello_http.name
}

output "container_id" {
  description = "ID of the running container"
  value       = docker_container.hello_http.id
}
