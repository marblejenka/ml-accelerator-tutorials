connection: "bqml_accelerator"
label: "BigQuery Public Datasets for ML"

# include all the views
include: "/views/**/*.view"

datagroup: bigquery_public_ml_datasets_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bigquery_public_ml_datasets_default_datagroup

explore: census_adult_income {}

explore: penguins {}

explore: google_analytics_sample {}

explore: zendesk_tickets {
  view_name: ticket

  join: satisfaction_ratings {
    type: left_outer
    sql: ${ticket.id} = ${satisfaction_ratings.ticket_id} ;;
    relationship: one_to_one
  }

}
