## PROJECT BASE

cluster_name = "pegasus"
environment  = "stg"
project      = "devops"
aws_region   = "us-east-2"
az1          = "us-east-2a"
az2          = "us-east-2b"

## CLUSTER OPTIONS

k8s_version = "1.27"

endpoint_private_access = true

instance_type = [
  "m5.large"
]

cluster_autoscaler = "true"
desired_size       = "2"
min_size           = "1"
max_size           = "3"

enabled_cluster_log_types = [
  "api", "audit", "authenticator", "controllerManager", "scheduler"
]

nlb_ingress_internal         = "false"
nlb_ingress_type             = "network"
proxy_protocol_v2            = "false"
descheduler                  = "true"
addon_cni_version            = "v1.13.4-eksbuild.1"
addon_coredns_version        = "v1.10.1-eksbuild.2"
addon_kubeproxy_version      = "v1.27.3-eksbuild.2"
addon_csi_version            = "v1.21.0-eksbuild.1"

## NETWORKING

vpc_cidr                = "10.0.0.0/16"
public_subnet_az1_cidr  = "10.0.16.0/20"
public_subnet_az2_cidr  = "10.0.32.0/20"
private_subnet_az1_cidr = "10.0.48.0/20"
private_subnet_az2_cidr = "10.0.64.0/20"