terraform {
    required_providers {
        statuscake = {
            source = "terraform-providers/statuscake"
        }
        google = {
            source = "hashicorp/google"
        }
    }
}

terraform {
    backend "gcs" {
        bucket = "pgr301-m99-bucket"
        prefix = "terraformstate"
        credentials = "terraform.json"
    }
}

provider "google" {
    credentials = file("terraform.json")
    project = var.project_id
    version = "3.5.0"
}

provider "statuscake" {
    username = var.statuscake_username
    version = "~> 1.0.0"
}
