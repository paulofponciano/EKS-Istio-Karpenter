resource "helm_release" "karpenter" {
  namespace        = "karpenter"
  create_namespace = true

  name       = "karpenter"
  repository = "oci://public.ecr.aws/karpenter"
  chart      = "karpenter"
  version    = "v0.34.3"

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.karpenter_controller.arn
  }

  set {
    name  = "settings.clusterName"
    value = var.cluster_name
  }

  set {
    name  = "settings.clusterEndpoint"
    value = aws_eks_cluster.eks_cluster.endpoint
  }

  set {
    name  = "settings.aws.defaultInstanceProfile"
    value = aws_iam_instance_profile.karpenter.name
  }

  set {
    name  = "replicas"
    value = "1"
  }

  depends_on = [aws_eks_node_group.cluster]
}

resource "time_sleep" "wait_30_seconds_karpenter" {
  depends_on = [helm_release.karpenter]

  create_duration = "30s"
}

resource "kubectl_manifest" "karpenter_nodepool" {
  yaml_body = templatefile(
    "./karpenter/nodepool.yml.tpl", {
      EKS_CLUSTER        = var.cluster_name
      CAPACITY_TYPE      = var.karpenter_capacity_type
      INSTANCE_FAMILY    = var.karpenter_instance_class
      INSTANCE_SIZES     = var.karpenter_instance_size
      AVAILABILITY_ZONES = var.karpenter_azs
  })

  depends_on = [
    helm_release.karpenter,
    time_sleep.wait_30_seconds_karpenter
  ]
}

resource "kubectl_manifest" "karpenter_nodeclass" {
  yaml_body = templatefile(
    "./karpenter/nodeclass.yml.tpl", {
      EKS_CLUSTER = var.cluster_name
  })

  depends_on = [
    helm_release.karpenter,
    time_sleep.wait_30_seconds_karpenter
  ]
}
