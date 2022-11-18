resource "aws_iam_role_policy" "ecr_policy" {
  name = "ecr_policy"
  role = aws_iam_role.ecr_ec2_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = var.iam_role_policy
}

resource "aws_iam_role" "ecr_ec2_role" {
  name = "ecr-role"

  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_acr"
  role = aws_iam_role.ecr_ec2_role.name
}