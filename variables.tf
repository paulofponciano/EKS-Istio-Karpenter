variable "cluster_name" {
  description = "Name of the Kubernetes cluster."
  type        = string
}

variable "environment" {
  description = "The environment for deployment (e.g., dev, staging, production)."
  type        = string
}

variable "project" {
  description = "The project name to associate with the resources."
  type        = string
}

variable "aws_region" {
  description = "The AWS region where resources will be deployed."
  type        = string
}

variable "az1" {
  description = "The first availability zone for the deployment."
  type        = string
}

variable "az2" {
  description = "The second availability zone for the deployment."
  type        = string
}

variable "k8s_version" {
  description = "The version of Kubernetes to deploy."
  type        = string
}

variable "instance_type" {
  description = "List of instance types for the cluster nodes."
  type        = list(string)
}

variable "enabled_cluster_log_types" {
  description = "List of log types to enable for the cluster (e.g., API, audit, authenticator)."
  type        = list(string)
}

variable "create_cluster_access_entry" {
  description = "Flag to indicate whether to create additional IAM access entries for the cluster."
  type        = bool
  default     = false
}

variable "cluster_role_or_user_arn_access_entry" {
  description = "List of IAM Role or User ARNs to grant cluster access."
  type        = list(string)
  default     = ["arn:aws:iam::ACCOUNT_ID:user/USER1"]
}

variable "endpoint_private_access" {
  description = "Enable or disable private access to the cluster API endpoint."
  type        = bool
}

variable "desired_size" {
  description = "Desired number of nodes in the cluster."
  type        = string
}

variable "min_size" {
  description = "Minimum number of nodes in the cluster."
  type        = string
}

variable "max_size" {
  description = "Maximum number of nodes in the cluster."
  type        = string
}

variable "karpenter_instance_class" {
  description = "List of instance classes to be used by Karpenter."
  type        = list(any)
}

variable "karpenter_instance_size" {
  description = "List of instance sizes to be used by Karpenter."
  type        = list(any)
}

variable "karpenter_capacity_type" {
  description = "List of capacity types (e.g., spot, on-demand) for Karpenter."
  type        = list(any)
}

variable "karpenter_azs" {
  description = "List of availability zones to be used by Karpenter."
  type        = list(any)
}

variable "nlb_ingress_internal" {
  description = "Enable or disable internal NLB ingress."
  type        = bool
}

variable "enable_cross_zone_lb" {
  description = "Enable or disable cross-zone load balancing."
  type        = bool
}

variable "nlb_ingress_type" {
  description = "Type of NLB ingress (e.g., internet-facing, internal)."
  type        = string
}

variable "proxy_protocol_v2" {
  description = "Enable or disable Proxy Protocol v2 for the load balancer."
  type        = bool
}

variable "addon_cni_version" {
  description = "The version of the VPC CNI add-on to use."
  type        = string
}

variable "addon_coredns_version" {
  description = "The version of the CoreDNS add-on to use."
  type        = string
}

variable "addon_kubeproxy_version" {
  description = "The version of the Kubeproxy add-on to use."
  type        = string
}

variable "addon_csi_version" {
  description = "The version of the CSI add-on to use."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnet_az1_cidr" {
  description = "The CIDR block for the public subnet in the first availability zone."
  type        = string
}

variable "public_subnet_az2_cidr" {
  description = "The CIDR block for the public subnet in the second availability zone."
  type        = string
}

variable "private_subnet_az1_cidr" {
  description = "The CIDR block for the private subnet in the first availability zone."
  type        = string
}

variable "private_subnet_az2_cidr" {
  description = "The CIDR block for the private subnet in the second availability zone."
  type        = string
}

variable "tags" {
  description = "A map of AWS tags to add to all created resources."
  type        = map(string)
}
