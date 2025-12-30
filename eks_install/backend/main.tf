provider "aws" {
  region = "us-west-1"
}

resource "aws_s3_bucket" "backend" {
  bucket = "nandan-terraform-eks-backend-bucket"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "nandan-dynamo-table" {
  name = "nandan-terraform-eks-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
