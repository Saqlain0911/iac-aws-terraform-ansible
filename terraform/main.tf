module "networking" {
  source = "./modules/networking"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  region             = var.aws_region
  project_name       = var.project_name
  environment        = var.environment
}

module "compute" {
  source = "./modules/compute"

  project_name    = var.project_name
  environment     = var.environment
  instance_type   = var.instance_type
  public_key_path = "../id_rsa_project.pub"

  subnet_id         = module.networking.public_subnet_id
  security_group_id = module.networking.web_sg_id
}
