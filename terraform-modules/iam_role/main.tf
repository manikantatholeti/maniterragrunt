resource "aws_iam_role" "fiserv_role" {
  name = "${var.iam_role_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "tag-value"
  }
}
resource "aws_iam_instance_profile" "fiserv_profile" {
  name = var.iam_role_profile
  role = aws_iam_role.fiserv_role.name
}
resource "aws_iam_role_policy" "fiserv_policy" {
  name = var.iam_role_policy
  role = aws_iam_role.fiserv_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}