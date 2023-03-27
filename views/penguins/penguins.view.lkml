view: penguins {
  derived_table: {
    sql:  SELECT *, GENERATE_UUID() as unique_id
          FROM `bigquery-public-data.ml_datasets.penguins`
          where body_mass_g is not null
    ;;
  }

  dimension: unique_id {
    primary_key: yes
    label: "Unique ID"
    type: string
    sql: ${TABLE}.unique_id ;;
  }

  dimension: species {
    description: "Species of Penguin"
    type: string
    sql: ${TABLE}.species ;;
  }

  dimension: island {
    description: "Island where penguin resides"
    type: string
    sql: ${TABLE}.island ;;
  }

  dimension: culmen_length {
    description: "Culmen Length (millimeters)"
    type: number
    sql: ${TABLE}.culmen_length_mm ;;
  }

  dimension: culmen_depth {
    description: "Culmen Depth (millimeters)"
    type: number
    sql: ${TABLE}.culmen_depth_mm ;;
  }

  dimension: dataframe {
    description: "Select Train or Predict"
    type: string
    sql: case when ABS(MOD(FARM_FINGERPRINT(${unique_id}), 10)) < 9 then "train" else "predict" end  ;;
  }

  dimension: flipper_length {
    description: "Flipper Length (millimeters)"
    type: number
    sql: ${TABLE}.flipper_length_mm ;;
  }

  dimension: body_mass {
    description: "Body Mass (grams)"
    type: number
    sql: ${TABLE}.body_mass_g ;;
  }

  dimension: sex {
    description: "Sex of penguin"
    type: string
    sql: ${TABLE}.sex ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  set: detail {
    fields: [species, island, culmen_length, culmen_depth, flipper_length, body_mass, sex]
  }
}
