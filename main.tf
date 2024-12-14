# main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

# Közös hálózat létrehozása
resource "docker_network" "app_network" {
  name = "${var.project_name}-network"
  driver = "bridge"
  # Enable IPv6 if needed
  ipam_config {
    subnet = "172.60.0.0/16"
    gateway = "172.60.0.1"
  }
  internal = false
}

# NodeJS alkalmazás modul
module "nodejs_app" {
  source = "./modules/nodejs-app/docker"
  
  container_name = "${var.project_name}-nodejs"
  project_name = var.project_name
}

# Nginx modul
module "nginx" {
  source = "./modules/nginx"

  project_name = var.project_name
}

# Prometheus modul
module "prometheus" {
  source = "./modules/prometheus"
  
  network = docker_network.app_network.name
}

# Grafana modul
module "grafana" {
  source = "./modules/grafana"

  network = docker_network.app_network.name
}

output "network_info" {
  value = {
    network_id   = docker_network.app_network.id
    network_name = docker_network.app_network.name
  }
}