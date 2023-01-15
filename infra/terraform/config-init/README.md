## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.48.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project.challenge](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/project) | resource |
| [google_project_iam_member.terraform](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/project_iam_member) | resource |
| [google_project_service.gcp_services](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/project_service) | resource |
| [google_service_account.terraform](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/service_account) | resource |
| [google_service_account_key.terraform](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/service_account_key) | resource |
| [google_storage_bucket.tfstate](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account_id"></a> [billing\_account\_id](#input\_billing\_account\_id) | Billing ID for the project | `string` | `"0X0X0X-0X0X0X-0X0X0X"` | no |
| <a name="input_bucket_force_destroy"></a> [bucket\_force\_destroy](#input\_bucket\_force\_destroy) | Set flag on force destroy bucket | `bool` | `true` | no |
| <a name="input_bucket_location"></a> [bucket\_location](#input\_bucket\_location) | Bucket storage location | `string` | `"US"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket name to store Terraform state | `string` | `"jaylabs-tfstate"` | no |
| <a name="input_gcp_services"></a> [gcp\_services](#input\_gcp\_services) | List of required service APIs for the project | `list(string)` | <pre>[<br>  "cloudresourcemanager.googleapis.com",<br>  "serviceusage.googleapis.com",<br>  "container.googleapis.com",<br>  "gkehub.googleapis.com",<br>  "gkeconnect.googleapis.com",<br>  "logging.googleapis.com",<br>  "monitoring.googleapis.com",<br>  "compute.googleapis.com",<br>  "storage.googleapis.com",<br>  "servicenetworking.googleapis.com",<br>  "iam.googleapis.com"<br>]</pre> | no |
| <a name="input_project_creation_enabled"></a> [project\_creation\_enabled](#input\_project\_creation\_enabled) | Enable GCP project creation | `bool` | `false` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP Project ID | `string` | `"jaylabs-sandbox"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | GCP project name | `string` | `"JayLabs - Sandbox"` | no |
| <a name="input_project_prefix"></a> [project\_prefix](#input\_project\_prefix) | Short name of the project | `string` | `"jaylabs"` | no |
| <a name="input_region"></a> [region](#input\_region) | Set region | `string` | `"us-west1"` | no |
| <a name="input_tf_roles"></a> [tf\_roles](#input\_tf\_roles) | List of required roles for Terraform service account | `list(string)` | <pre>[<br>  "roles/compute.networkAdmin",<br>  "roles/storage.objectCreator",<br>  "roles/container.admin"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_tfstate"></a> [bucket\_tfstate](#output\_bucket\_tfstate) | Bucket to store Terraform state |
| <a name="output_gsa_private_key_terraform"></a> [gsa\_private\_key\_terraform](#output\_gsa\_private\_key\_terraform) | Export terraform service account private key |
