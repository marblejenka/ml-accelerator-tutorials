view: penguins {
  derived_table: {
    sql:  SELECT *, GENERATE_UUID() as unique_id
          FROM `bigquery-public-data.ml_datasets.penguins`
    ;;
  }

  dimension: unique_id {
    primary_key: yes
    label: "Unique ID"
    type: string
    sql: ${TABLE}.unique_id ;;
  }

  dimension: species {
    type: string
    sql: ${TABLE}.species ;;
  }

  dimension: island {
    type: string
    sql: ${TABLE}.island ;;
  }

  dimension: culmen_length_mm {
    type: number
    sql: ${TABLE}.culmen_length_mm ;;
  }

  dimension: culmen_depth_mm {
    type: number
    sql: ${TABLE}.culmen_depth_mm ;;
  }

  dimension: flipper_length_mm {
    type: number
    sql: ${TABLE}.flipper_length_mm ;;
  }

  dimension: body_mass_g {
    type: number
    sql: ${TABLE}.body_mass_g ;;
  }

  dimension: sex {
    type: string
    sql: ${TABLE}.sex ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  set: detail {
    fields: [species, island, culmen_length_mm, culmen_depth_mm, flipper_length_mm, body_mass_g, sex]
  }
}
