provider "aws" {

  //shared_credentials_file = "/home/neosoft/.aws/credentials"
  profile                 = "own"
  region                  = var.aws_region




    default_tags {
    tags = {
    #   Environment = var.environment
    #   Name        = "${var.env}-infra"
    #   create_by = var.create_by
    #   Terraform = "true"
    }

}
}