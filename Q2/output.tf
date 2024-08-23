output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.bucketB.bucket
}

output "bucket_region" {
  value = aws_s3_bucket.bucketB.region
}