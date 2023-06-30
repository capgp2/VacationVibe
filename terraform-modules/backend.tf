terraform {
  backend "s3" {
    bucket = "vacation-vibe"
    region = "us-east-1"
    key    = "vacation-vibe/terraform.tfstate"
  }
}