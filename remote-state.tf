terraform {
  backend "remote" {
      hostname = "app.terraform.io"
      organization = "your-organization-here"
  
  
  workspaces{
      name = "your-workspace-here"
    }
  }
}