variable "projectPrefix" {
  type        = string
  description = "projectPrefix name for tagging"
}
variable "namespace" {
  description = "Volterra application namespace"
  type        = string
}
variable "volterraP12" {
  description = "Location of volterra p12 file"
  type        = string
  default     = null
}
variable "volterraUrl" {
  description = "url of volterra api"
  type        = string
  default     = null
}
