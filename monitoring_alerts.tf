resource "google_monitoring_notification_channel" "slack_alert" {
  count        = "${var.stackdriver_workspace == "" ? 0 : 1}"
  project      = "${var.stackdriver_workspace}"
  display_name = "#${var.slack_channel_name}"
  type         = "slack"

  labels = {
    auth_token   = "${var.slack_auth_token}"
    channel_name = "#${var.slack_channel_name}"
  }
}

resource "google_monitoring_alert_policy" "alert_500_errors_eq" {
  count        = "${var.stackdriver_workspace == "" ? 0 : 1}"
  project      = "${var.stackdriver_workspace}"
  display_name = "500 Errors on EQ"
  combiner     = "OR"

  conditions {
    display_name = "500 Errors on EQ"

    condition_threshold {
      filter          = "metric.type = \"logging.googleapis.com/user/eq_500_errors\" AND resource.type = \"l7_lb_rule\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0

      trigger {
        count = 1
      }

      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_DELTA"
        cross_series_reducer = "REDUCE_SUM"
      }
    }
  }

  documentation {
    content = "The rule $${condition.display_name} has detected at least 1 5xx error in the past 60 seconds."
  }

  notification_channels = [
    "${google_monitoring_notification_channel.slack_alert.name}",
  ]
}

resource "google_monitoring_alert_policy" "alert_401_errors_eq" {
  count        = "${var.stackdriver_workspace == "" ? 0 : 1}"
  project      = "${var.stackdriver_workspace}"
  display_name = "401 Errors on EQ"
  combiner     = "OR"

  conditions {
    display_name = "401 Errors on EQ"

    condition_threshold {
      filter          = "metric.type = \"logging.googleapis.com/user/eq_401_errors\" AND resource.type = \"l7_lb_rule\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0

      trigger {
        count = 1
      }

      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_DELTA"
        cross_series_reducer = "REDUCE_SUM"
      }
    }
  }

  documentation {
    content = "The rule $${condition.display_name} has detected at least 1 401 error in the past 60 seconds."
  }

  notification_channels = [
    "${google_monitoring_notification_channel.slack_alert.name}",
  ]
}

resource "google_monitoring_alert_policy" "alert_403_errors_eq" {
  count        = "${var.stackdriver_workspace == "" ? 0 : 1}"
  project      = "${var.stackdriver_workspace}"
  display_name = "403 Errors on EQ"
  combiner     = "OR"

  conditions {
    display_name = "403 Errors on EQ"

    condition_threshold {
      filter          = "metric.type = \"logging.googleapis.com/user/eq_403_errors\" AND resource.type = \"l7_lb_rule\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0

      trigger {
        count = 1
      }

      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_DELTA"
        cross_series_reducer = "REDUCE_SUM"
      }
    }
  }

  documentation {
    content = "The rule $${condition.display_name} has detected at least 1 403 error in the past 60 seconds."
  }

  notification_channels = [
    "${google_monitoring_notification_channel.slack_alert.name}",
  ]
}
