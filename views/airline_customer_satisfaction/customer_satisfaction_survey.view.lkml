#unpivot demo data for survey to support a dashboard showing avgerage scores

# include: "/views/airline_customer_satisfaction/customer_satisfaction.view"

view: customer_satisfaction_survey {
derived_table: {
  sql: SELECT  *
        , cast(attribute_score as string) as attribute_score_string
        , generate_uuid() as unique_id

FROM `bqml-accelerator.airline_customer_satisfaction.satisfaction_survey_biglake_table` as t
UNPIVOT(attribute_score FOR attribute IN (seat_comfort,
      departure_arrival_time_convenient,
      food_and_drink,
      gate_location,
      inflight_wifi_service,
      inflight_entertainment,
      online_support,
      ease_of_online_booking,
      on_board_service,
      leg_room_service,
      baggage_handling,
      checkin_service,
      cleanliness,
      online_boarding
      ))
 ;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}

 dimension: satisfaction {
  label: "Overall Satisfaction"
  type: string
  # sql: ${TABLE}.satisfaction ;;
  sql:  CASE
            WHEN FARM_FINGERPRINT(${unique_id}) <= -4619029773043665920 THEN ${TABLE}.satisfaction
            ELSE NULL
          END
    ;;
}



# dimension: gender {
#   type: string
#   sql: ${TABLE}.Gender ;;
# }

dimension: customer_type {
  type: string
  sql: case ${TABLE}.Customer_Type when 'Loyal customer' then 'Loyalty member'
    when 'disloyal customer' then 'Loyalty non-member' end ;;
}

# dimension: age {
#   type: number
#   sql: ${TABLE}.Age ;;
# }

dimension: type_of_travel {
  type: string
  sql: ${TABLE}.Type_of_Travel ;;
}

dimension: class {
  type: string
  sql: ${TABLE}.Class ;;
}

dimension: flight_distance {
  type: number
  sql: ${TABLE}.Flight_Distance ;;
}

dimension: attribute_score {
  type: number
  sql: ${TABLE}.attribute_score ;;
}

dimension: attribute_score_group {
  type: string
  sql: case ${attribute_score} when 0 then "No Response"
                               when 1 then "very dissatisfied"
                               when 2 then "dissatisfied"
                               when 3 then "neutral"
                               when 4 then "satisfied"
                               when 5 then "very satisfied"
       end;;
}

dimension: attribute {
  type: string
  sql: regexp_replace(${TABLE}.attribute,'_',' ') ;;
}

dimension: attribute_score_string {
  type: string
  sql: ${TABLE}.attribute_score_string ;;
}

dimension: departure_delay_in_minutes {
  type: number
  sql: ${TABLE}.departure_delay_in_minutes ;;
}

dimension: arrival_delay_in_minutes {
  type: number
  sql: ${TABLE}.arrival_delay_in_minutes ;;
}
dimension: unique_id {
  type: string
  sql: ${TABLE}.unique_id ;;
}

dimension: pk {
  type: string
  sql: ${unique_id}||${attribute} ;;
}

measure: avg_attribute_score {
  type: average
  sql: ${attribute_score} ;;
}

measure: avg_arrival_delay_in_minutes {
  type: average
  sql: ${arrival_delay_in_minutes} ;;
}

  measure: avg_departure_delay_in_minutes {
    type: average
    sql: ${departure_delay_in_minutes} ;;
  }

  measure: avg_flight_distance {
    type: average
    sql: ${flight_distance} ;;
  }

set: detail {
  fields: [
    satisfaction,

    customer_type,

    type_of_travel,
    class,
    flight_distance,
    attribute_score,
    attribute,
    attribute_score_string,
    unique_id
  ]
}
}
