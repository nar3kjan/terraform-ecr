variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "vpc_azs" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "private_subnets" {
  default = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "public_subnets" {
  default = ["10.10.101.0/24", "10.10.102.0/24"]
}

variable "domain_name" {
  default = "nar3kjan.link"
}

variable "subject_alternative_names" {
  default = [
    "*.nar3kjan.link",
    "app.sub.nar3kjan.link",
  ]
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "narek-key.n.virginia"
}