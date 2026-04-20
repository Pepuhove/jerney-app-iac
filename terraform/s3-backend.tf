terraform {
  backend "s3" {
    bucket  = "jerney-tf-state-bucket"
    key     = "jerney/terraform.tfstate"
    region  = "af-south-1"
    encrypt = true
    # Native S3 locking (Recommended for Terraform 1.10+)
    use_lockfile = true
  }
}
#