terraform {
  backend "gcs" {
    bucket = "kanastra-tfstate"
    prefix = "terraform/state"
  }
}
