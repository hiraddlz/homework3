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
  host = "unix:///var/run/docker.sock"
}

# Build the image from the provided Dockerfile
resource "docker_image" "dummyserv" {
  name = "homework3-dummyserv:latest"

  build {
    context    = "${path.module}"
    dockerfile = "Dockerfile"
  }
}

# Run the container
resource "docker_container" "dummyserv" {
  name  = "homework3-dummyserv"
  image = docker_image.dummyserv.latest

  # Match container port 8081 (from CMD ["/dummyserv", "8081"])
  ports {
    internal = 8081
    external = 8081
  }

  restart = "on-failure"
}

output "image_name" {
  value = docker_image.dummyserv.name
}

output "container_id" {
  value = docker_container.dummyserv.id
}
