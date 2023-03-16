resource "kubernetes_namespace" "monitoring" {
# depends_on = [aws_eks_node_group.Eks-node_group, kubernetes_deployment.web_app] 
  metadata {
    name = var.namespace
  }
}