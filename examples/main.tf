module "my-eks" {
  source                                      = "../"
  cluster_name                                = "test_eks_cluster"
  endpoint_private_access                     = false
  endpoint_public_access                      = true
  public_access_cidrs                         = ["0.0.0.0/0"]
  authentication_mode                         = "CONFIG_MAP"
  bootstrap_cluster_creator_admin_permissions = true

  tags = {
    Name = "My_eks_cluster"
  }
}
