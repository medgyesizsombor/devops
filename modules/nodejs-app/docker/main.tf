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
  name = "node-sample-app:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile_deploy-terraform-env"
    tag        = ["node-sample-app:latest"]
    no_cache   = true
  }
}

resource "docker_container" "node_app" {
  count = var.container_count
  name  = "${var.container_name}-${count.index + 1}"
  hostname = "${var.container_name}-${count.index + 1}"
  image = docker_image.node_app.image_id

  # Memória limit
  memory = var.memory_limit
  
  # Újraindítási szabály
  restart = var.restart_policy
  
  # Port mapping - minden konténer más külső portot kap
  ports {
    internal = var.app_port
    external = var.app_port + count.index
  }
  
  # Hálózat csatlakozás
  networks_advanced {
    name = "${var.project_name}-network"
    aliases = ["${var.container_name}-${count.index + 1}"]
    ipv4_address = "172.60.0.${20 + count.index}"
  }
}

# Output a container_name használatához
output "container_name" {
  value = var.container_name
}