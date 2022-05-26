variable "projectPrefix" {
  type        = string
  description = "projectPrefix name for tagging"
}
variable "namespace" {
  description = "Volterra application namespace"
  type        = string
}
variable "fqdn" {
  description = "FQDN under with the service will be published"
  type        = string
  default     = ""
}

