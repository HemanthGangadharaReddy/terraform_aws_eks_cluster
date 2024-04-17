variable "eks_role_name" {
  description = "Name of the IAM role"
  default     = "eks-role"
}

variable "region" {
  description = "The region in which the infrastructure will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "subnet_cidr" {
  description = "CIDR blocks for the subnets."
  type        = list(string)
  default     = ["10.0.0.0/18", "10.0.64.0/18", "10.0.128.0/18", "10.0.192.0/18"]
}


variable "availability_zone" {
  description = "Availability zones for the subnets."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1a", "us-east-1b", "us-east-1b"]
}

variable "subnet_name" {
  description = "Names of the subnets."
  type        = list(string)
  default     = ["public_subnet_1", "public_subnet_2", "private_subnet_1", "private_subnet_2"]
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "EKS-Cluster1"
}

variable "kubernetes_version" {
  description = "Desired Kubernetes master version"
  type        = string
  default = "1.27"
}

# variable "security_group_ids" {
#   description = "List of security group IDs to associate with EKS resources"
#   type        = list(string)
#   default = ["sg-0920f778608dc3bf1"]
# }

variable "endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
  default     = false
}

variable "endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
  default     = true
}

variable "public_access_cidrs" {
  description = "CIDR blocks for Amazon EKS public API server endpoint access"
  type        = list(string)
  default = ["0.0.0.0/0"]
}

variable "enabled_cluster_log_types" {
  description = "A list of the desired control plane logging to enable"
  type        = list(string)
  default     = []
}

variable "encryption_config" {
  description = "Configuration block with server-side encryption settings for the cluster"
  type        = any
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

variable "authentication_mode" {
  description = "The authentication mode for the cluster"
  type = string
  default = "CONFIG_MAP"
}

variable "bootstrap_cluster_creator_admin_permissions" {
  description = "Whether or not to bootstrap the access config values to the cluster"
  type = bool
  default = true
}

variable "kubernetes_network_config" {
  description = "Configuration block for Kubernetes network settings"
  type        = any
  default     = null
}
