#data "aws_eks_cluster" "myapp-eks-cluster"{
 # depends_on = [module.myapp-eks-cluster]
 # name = "myapp-eks-cluster"
#}

#data "aws_eks_cluster_auth" "myapp-eks-cluster"{
 # depends_on = [module.myapp-eks-cluster]
  #name = "myapp-eks-cluster"
#}


data "aws_region" "current" {}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}