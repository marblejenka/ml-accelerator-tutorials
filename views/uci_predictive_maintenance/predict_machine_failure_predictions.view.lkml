# The name of this view in Looker is "Predict Machine Failure Predictions"
view: predict_machine_failure_predictions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bqml-accelerator.looker_bqml.predict_machine_failure_predictions`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Predicted Predictive Maintenance Machine Failure" in Explore.

  dimension: predicted_predictive_maintenance_machine_failure {
    type: string
    sql: ${TABLE}.predicted_predictive_maintenance_machine_failure ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: predicted_predictive_maintenance_machine_failure_probs {
    hidden: yes
    sql: ${TABLE}.predicted_predictive_maintenance_machine_failure_probs ;;
  }

  dimension: predictive_maintenance_air_temperature {
    type: number
    sql: ${TABLE}.predictive_maintenance_air_temperature ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_predictive_maintenance_air_temperature {
    type: sum
    sql: ${predictive_maintenance_air_temperature} ;;
  }

  measure: average_predictive_maintenance_air_temperature {
    type: average
    sql: ${predictive_maintenance_air_temperature} ;;
  }

  dimension: predictive_maintenance_machine_failure {
    type: string
    sql: ${TABLE}.predictive_maintenance_machine_failure ;;
  }

  dimension: predictive_maintenance_machine_id {
    type: string
    sql: ${TABLE}.predictive_maintenance_machine_id ;;
  }

  dimension: predictive_maintenance_process_temperature {
    type: number
    sql: ${TABLE}.predictive_maintenance_process_temperature ;;
  }

  dimension: predictive_maintenance_product_quality {
    type: string
    sql: ${TABLE}.predictive_maintenance_product_quality ;;
  }

  dimension: predictive_maintenance_rotational_speed {
    type: number
    sql: ${TABLE}.predictive_maintenance_rotational_speed ;;
  }

  dimension: predictive_maintenance_tool_wear {
    type: number
    sql: ${TABLE}.predictive_maintenance_tool_wear ;;
  }

  dimension: predictive_maintenance_torque {
    type: number
    sql: ${TABLE}.predictive_maintenance_torque ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

# The name of this view in Looker is "Predict Machine Failure Predictions Predicted Predictive Maintenance Machine Failure Probs"
view: predict_machine_failure_predictions__predicted_predictive_maintenance_machine_failure_probs {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Label" in Explore.

  dimension: label {
    type: string
    sql: label ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: predict_machine_failure_predictions__predicted_predictive_maintenance_machine_failure_probs {
    type: string
    hidden: yes
    sql: predict_machine_failure_predictions__predicted_predictive_maintenance_machine_failure_probs ;;
  }

  dimension: prob {
    type: number
    sql: prob ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_prob {
    type: sum
    sql: ${prob} ;;
  }

  measure: average_prob {
    type: average
    sql: ${prob} ;;
  }
}
