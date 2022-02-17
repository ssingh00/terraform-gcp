project_id = "PROJECT_ID"

topics = ["streaming_error_topic","streaming_success_topic"]

location = "us"

region  = "us"

env = "prod"

dataset_id = ["dataset_bq"]
service_account = "service-account"

gcs-buckets = ["functions_bucket",
                "stream_error",
                "stream_source",
                "stream_success"
]


