# modules/nodejs-app/docker/main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "node_app" {
  name = "node-app:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile_deploy"
    tag        = ["node-app:latest"]
    no_cache   = true
  }
}

resource "docker_container" "node_app" {
  name  = "${var.container_name}"
  hostname = "${var.container_name}"
  image = docker_image.node_app.image_id
  
  # Újraindítási szabály
  restart = "unless-stopped"
  
  # Port mapping - minden konténer más külső portot kap
  ports {
    internal = 3000
    external = 3000
  }
  
  # Hálózat csatlakozás
  networks_advanced {
    name = "${var.project_name}-network"
    aliases = ["${var.container_name}"]
    ipv4_address = "172.60.0.20"
  }
}

# Output a container_name használatához
output "container_name" {
  value = var.container_name
}