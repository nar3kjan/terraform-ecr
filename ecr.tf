module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name = "ubuntu-nginx"

  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 30 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 30
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

data "aws_ecr_authorization_token" "token" {
}

output "token" {
  value = data.aws_ecr_authorization_token.token
}