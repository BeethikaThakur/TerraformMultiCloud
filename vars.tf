  variable "AWS_ACCESS_KEY"{}
  variable "AWS_SECRET_KEY"{}
variable "AzureVMsize" {
  description = "Size of your VM "
  default = "Standard_DS1_v2"
  
}
variable "AzureAdmin_user" {
  description = "user for login into machine"
  default ="azureuser"  
}
variable "AzureAdmin_password" {
  description = "Password for the login"
  default="Update your password"
}
variable "AzureStorageAccType" {
  description = ""
  default="Standard_LRS"
  
}
variable "AzureLocation" {
  description = "Location"
  default = "Central India"
}
variable "AzureTagName" {
  description = "Tag name"
  default = "Terra"
  
}

variable "AWSami" {
    description = "ami for the instance"
    default = "ami-0ea3c35c5c3284d82" 
}
variable "AWSec2instancetype" {
  default = "t2.micro"
  description = "instance type for ec2 instance"
}
variable "AWStagname" {
    description = "tag for terraform file"
    default = "terra" 
}
variable "AWSvolumesize" {
  description = "rootblock volume size for ec2 instance"
  default="10"
  
}
variable "AWSvolumetype" {
  description = "root block volume type for ec2 instance"
  default="gp3"
  
}
