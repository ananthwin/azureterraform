variable "current_stack" {
  type        = string
  default     = "dotnet"
  description = "The application stack to use for the web app"
}

variable "dotnet_version" {
  type        = string
  default     = "v8.0"
  description = "The version of .NET to use for the web app"
}

variable "client_id" {
  description = "Azure Service Principal Client ID"
  type        = string
  default = "a0f98fdd-d80b-40e0-87e4-7201dd689145"
}

variable "client_secret" {
  description = "Azure Service Principal Secret"
  type        = string
  default = "LGh8Q~pSrU~KEawcPRC2FN.8sgYrQg.OYx9rKdpN"
}

variable "ARM_CLIENT_ID" {}
variable "ARM_CLIENT_SECRET" {}
variable "ARM_SUBSCRIPTION_ID" {}
variable "ARM_TENANT_ID" {}