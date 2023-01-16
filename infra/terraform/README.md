Test
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.48.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.8.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.10.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.16.1 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.48.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.8.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.16.1 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_router"></a> [cloud\_router](#module\_cloud\_router) | terraform-google-modules/cloud-router/google | ~> 4.0 |
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google//modules/private-cluster | 24.1.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-google-modules/network/google | 6.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_address.lb](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/compute_address) | resource |
| [google_project_iam_custom_role.app](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_member.app](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.gcr](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/project_iam_member) | resource |
| [google_service_account.app](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/service_account) | resource |
| [google_service_account.gcr](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/service_account) | resource |
| [google_service_account_key.app](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/service_account_key) | resource |
| [google_service_account_key.gcr](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/service_account_key) | resource |
| [helm_release.app](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.loki_stack](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.nginx](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.cluster_issuer](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace.ns](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.gcr](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [null_resource.dns_update](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_roles"></a> [app\_roles](#input\_app\_roles) | List of required roles for App service account | `list(string)` | <pre>[<br>  "roles/storage.objectViewer",<br>  "roles/container.developer"<br>]</pre> | no |
| <a name="input_cluster_issuer_yaml"></a> [cluster\_issuer\_yaml](#input\_cluster\_issuer\_yaml) | Create Cluster Issuer with yaml | `string` | `null` | no |
| <a name="input_duckdns_token"></a> [duckdns\_token](#input\_duckdns\_token) | Duck DNS token | `string` | `"xxxxxxxxxxx"` | no |
| <a name="input_k8s_namespaces"></a> [k8s\_namespaces](#input\_k8s\_namespaces) | The list of namespaces to create on Kubernetes | `list(string)` | <pre>[<br>  "monitoring",<br>  "staging",<br>  "production"<br>]</pre> | no |
| <a name="input_pods_subnetwork_cidr"></a> [pods\_subnetwork\_cidr](#input\_pods\_subnetwork\_cidr) | Pods subnetwork CIDR | `string` | `"172.20.128.0/18"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP Project ID | `string` | `"jaylabs-sandbox"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Short name of the project | `string` | `"jaylabs"` | no |
| <a name="input_region"></a> [region](#input\_region) | Set region | `string` | `"us-west1"` | no |
| <a name="input_solvers"></a> [solvers](#input\_solvers) | List of Cert manager solvers | `any` | <pre>[<br>  {<br>    "http01": {<br>      "ingress": {<br>        "class": "nginx"<br>      }<br>    }<br>  }<br>]</pre> | no |
| <a name="input_subnetwork_cidr"></a> [subnetwork\_cidr](#input\_subnetwork\_cidr) | Subnetwork CIDR | `string` | `"10.210.0.0/17"` | no |
| <a name="input_svcs_subnetwork_cidr"></a> [svcs\_subnetwork\_cidr](#input\_svcs\_subnetwork\_cidr) | Services subenetwork CIDR | `string` | `"172.20.0.0/18"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Set list of zones for the GKE cluster | `list(string)` | <pre>[<br>  "us-west1-a",<br>  "us-west1-b",<br>  "us-west1-c"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gsa_private_key_app"></a> [gsa\_private\_key\_app](#output\_gsa\_private\_key\_app) | Get private key of the App service account |
| <a name="output_gsa_private_key_gcr"></a> [gsa\_private\_key\_gcr](#output\_gsa\_private\_key\_gcr) | Get private key of the Container Registry service account |
