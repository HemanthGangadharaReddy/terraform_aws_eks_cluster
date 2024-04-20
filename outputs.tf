output "cluster_name" {
  description = "Name of the EKS Cluster"
  value       = aws_eks_cluster.eks_cluster.name
}

output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster"
  value       = aws_eks_cluster.eks_cluster.arn
}

output "certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with your cluster"
  value       = aws_eks_cluster.eks_cluster.certificate_authority[*].data
}

output "cluster_endpoint" {
  description = "Endpoint for your Kubernetes API server"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_id" {
  description = "The ID of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.cluster_id
}

output "oidc_issuer_url" {
  description = "Issuer URL for the OpenID Connect identity provider"
  value       = aws_eks_cluster.eks_cluster.identity[*].oidc[*].issuer
}

output "cluster_platform_version" {
  description = "Platform version for the cluster"
  value       = aws_eks_cluster.eks_cluster.platform_version
}

output "cluster_status" {
  description = "Status of the EKS cluster. One of CREATING, ACTIVE, DELETING, FAILED"
  value       = aws_eks_cluster.eks_cluster.status
}

output "cluster_created_at" {
  description = "Unix epoch timestamp in seconds for when the cluster was created"
  value       = aws_eks_cluster.eks_cluster.created_at
}

output "cluster_security_group_id" {
  description = "Cluster security group that was created by Amazon EKS for the cluster"
  value       = aws_eks_cluster.eks_cluster.vpc_config[*].security_group_ids
}

output "vpc_id" {
  description = "ID of the VPC associated with your cluster"
  value       = aws_eks_cluster.eks_cluster.vpc_config[*].vpc_id
}
