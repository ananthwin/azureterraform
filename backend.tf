terraform {
  backend "azurerm" {
    resource_group_name  = "tf-webapp-rg"
    storage_account_name = "tf1storageacc"
    container_name       = "terraform-state"
    key                  = "dev.terraform.tfstate"
  }
}
