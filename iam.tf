resource "aws_iam_role_policy" "ecr_policy" {
  name = "ecr_policy"
  role = aws_iam_role.ecr_ec2_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = file("iamrolepolicy.json")
}

resource "aws_iam_role" "ecr_ec2_role" {
  name = "ecr-role"

  assume_role_policy = file("iamassumepolicy.json")
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_acr"
  role = aws_iam_role.ecr_ec2_role.name
}