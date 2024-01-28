
terraform {
  backend "git" {
    repository = "https://srinivasmunugoti/terraform_python_githubactions"
    ref: main
    file = "terraform/backend/tfstate.json
  }
}
