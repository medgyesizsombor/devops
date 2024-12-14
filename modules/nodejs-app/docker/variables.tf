# modules/nodejs-app/docker/variables.tf
variable "project_name" {
  description = "A projekt neve"
  type        = string
}

variable "container_name" {
  description = "A Docker konténer neve"
  type        = string
}

variable "memory_limit" {
  description = "Memória limit MB-ban"
  type        = number
  default     = 256
}
