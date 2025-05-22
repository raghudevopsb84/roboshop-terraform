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

resource "null_resource" "external-secrets-secret-store" {
  depends_on = [
    helm_release.external-secrets
  ]

  provisioner "local-exec" {
    command =<<TF
kubectl apply -f - <<KUBE
apiVersion: external-secrets.io/v1
kind: ClusterSecretStore
metadata:
  name: roboshop-${var.env}
spec:
  provider:
    vault:
      server: "http://vault-int.rdevopsb84.online:8200"
      path: "roboshop-${var.env}"
      version: "v2"
      auth:
        tokenSecretRef:
          name: "vault-token"
          key: "token"
          namespace: devops
---
apiVersion: v1
kind: Secret
metadata:
  name: vault-token
  namespace: devops
data:
  token: ${base64encode(var.token)}
KUBE
TF
  }
}

