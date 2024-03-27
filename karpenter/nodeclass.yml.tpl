apiVersion: karpenter.k8s.aws/v1beta1
kind: EC2NodeClass
metadata:
  name: ${EKS_CLUSTER}-default
spec:
  amiFamily: AL2
  role: "role-pegasus-staging-eks-nodes"
  subnetSelectorTerms:
    - tags:
        karpenter.sh/discovery: "true"
  securityGroupSelectorTerms:
    - tags:
        aws:eks:cluster-name: ${EKS_CLUSTER}
  blockDeviceMappings:
    - deviceName: /dev/xvda
      ebs:
        volumeSize: 50Gi
        volumeType: gp3
        iops: 3000
        deleteOnTermination: true
        throughput: 125