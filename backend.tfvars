

terraform {
  backend "s3" {
    bucket = "my-terraform-python-test"
    key    = "terraform/pythongithub/terraform.tfstate"
    region = "us-east-1"
  }
}

