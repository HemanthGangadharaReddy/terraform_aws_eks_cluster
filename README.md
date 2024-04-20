Terraform Module for aws_eks_cluster

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_role"></a> [iam\_role](#module\_iam\_role) | github.com/HemanthGangadharaReddy/terraform-eks-iam-role/modules/eks-cluster-role | n/a |
| <a name="module_kms"></a> [kms](#module\_kms) | github.com/saikrishnama/terraform-module-aws-kms | n/a |
| <a name="module_subnets"></a> [subnets](#module\_subnets) | github.com/HemanthGangadharaReddy/terraform_aws_vpc/modules/aws_subnet | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | github.com/HemanthGangadharaReddy/terraform_aws_vpc/modules/aws_vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authentication_mode"></a> [authentication\_mode](#input\_authentication\_mode) | The authentication mode for the cluster. Valid values are `CONFIG_MAP`, `API` or `API_AND_CONFIG_MAP` | `string` | `"CONFIG_MAP"` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Availability zones for the subnets. | `list(string)` | <pre>[<br>  "us-east-1a",<br>  "us-east-1a",<br>  "us-east-1b",<br>  "us-east-1b"<br>]</pre> | no |
| <a name="input_bootstrap_cluster_creator_admin_permissions"></a> [bootstrap\_cluster\_creator\_admin\_permissions](#input\_bootstrap\_cluster\_creator\_admin\_permissions) | Whether or not to bootstrap the access config values to the cluster | `bool` | `true` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS cluster | `string` | `"EKS-Cluster1"` | no |
| <a name="input_eks_role_name"></a> [eks\_role\_name](#input\_eks\_role\_name) | Name of the IAM role | `string` | `"eks-role"` | no |
| <a name="input_enabled_cluster_log_types"></a> [enabled\_cluster\_log\_types](#input\_enabled\_cluster\_log\_types) | A list of the desired control plane logging to enable | `list(string)` | `[]` | no |
| <a name="input_endpoint_private_access"></a> [endpoint\_private\_access](#input\_endpoint\_private\_access) | Indicates whether or not the Amazon EKS private API server endpoint is enabled | `bool` | `false` | no |
| <a name="input_endpoint_public_access"></a> [endpoint\_public\_access](#input\_endpoint\_public\_access) | Indicates whether or not the Amazon EKS public API server endpoint is enabled | `bool` | `true` | no |
| <a name="input_ip_family"></a> [ip\_family](#input\_ip\_family) | The IP family used to assign Kubernetes pod and service addresses. Valid values are ipv4 (default) and ipv6 | `string` | `"ipv4"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Desired Kubernetes master version | `string` | `"1.27"` | no |
| <a name="input_public_access_cidrs"></a> [public\_access\_cidrs](#input\_public\_access\_cidrs) | CIDR blocks for Amazon EKS public API server endpoint access | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The region in which the infrastructure will be deployed | `string` | `"us-east-1"` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | List of strings with resources to be encrypted | `list(string)` | <pre>[<br>  "secrets"<br>]</pre> | no |
| <a name="input_service_ipv4_cidr"></a> [service\_ipv4\_cidr](#input\_service\_ipv4\_cidr) | The CIDR block to assign Kubernetes pod and service IP addresses from. If you don't specify a block, Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks. | `string` | `null` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | CIDR blocks for the subnets. | `list(string)` | <pre>[<br>  "10.0.0.0/18",<br>  "10.0.64.0/18",<br>  "10.0.128.0/18",<br>  "10.0.192.0/18"<br>]</pre> | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Names of the subnets. | `list(string)` | <pre>[<br>  "public_subnet_1",<br>  "public_subnet_2",<br>  "private_subnet_1",<br>  "private_subnet_2"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_authority_data"></a> [certificate\_authority\_data](#output\_certificate\_authority\_data) | Base64 encoded certificate data required to communicate with your cluster |
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | The Amazon Resource Name (ARN) of the cluster |
| <a name="output_cluster_created_at"></a> [cluster\_created\_at](#output\_cluster\_created\_at) | Unix epoch timestamp in seconds for when the cluster was created |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Endpoint for your Kubernetes API server |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The ID of the EKS cluster |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of the EKS Cluster |
| <a name="output_cluster_platform_version"></a> [cluster\_platform\_version](#output\_cluster\_platform\_version) | Platform version for the cluster |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | Cluster security group that was created by Amazon EKS for the cluster |
| <a name="output_cluster_status"></a> [cluster\_status](#output\_cluster\_status) | Status of the EKS cluster. One of CREATING, ACTIVE, DELETING, FAILED |
| <a name="output_oidc_issuer_url"></a> [oidc\_issuer\_url](#output\_oidc\_issuer\_url) | Issuer URL for the OpenID Connect identity provider |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the VPC associated with your cluster |
<!-- END_TF_DOCS -->
