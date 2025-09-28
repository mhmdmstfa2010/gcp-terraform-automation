# GCP Terraform Project - Root Configuration
terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  backend "gcs" {
    bucket = "my-terraform-state-bucket"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  project_id = var.project_id
  vpc_name   = var.vpc_name
}

# Subnets Module
module "subnets" {
  source = "./modules/subnets"

  project_id = var.project_id
  region     = var.region
  vpc_name   = var.vpc_name
  subnets    = var.subnets

  depends_on = [module.vpc]
}

# Firewall Module
module "firewall" {
  source = "./modules/firewall"

  project_id     = var.project_id
  vpc_name       = var.vpc_name
  firewall_rules = var.firewall_rules

  depends_on = [module.vpc]
}

# IAM Module
module "iam" {
  source = "./modules/iam"

  project_id   = var.project_id
  iam_bindings = var.iam_bindings
}

# Service Accounts Module
module "service_accounts" {
  source = "./modules/service_accounts"

  project_id       = var.project_id
  service_accounts = var.service_accounts
}

# Storage Module
module "storage" {
  source = "./modules/storage"

  project_id = var.project_id
  buckets    = var.buckets
}

# Compute Module
module "compute" {
  source = "./modules/compute"

  project_id  = var.project_id
  region      = var.region
  zone        = var.zone
  vpc_name    = var.vpc_name
  subnet_name = length(var.subnets) > 0 ? var.subnets[0].name : ""
  instances   = var.instances

  depends_on = [module.subnets, module.firewall]
}

# CloudSQL Module
module "cloudsql" {
  source = "./modules/cloudsql"

  project_id    = var.project_id
  region        = var.region
  vpc_name      = module.vpc.vpc_name
  sql_instances = var.sql_instances

  depends_on = [module.vpc]
}

# GKE Module
module "gke" {
  source = "./modules/gke"

  project_id   = var.project_id
  region       = var.region
  vpc_name     = var.vpc_name
  subnet_name  = length(var.subnets) > 0 ? var.subnets[0].name : ""
  gke_clusters = var.gke_clusters

  depends_on = [module.subnets, module.firewall]
}

# GKE Node Pool Module
module "gke_nodepool" {
  source = "./modules/gke_nodepool"

  project_id       = var.project_id
  region           = var.region
  gke_cluster_name = length(var.gke_clusters) > 0 ? var.gke_clusters[0].name : ""
  node_pools       = var.node_pools

  depends_on = [module.gke]
}

# DNS Module
module "dns" {
  source = "./modules/dns"

  project_id = var.project_id
  dns_zones  = var.dns_zones
}

# Load Balancer Module
module "loadbalancer" {
  source = "./modules/loadbalancer"

  project_id     = var.project_id
  region         = var.region
  vpc_name       = var.vpc_name
  load_balancers = var.load_balancers

  depends_on = [module.vpc, module.compute]
}
