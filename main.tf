module "iam_role" {
  source    = "github.com/HemanthGangadharaReddy/terraform-eks-iam-role/modules/eks-cluster-role"
  role_name = var.eks_role_name
}

module "vpc" {
  source = "github.com/HemanthGangadharaReddy/terraform_aws_vpc/modules/aws_vpc"
}

module "subnets" {
  source            = "github.com/HemanthGangadharaReddy/terraform_aws_vpc/modules/aws_subnet"
  vpc_id            = module.vpc.vpc_id
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
  subnet_name       = var.subnet_name
}

module "kms" {
  source = "github.com/saikrishnama/terraform-module-aws-kms"
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = module.iam_role.eks_iam_role_arn
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids              = module.subnets.private_subnet_ids
    security_group_ids      = [module.vpc.security_group_id]
    endpoint_private_access = try(var.endpoint_private_access, false)
    endpoint_public_access  = try(var.endpoint_public_access, true)
    public_access_cidrs     = try(var.public_access_cidrs, "0.0.0.0/0")
  }

  enabled_cluster_log_types = var.enabled_cluster_log_types
  tags                      = var.tags

  access_config {
    authentication_mode                         = try(var.authentication_mode, "CONFIG_MAP")
    bootstrap_cluster_creator_admin_permissions = try(var.bootstrap_cluster_creator_admin_permissions, true)
  }

  encryption_config {
    provider {
      key_arn = module.kms.kms_arn[0]
    }
    resources = var.resources
  }

  kubernetes_network_config {
    service_ipv4_cidr = try(var.service_ipv4_cidr, null)
    ip_family         = try(var.ip_family, "ipv4")
  }

}
