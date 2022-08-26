# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: predict_census_income_bracket_predictions {
  hidden: yes

  join: predict_census_income_bracket_predictions__predicted_census_adult_income_income_bracket_probs {
    view_label: "Predict Census Income Bracket Predictions: Predicted Census Adult Income Income Bracket Probs"
    sql: LEFT JOIN UNNEST(${predict_census_income_bracket_predictions.predicted_census_adult_income_income_bracket_probs}) as predict_census_income_bracket_predictions__predicted_census_adult_income_income_bracket_probs ;;
    relationship: one_to_many
  }
}

# The name of this view in Looker is "Predict Census Income Bracket Predictions"
view: predict_census_income_bracket_predictions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bqml-accelerator.bqml_accelerator.predict_census_income_bracket_predictions`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Census Adult Income Age" in Explore.

  dimension: census_adult_income_age {
    type: number
    sql: ${TABLE}.census_adult_income_age ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_census_adult_income_age {
    type: sum
    sql: ${census_adult_income_age} ;;
  }

  measure: average_census_adult_income_age {
    type: average
    sql: ${census_adult_income_age} ;;
  }

  dimension: census_adult_income_education_num {
    type: number
    sql: ${TABLE}.census_adult_income_education_num ;;
  }

  dimension: census_adult_income_hours_per_week {
    type: number
    sql: ${TABLE}.census_adult_income_hours_per_week ;;
  }

  dimension: census_adult_income_income_bracket {
    type: string
    sql: ${TABLE}.census_adult_income_income_bracket ;;
  }

  dimension: census_adult_income_marital_status {
    type: string
    sql: ${TABLE}.census_adult_income_marital_status ;;
  }

  dimension: census_adult_income_occupation {
    type: string
    sql: ${TABLE}.census_adult_income_occupation ;;
  }

  dimension: census_adult_income_workclass {
    type: string
    sql: ${TABLE}.census_adult_income_workclass ;;
  }

  dimension: predicted_census_adult_income_income_bracket {
    type: string
    sql: ${TABLE}.predicted_census_adult_income_income_bracket ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: predicted_census_adult_income_income_bracket_probs {
    hidden: yes
    sql: ${TABLE}.predicted_census_adult_income_income_bracket_probs ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

# The name of this view in Looker is "Predict Census Income Bracket Predictions Predicted Census Adult Income Income Bracket Probs"
view: predict_census_income_bracket_predictions__predicted_census_adult_income_income_bracket_probs {
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

  dimension: predict_census_income_bracket_predictions__predicted_census_adult_income_income_bracket_probs {
    type: string
    hidden: yes
    sql: predict_census_income_bracket_predictions__predicted_census_adult_income_income_bracket_probs ;;
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
