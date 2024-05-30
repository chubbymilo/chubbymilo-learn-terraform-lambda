output "s3_name" {
  description = "The name of the s3 bucket"
  value       = aws_s3_bucket.my_s3_bucket_jz.bucket
}