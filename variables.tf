# variables.tf
variable "project_name" {
  description = "A projekt neve, ami az erőforrások elnevezésében is megjelenik"
  type        = string
  default     = "is-prime"
}

variable "app_port" {
  description = "Az alkalmazás portja"
  type        = number
  default     = 3000
}
