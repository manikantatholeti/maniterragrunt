resource "aws_iam_role" "cross_account_assume_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          AWS = var.assumable_accounts
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(
    {
      Name = var.name_tag
    },
    var.additional_tags
  )
}

resource "aws_iam_policy" "s3_dynamodb_policy" {
  name = var.policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = ["s3:CreateBucket"]
        Resource  = "*"
      },
      {
        Effect    = "Allow"
        Action    = ["dynamodb:CreateTable"]
        Resource  = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "s3_dynamodb_policy_attachment" {
  policy_arn = aws_iam_policy.s3_dynamodb_policy.arn
  role       = aws_iam_role.cross_account_assume_role.name
}
