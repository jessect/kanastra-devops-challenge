# Create the namespaces of the environments
resource "kubernetes_namespace" "ns" {
  for_each = toset(var.k8s_namespaces)
  metadata {
    name = each.key
  }

  lifecycle {
    ignore_changes = [
      metadata[0].labels,
    ]
  }

  depends_on = [module.gke]
}

# Create docker pull secret for K8s
locals {
  docker_pull_secret = {
    ".dockerconfigjson" = jsonencode({
      "auths" : {
        "https://gcr.io" : {
          email    = google_service_account.gcr.email
          username = "_json_key"
          password = trimspace(base64decode(google_service_account_key.gcr.private_key))
          auth     = base64encode(join(":", ["_json_key", base64decode(google_service_account_key.gcr.private_key)]))
        }
      }
    })
  }
}

resource "kubernetes_secret" "gcr" {
  for_each = toset(var.k8s_namespaces)
  metadata {
    name      = "${var.project_name}-gcr"
    namespace = each.value
  }
  data = local.docker_pull_secret

  type       = "kubernetes.io/dockerconfigjson"
  depends_on = [kubernetes_namespace.ns]
}
