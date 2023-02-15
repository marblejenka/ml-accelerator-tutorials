view: machine_failure {
  sql_table_name: `machine-learning-accelerator.ml_accelerator_tutorials.machine_failure` ;;

  dimension: dataframe {
    type: string
    sql:  CASE
            WHEN FARM_FINGERPRINT(${machine_id}) <= 151892338321851519 THEN 'train'
            ELSE 'predict'
          END
    ;;
  }

  dimension: air_temperature {
    type: number
    sql: ${TABLE}.Air_temperature__K_ ;;
  }

  dimension: failure_type {
    type: string
    sql:  CASE
            WHEN ${dataframe} = 'train' THEN ${TABLE}.Failure_Type
            ELSE NULL
          END
    ;;
  }

  dimension: process_temperature {
    type: number
    sql: ${TABLE}.Process_temperature__K_ ;;
  }

  dimension: machine_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Product_ID ;;
  }

  dimension: rotational_speed {
    type: number
    sql: ${TABLE}.Rotational_speed__rpm_ ;;
  }

  dimension: machine_failed {
    type: string
    sql:  CASE
            WHEN ${dataframe} = 'train' AND ${failure_type} <> 'No Failure' THEN TRUE
            WHEN ${dataframe} = 'train' AND ${failure_type} = 'No Failure' THEN FALSE
            ELSE NULL
          END
    ;;
  }

  dimension: tool_wear {
    type: number
    sql: ${TABLE}.Tool_wear__min_ ;;
  }

  dimension: torque {
    type: number
    sql: ${TABLE}.Torque__Nm_ ;;
  }

  dimension: product_quality {
    type: string
    sql:  CASE
            WHEN ${TABLE}.Type = 'L' THEN 'Low'
            WHEN ${TABLE}.Type = 'M' THEN 'Medium'
            WHEN ${TABLE}.Type = 'H' THEN 'High'
          END
    ;;
  }

  measure: count {
    type: count
  }
}
