resource "statuscake_test" "googlecloudruntest" {
    website_name  = "PGR301-M99"
    website_url   = google_cloud_run_service.m99.status[0].url
    test_type     = "HTTP"
    check_rate    = 300
    contact_group = ["195567"]
}