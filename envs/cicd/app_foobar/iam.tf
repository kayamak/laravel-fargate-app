resource "aws_iam_user" "github" {
  name = "${local.name_prefix}-${local.service_name}-github"
  tags = {
    Name = "${local.name_prefix}-${local.service_name}-github"
  }
}

resource "aws_iam_role" "developer" {
  name = "${local.name_prefix}-${local.service_name}-developer"
  assume_role_policy = jsonencode(
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Action": [
            "sts:AssumeRole",
            "sts:TagSession"
          ]
          "Principal": {
            "AWS": "${aws_iam_user.github.arn}"
          },
        }
      ]
    }
  )
  tags = {
    Name = "${local.name_prefix}-${local.service_name}-developer"
  }
}

data "aws_iam_policy" "ecr_power_user" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

resource "aws_iam_role_policy_attachment" "role_developer_policy_ecr_power_user" {
  role       = aws_iam_role.developer.name
  policy_arn = data.aws_iam_policy.ecr_power_user.arn
}
