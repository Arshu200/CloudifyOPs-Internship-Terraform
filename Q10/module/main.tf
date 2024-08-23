resource "aws_s3_bucket" "this" {
  count = var.create_bucket ? 1 : 0

  bucket = var.bucket_name
  versioning {
    enabled = true
  }
  tags = var.tags
}
