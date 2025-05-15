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
}

variable "client_secret" {
  description = "Azure Service Principal Secret"
  type        = string
}