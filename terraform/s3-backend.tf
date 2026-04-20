terraform {
  backend "s3" {
    bucket         = "jerney-tf-state-bucket"
    key            = "jerney/terraform.tfstate"
    region         = var.aws_region
    encrypt        = true
    # Native S3 locking (Recommended for Terraform 1.10+)
    use_lockfile   = true
  }
}