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

variable "iam_role_policy" {
  default = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:GetRepositoryPolicy",
                "ecr:DescribeRepositories",
                "ecr:ListImages",
                "ecr:DescribeImages",
                "ecr:BatchGetImage",
                "ecr:GetLifecyclePolicy",
                "ecr:GetLifecyclePolicyPreview",
                "ecr:ListTagsForResource",
                "ecr:DescribeImageScanFindings"
            ],
            "Resource": "*"
        }
    ]
})
}

variable "assume_role_policy" {
  default = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}