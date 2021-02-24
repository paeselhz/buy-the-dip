output "url" {
  value = google_cloud_run_service.buy-the-dip.status[0].url
}