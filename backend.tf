terraform {
backend "s3" {
    bucket         = "my-terraform-python-test"
    key            = "terraform/github/terraform.tfstate"
    region         = "us-east-1"
  
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}





