provider "aws" {
  region = var.aws_region
}


terraform {
  backend "s3" {
    bucket = "nar3kjan-project-terraform-remote-state"
    key = "terraform/project-docker/terraform.tfstate"
    region = "us-east-1"
  }
}