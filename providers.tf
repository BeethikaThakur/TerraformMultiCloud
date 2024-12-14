provider "aws" {
    region = "us-east-2"
  
}
provider "azurerm" {
  features {}
  client_id       = ""       # Replace with your Service Principal's appId
  client_secret   = ""   # Replace with your Service Principal's password
  tenant_id       = ""       # Replace with your tenant ID
  subscription_id = "" # Replace with your subscription ID
}