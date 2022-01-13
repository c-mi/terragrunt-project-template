module "vpc" {
  source = "github.com/c-mi/terragrunt-project-template.git//modules/terraform-aws-vpc?ref=feature-egress-firewall"

  cidr            = var.cidr
  azs             = var.azs
  intra_subnets   = var.intra_subnets
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  map_public_ip_on_launch = false
  enable_nat_gateway      = true
  one_nat_gateway_per_az  = true

  enable_dns_hostnames             = true
  enable_dns_support               = true
  enable_dhcp_options              = true
  dhcp_options_domain_name_servers = ["AmazonProvidedDNS"]

}
