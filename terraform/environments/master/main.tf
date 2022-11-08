provider "google" {
  region      = "${var.region}"
}

resource "google_project" "test_project" {
  name       = "test-project"
  project_id = "test-project-1"

  org_id = "${var.gsuite_org_id}"
  billing_account = "${var.billing_account_id}"
}

resource "google_project_iam_binding" "gsuite_project_owner" {
  project = "${google_project.test_project.project_id}"
  role    = "roles/owner"

  members = [
    "user:${var.gsuite_user}",
    "user:${var.billing_account_user}",
  ]
}


# resource "google_billing_account_iam_binding" "editor" {
#   billing_account_id = "${var.billing_account_id}"
#   role               = "roles/billing.user"
#   members = [
#     "user:banothuramu@gnimmagadda.com",
#   ]
# }