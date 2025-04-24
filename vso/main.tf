resource "kubernetes_namespace" "vault_secrets_operator" {
  metadata {
    name = "vault-secrets-operator"
  }
}

resource "helm_release" "vault_secrets_operator" {
  depends_on = [kubernetes_namespace.vault_secrets_operator]
  name       = "vault-secrets-operator"
  namespace  = kubernetes_namespace.vault_secrets_operator.metadata[0].name
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault-secrets-operator"
  #version    = "0.3.0" # Optional: pin to a specific version
}
