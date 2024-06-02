module "vpc" {
  source             = "./module/networking"
  cidr_block         = "10.0.0.0/16"
  public_cidr_block  = "10.0.1.0/24"
  private_cidr_block = "10.0.2.0/24"
  route_cidrBlock    = "0.0.0.0/0"
  nat_gateway        = "public"
  publictags         = "publictags"
  privatetags        = "privatetags"
  tags               = "vpctags"
  map_public_ip_on_launch = true
}