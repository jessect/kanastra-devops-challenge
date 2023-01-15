# Install ingress controller (nginx)
resource "helm_release" "nginx" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true
  # version          = "4.2.0"
  timeout = 900

  values = [<<EOF
fullnameOverride: ingress-nginx
controller:
  resources:
    requests:
      cpu: 500m
      memory: 256Mi
    limits:
      memory: 512Mi
  service:
    externalTrafficPolicy: Local
    loadBalancerIP: "${google_compute_address.lb.address}"
  autoscaling:
    enabled: true
    minReplicas: 3
    maxReplicas: 6
    targetCPUUtilizationPercentage: 60
    targetMemoryUtilizationPercentage: 80
EOF
  ]

  depends_on = [module.gke]
}

# Install loki-stack
resource "helm_release" "loki_stack" {
  name             = "loki-stack"
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "loki-stack"
  namespace        = "monitoring"
  create_namespace = true
  # version    = "2.8.9"
  timeout = 900

  values = [<<EOF
grafana:
  enabled: true
  ingress:
    enabled: true
    annotations:
      kubernetes.io/ingress.class: "nginx"
      cert-manager.io/cluster-issuer: "letsencrypt"
    hosts:
      - kanastra-grafana.duckdns.org
    tls:
      - secretName: grafana-secret
        hosts:
          - kanastra-grafana.duckdns.org
prometheus:
  enabled: true
EOF
  ]
  depends_on = [module.gke]
}

# Install cert-manager (letsencrypt)
resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  # version          = "v1.5.3"
  timeout = 900

  values = [<<EOF
fullnameOverride: cert-manager
installCRDs: true
ingressShim:
  defaultIssuerName: "letsencrypt"
  defaultIssuerKind: "ClusterIssuer"
  defaultIssuerGroup: "cert-manager.io"
EOF
  ]

  depends_on = [helm_release.nginx]
}

# Installs the app in the environments' namespaces
resource "helm_release" "app" {
  for_each  = toset(var.k8s_namespaces)
  name      = "kanastra-app"
  namespace = each.value
  chart     = "../helm/kanastra-app"

  values = [
    file("../helm/${each.value}-values.yaml")
  ]

  depends_on = [kubernetes_namespace.ns]
}
