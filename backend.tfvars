
terraform {
  backend "git" {
    repository = "https://github.com/srinivasmunugoti/terraform_python_githubactions.git"
    file = "terraform/backend/tfstate.json
  }
}
