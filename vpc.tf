
module "backend" {
  source = "github.com/srinivasmunugoti/terraform_python_githubactions"
  backend_bucket = "terraform-state-bucket"
  # using options, e.g. if you dont want a dynamodb lock table, uncomment this:
  # dynamodb_lock_table_enabled = false
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = true
 # single_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
