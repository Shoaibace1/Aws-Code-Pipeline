provider "google" {
  project = "your-gcp-project-id"
  region  = "your-region"  # Optional: specify your preferred region
}

# Create a Pub/Sub topic
resource "google_pubsub_topic" "my_topic" {
  name = "my-topic"
}

# Create a Pub/Sub subscription
resource "google_pubsub_subscription" "my_subscription" {
  name  = "my-subscription"
  topic = google_pubsub_topic.my_topic.name

  ack_deadline_seconds = 20  # Optional: adjust the acknowledgment deadline
}

# (Optional) Grant permissions to a service account to publish or subscribe to the topic
resource "google_project_iam_member" "pubsub_publisher" {
  project = "your-gcp-project-id"
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:your-service-account@your-gcp-project-id.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "pubsub_subscriber" {
  project = "your-gcp-project-id"
  role    = "roles/pubsub.subscriber"
  member  = "serviceAccount:your-service-account@your-gcp-project-id.iam.gserviceaccount.com"
}
