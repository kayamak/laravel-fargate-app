module "nginx" {
  source = "../../../modules/ecr"
  name   = "example-prod-${local.service_name}-nginx"
}

module "php" {
  source = "../../../modules/ecr"
  name   = "example-prod-${local.service_name}-php"
}
