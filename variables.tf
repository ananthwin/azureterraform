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
  sensitive   = true
}

variable "client_secret" {
  description = "Azure Service Principal Secret"
  type        = string
  sensitive   = true
}

variable "ARM_CLIENT_ID" {
  description = "Azure ARM Client ID"
  type        = string
  sensitive   = true
}

variable "ARM_CLIENT_SECRET" {
  description = "Azure ARM Client Secret"
  type        = string
  sensitive   = true
}

variable "ARM_SUBSCRIPTION_ID" {
  description = "Azure Subscription ID"
  type        = string
}

variable "ARM_TENANT_ID" {
  description = "Azure Tenant ID"
  type        = string
}