terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=3.11.0"
}

inputs = {
  azs = ["eu-west-1a", "eu-west-1b"]
}
