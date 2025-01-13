
############ PROVIDER BLOCK ############
provider "aws" {
  region     = "ap-south-1"
  profile    = "default"
}
############ SAVING TF STATE FILE #########
terraform {
  backend "s3" {
    bucket  = "ganit-atlantis-bucket"
    key     = "atlantis/terraform.tfstate"
    region  = "ap-south-1"
    profile = "default"
  }
}
################# EC2 INSTANCE CREATION #########
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}


# end of file