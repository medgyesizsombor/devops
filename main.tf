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
    subnet = "172.60.0.0/16"  # Customize subnet as needed
    gateway = "172.60.0.1"
  }
  internal = false
}

# NodeJS alkalmazás modul
module "nodejs_app" {
  source = "./modules/nodejs-app/docker"
  
  app_port = var.app_port
  container_name = "${var.project_name}-nodejs"
}

# Nginx modul
module "nginx" {
  source = "./modules/nginx"
}

# Prometheus modul
module "prometheus" {
  source = "./modules/prometheus"
  
  network = docker_network.app_network.name
  nodejs_app_name = module.nodejs_app.container_name
}

# Grafana modul
module "grafana" {
  source = "./modules/grafana"
  
  network = docker_network.app_network.name
  prometheus_url = "http://prometheus:9090"
}

output "network_info" {
  value = {
    network_id   = docker_network.app_network.id
    network_name = docker_network.app_network.name
  }
}