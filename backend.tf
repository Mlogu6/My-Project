terraform {
  backend "s3" {
    bucket         = "myproject-tf-state"
    key            = "myproject/myproject.terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "myproject-tf-lock"
  }
}
