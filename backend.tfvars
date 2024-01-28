terraform {
  backend "s3" {
    bucket = "my-hosted-terraform-state-bucket"
    key    = "terraform/backend/terraform.tfstate"
    region = "us-east-1"
  }
}

