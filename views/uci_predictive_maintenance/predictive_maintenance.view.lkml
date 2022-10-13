view: predictive_maintenance {
  sql_table_name: `bqml-accelerator.uci_predictive_maintenance.predictive_maintenance` ;;

  dimension: udi {
    label: "Unique ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.UDI ;;
  }

  dimension: air_temperature__k_ {
    type: number
    sql: ${TABLE}.Air_temperature__K_ ;;
  }

  dimension: failure_type {
    type: string
    sql: ${TABLE}.Failure_Type ;;
  }

  dimension: process_temperature__k_ {
    type: number
    sql: ${TABLE}.Process_temperature__K_ ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.Product_ID ;;
  }

  dimension: rotational_speed__rpm_ {
    type: number
    sql: ${TABLE}.Rotational_speed__rpm_ ;;
  }

  dimension: target {
    type: number
    sql: ${TABLE}.Target ;;
  }

  dimension: tool_wear__min_ {
    type: number
    sql: ${TABLE}.Tool_wear__min_ ;;
  }

  dimension: torque__nm_ {
    type: number
    sql: ${TABLE}.Torque__Nm_ ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
