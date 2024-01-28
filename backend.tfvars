
terraform {
  backend "git" {
    git.repository = "https://srinivasmunugoti/terraform_python_githubactions"
    git.ref= "main"
    git.state = "terraform/state.json
  }
}
