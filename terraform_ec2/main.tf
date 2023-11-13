module "ec2_module" {
  source = "./modules/ec2"

  vpc_id     = module.vpc_module.vpc_id
  subnet_ids = module.vpc_module.subnet_ids
  key = "ssh-november"
}

module "vpc_module" {
  source = "./modules/vpc"

  # Variables for your VPC module
  cidr             = "10.0.0.0/16"
  name             = "my-vpc"
  subnets_cidr     = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones = ["eu-central-1a", "eu-central-1b"]
  map_public_ip_on_launch = true
  tags             = {
    "Terraform"   = "true"
    "Environment" = "dev"
  }
}
module "sns" {
  source = "./modules/SNS"
}