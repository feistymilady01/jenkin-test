resource "helm_release" "kube-prometheus" {
  depends_on = [kubernetes_namespace.monitoring]
  name       = "kube-prometheus-stackr"
  namespace  = var.namespace
  version    = "45.7.1"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
}