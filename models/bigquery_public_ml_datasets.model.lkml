connection: "bigquery_ml_service_account"
label: "BigQuery Public Datasets for ML"

# include all the views
include: "/views/**/*.view"

datagroup: bigquery_public_ml_datasets_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bigquery_public_ml_datasets_default_datagroup

explore: census_adult_income {}
