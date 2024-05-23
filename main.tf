# Data block to fetch the SSO admin instance. Once you enabled SSO admin from console, you need data block to fetch this in your code.

data "aws_ssoadmin_instances" "example" {}


# Create Custom Permission Set for S3 Read only
resource "aws_ssoadmin_permission_set" "mypermissionset" {
  name         = var.permission_set_name
  instance_arn = tolist(data.aws_ssoadmin_instances.example.arns)[0]
}

data "aws_iam_policy_document" "example" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }
}

resource "aws_ssoadmin_managed_policy_attachment" "s3_admin_managed_policy_attachment" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.example.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  permission_set_arn = aws_ssoadmin_permission_set.mypermissionset.arn

}
# Custom permission set Inline policy 
resource "aws_ssoadmin_permission_set_inline_policy" "example" {
  inline_policy      = data.aws_iam_policy_document.example.json
  instance_arn       = tolist(data.aws_ssoadmin_instances.example.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.mypermissionset.arn
}


# Create Managed Permission Set for full  EC2 Admin 
resource "aws_ssoadmin_permission_set" "ec2_admin_permissionset" {
  name         = "ec2-admin-permissionset"
  instance_arn = tolist(data.aws_ssoadmin_instances.example.arns)[0]
}

resource "aws_ssoadmin_managed_policy_attachment" "ec2_admin_managed_policy_attachment" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.example.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  permission_set_arn = aws_ssoadmin_permission_set.ec2_admin_permissionset.arn

}
