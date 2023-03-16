terraform {
  required_providers {
    kind = {
      source = "tehcyx/kind"
      version = "0.0.13"
    }
  }
}

provider "kind" {}

  resource "kind_cluster" "default" {
    name = "kindcluster"
    node_image = "kindest/node:v1.24.0"
    wait_for_ready = true
    
    kind_config {
      kind = "Cluster"
      api_version = "kind.x-k8s.io/v1alpha4"

      node {
        role = "control-plane"
      }

      node {
        role = "worker"
      }
    }
  }

#module "kube" {
 # source = "./modules/kube-prometheus"
  #kube-version = "36.2.0"
#}

provider "helm" { 
  kubernetes {
    #host = module.eks.endpoint
    #token = module.eks.myapp-eks-cluster.token
    #cluster_ca_certificate = base64decode(module.eks.certificate_authority[0].data)
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
 # host                   = data.aws_eks_cluster.cluster.endpoint
  #cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  #token                  = data.aws_eks_cluster_auth.cluster.token
  #host = module.eks.endpoint
  #token = module.eks.myapp-eks-cluster.token
  #cluster_ca_certificate = base64decode(module.eks.certificate_authority[0].data)  
  config_path = pathexpand(var.kube_config)
}