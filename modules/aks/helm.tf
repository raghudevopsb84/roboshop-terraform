resource "null_resource" "kubeconfig" {
  provisioner "local-exec" {
    command = "az aks get-credentials --name ${var.name} --resource-group ${var.rg_name} --overwrite-existing"
  }
}

resource "helm_release" "external-secrets" {
  depends_on = [
    null_resource.kubeconfig
  ]

  name             = "external-secrets"
  repository       = "https://charts.external-secrets.io"
  chart            = "external-secrets"
  namespace        = "devops"
  create_namespace = true
  set {
    name  = "installCRDs"
    value = "true"
  }
}

