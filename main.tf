resource "google_cloud_run_service" "m99" {
    name     = "m99"
    location = "europe-north1"
    project = var.project_id

    template {
        spec {
            containers {
                image = "gcr.io/${var.project_id}/exam@sha256:effbe863ed8c389061102b2fc66abd11da5a6e83b854d175aaadf0759bea96c7"
                
                env {
                    name = "LOGZ_TOKEN"
                    value = var.logz_token
                }

                env {
                    name = "LOGZ_URL"
                    value = var.logz_url
                }

                resources {
                    limits = {
                        memory = "512Mi"
                    }
                }
            }
        }
    }

    traffic {
        percent = 100
        latest_revision = true
    }
}

data "google_iam_policy" "noauth" {
    binding {
        role = "roles/run.invoker"
        members = [
            "allUsers",
        ]
    }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
    location    = google_cloud_run_service.m99.location
    project     = google_cloud_run_service.m99.project
    service     = google_cloud_run_service.m99.name
    policy_data = data.google_iam_policy.noauth.policy_data
}