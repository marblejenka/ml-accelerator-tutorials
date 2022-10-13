# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: demo_cust_satisfaction_predictions {
  hidden: yes

  join: demo_cust_satisfaction_predictions__predicted_customer_satisfaction_satisfaction_probs {
    view_label: "Demo Cust Satisfaction Predictions: Predicted Customer Satisfaction Satisfaction Probs"
    sql: LEFT JOIN UNNEST(${demo_cust_satisfaction_predictions.predicted_customer_satisfaction_satisfaction_probs}) as demo_cust_satisfaction_predictions__predicted_customer_satisfaction_satisfaction_probs ;;
    relationship: one_to_many
  }
}

# The name of this view in Looker is "Demo Cust Satisfaction Predictions"
view: demo_cust_satisfaction_predictions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bqml-accelerator.looker_bqml.demo_cust_satisfaction_predictions`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Customer Satisfaction Arrival Delay In Minutes" in Explore.

  dimension: arrival_delay_in_minutes {
    type: number
    sql: ${TABLE}.customer_satisfaction_arrival_delay_in_minutes ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_arrival_delay_in_minutes {
    type: sum
    sql: ${arrival_delay_in_minutes} ;;
  }

  measure: average_arrival_delay_in_minutes {
    type: average
    sql: ${arrival_delay_in_minutes} ;;
  }

  dimension: baggage_handling {
    type: number
    sql: ${TABLE}.customer_satisfaction_baggage_handling ;;
  }

  dimension: checkin_service {
    type: number
    sql: ${TABLE}.customer_satisfaction_checkin_service ;;
  }

  dimension: class {
    type: string
    sql: ${TABLE}.customer_satisfaction_class ;;
  }

  dimension: cleanliness {
    type: number
    sql: ${TABLE}.customer_satisfaction_cleanliness ;;
  }

  dimension: customer_type {
    type: string
    sql: ${TABLE}.customer_satisfaction_customer_type ;;
  }

  dimension: departure_arrival_time_convenient {
    type: number
    sql: ${TABLE}.customer_satisfaction_departure_arrival_time_convenient ;;
  }

  dimension: departure_delay_in_minutes {
    type: number
    sql: ${TABLE}.customer_satisfaction_departure_delay_in_minutes ;;
  }

  dimension: ease_of_online_booking {
    type: number
    sql: ${TABLE}.customer_satisfaction_ease_of_online_booking ;;
  }

  dimension: flight_distance {
    type: number
    sql: ${TABLE}.customer_satisfaction_flight_distance ;;
  }

  dimension: food_and_drink {
    type: number
    sql: ${TABLE}.customer_satisfaction_food_and_drink ;;
  }

  dimension: gate_location {
    type: number
    sql: ${TABLE}.customer_satisfaction_gate_location ;;
  }

  dimension: inflight_entertainment {
    type: number
    sql: ${TABLE}.customer_satisfaction_inflight_entertainment ;;
  }

  dimension: inflight_wifi_service {
    type: number
    sql: ${TABLE}.customer_satisfaction_inflight_wifi_service ;;
  }

  dimension: leg_room_service {
    type: number
    sql: ${TABLE}.customer_satisfaction_leg_room_service ;;
  }

  dimension: on_board_service {
    type: number
    sql: ${TABLE}.customer_satisfaction_on_board_service ;;
  }

  dimension: online_boarding {
    type: number
    sql: ${TABLE}.customer_satisfaction_online_boarding ;;
  }

  dimension: online_support {
    type: number
    sql: ${TABLE}.customer_satisfaction_online_support ;;
  }

  dimension: satisfaction {
    type: string
    sql: ${TABLE}.customer_satisfaction_satisfaction ;;
  }

  dimension: seat_comfort {
    type: number
    sql: ${TABLE}.customer_satisfaction_seat_comfort ;;
  }

  dimension: type_of_travel {
    type: string
    sql: ${TABLE}.customer_satisfaction_type_of_travel ;;
  }

  dimension: unique_id {
    type: string
    sql: ${TABLE}.customer_satisfaction_unique_id ;;
  }

  dimension: predicted_satisfaction {
    type: string
    sql: ${TABLE}.predicted_customer_satisfaction_satisfaction ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: predicted_customer_satisfaction_satisfaction_probs {
    hidden: yes
    sql: ${TABLE}.predicted_customer_satisfaction_satisfaction_probs ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

# The name of this view in Looker is "Demo Cust Satisfaction Predictions Predicted Customer Satisfaction Satisfaction Probs"
view: demo_cust_satisfaction_predictions__predicted_customer_satisfaction_satisfaction_probs {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: demo_cust_satisfaction_predictions__predicted_customer_satisfaction_satisfaction_probs {
    type: string
    hidden: yes
    sql: demo_cust_satisfaction_predictions__predicted_customer_satisfaction_satisfaction_probs ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Label" in Explore.

  dimension: label {
    type: string
    sql: label ;;
  }

  dimension: prob {
    type: number
    sql: prob ;;
    value_format_name: percent_1
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_prob {
    type: sum
    sql: ${prob} ;;
    value_format_name: percent_1
  }

  measure: average_prob {
    type: average
    sql: ${prob} ;;
    value_format_name: percent_1
  }



}
