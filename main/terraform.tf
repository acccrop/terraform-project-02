terraform {
  required_version = ">= 0.13"
  backend "s3" {
    bucket         = "dev-oip-terraform"
    dynamodb_table = "terraform"
    encrypt        = true
    key            = "dev/terraform.tfstate"
    region         = "eu-west-2"
  }
}
