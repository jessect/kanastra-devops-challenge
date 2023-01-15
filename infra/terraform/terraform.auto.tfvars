# Project config
project_id   = "jaylabs-kanastra-challenge"
project_name = "kanastra"
region       = "us-west1"
zones        = ["us-west1-a", "us-west1-b", "us-west1-c"]

# Network config
subnetwork_cidr      = "10.210.0.0/20"
svcs_subnetwork_cidr = "192.168.32.0/27" # Smallest possible Service address range
pods_subnetwork_cidr = "192.168.64.0/21" # Smallest possible Pod IP range

# Reference:
# https://cloud.google.com/kubernetes-engine/docs/concepts/alias-ips#range_management

# K8s config
k8s_namespaces = [
  "development",
  "staging",
  "production"
]


# App service account roles
app_roles = [
  "roles/storage.legacyBucketWriter", # Push (write) images to and pull (read) images from an existing registry host in a project
  "roles/container.developer"         # Access to Kubernetes API objects
]
