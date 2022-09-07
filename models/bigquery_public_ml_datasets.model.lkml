connection: "bqml_accelerator"
label: "BigQuery Public Datasets for ML"

# include all the views
include: "/views/**/*.view"

datagroup: bigquery_public_ml_datasets_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bigquery_public_ml_datasets_default_datagroup

explore: census_adult_income {
  hidden: yes
}

explore: penguins {
  hidden: yes
}

explore: google_analytics_sample {
  hidden: yes
}

explore: ticket {
  label: "Zendesk Tickets"
  hidden: yes

  join: satisfaction_ratings {
    type: left_outer
    sql_on: ${ticket.id} = ${satisfaction_ratings.ticket_id} ;;
    relationship: one_to_many
  }
}
