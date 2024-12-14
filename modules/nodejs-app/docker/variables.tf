# modules/nodejs-app/docker/variables.tf
variable "project_name" {
  description = "A projekt neve, ami az erőforrások elnevezésében is megjelenik"
  type        = string
  default     = "nodejs-sample"
}

variable "container_name" {
  description = "A Docker konténer neve"
  type        = string
}

variable "app_port" {
  description = "Az alkalmazás portja"
  type        = number
  default     = 3000
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
  default     = "latest"
}

variable "container_count" {
  description = "Indítandó konténerek száma"
  type        = number
  default     = 1
}

variable "memory_limit" {
  description = "Memória limit MB-ban"
  type        = number
  default     = 256  # 256 MB
}

variable "restart_policy" {
  description = "Újraindítási szabály"
  type        = string
  default     = "unless-stopped"  # always, on-failure, unless-stopped
}
