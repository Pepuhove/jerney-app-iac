module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name = var.repository_name

  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 30 images"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 30
        }
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}