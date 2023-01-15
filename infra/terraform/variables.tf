# test
variable "project_id" {
  type        = string
  description = "GCP Project ID"
  default     = "jaylabs-sandbox"
}

variable "project_name" {
  type        = string
  description = "Short name of the project"
  default     = "jaylabs"
}

variable "region" {
  type        = string
  description = "Set region"
  default     = "us-west1"
}

variable "zones" {
  type        = list(string)
  description = "Set list of zones for the GKE cluster"
  default     = ["us-west1-a", "us-west1-b", "us-west1-c"]
}

variable "subnetwork_cidr" {
  type        = string
  description = "Subnetwork CIDR"
  default     = "10.210.0.0/17"
}

variable "pods_subnetwork_cidr" {
  type        = string
  description = "Pods subnetwork CIDR"
  default     = "172.20.128.0/18"
}

variable "svcs_subnetwork_cidr" {
  type        = string
  description = "Services subenetwork CIDR"
  default     = "172.20.0.0/18"
}

variable "k8s_namespaces" {
  type        = list(string)
  description = "The list of namespaces to create on Kubernetes"
  default = [
    "monitoring",
    "staging",
    "production"
  ]
}

variable "cluster_issuer_yaml" {
  description = "Create Cluster Issuer with yaml"
  type        = string
  default     = null
}

variable "solvers" {
  description = "List of Cert manager solvers"
  type        = any
  default = [{
    http01 = {
      ingress = {
        class = "nginx"
      }
    }
  }]
}

variable "duckdns_token" {
  type        = string
  description = "Duck DNS token"
  default     = "xxxxxxxxxxx"
}
