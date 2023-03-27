view: census_income {
  derived_table: {
    sql:  SELECT *, GENERATE_UUID() as unique_id
          FROM `bigquery-public-data.ml_datasets.census_adult_income`
    ;;
  }

  dimension: unique_id {
    primary_key: yes
    label: "Unique ID"
    type: string
    sql: ${TABLE}.unique_id ;;
  }

  dimension: age {
    type: number
    description: "Age"
    sql: ${TABLE}.age ;;
  }

  dimension: capital_gain {
    type: number
    description: "Amount of capital gains"
    sql: ${TABLE}.capital_gain ;;
  }

  dimension: capital_loss {
    type: number
    description: "Amount of capital loss"
    sql: ${TABLE}.capital_loss ;;
  }

  dimension: dataframe {
    type: string
    description: "Indicates if record belongs to the Training or Prediction dataframes"
    sql:  CASE
            WHEN MOD(functional_weight, 10) <= 8 THEN 'train'
            else 'predict'
          END ;;
  }

  dimension: education {
    type: string
    description: "Level of education completed"
    sql: ${TABLE}.education ;;
  }

  dimension: education_num {
    type: number
    description: "Estimated years of education completed based on the value of the education field."
    sql: ${TABLE}.education_num ;;
  }

  dimension: functional_weight {
    type: number
    hidden: yes
    description: "Sample weight of the individual from the original Census data. Use to select random samples"
    sql: ${TABLE}.functional_weight ;;
  }

  dimension: hours_per_week {
    type: number
    description: "Hours worked per week"
    sql: ${TABLE}.hours_per_week ;;
  }

  dimension: income_bracket {
    type: string
    description: "Either \">50K\" or \"<=50K\" based on income."
    # for tutorial, set income bracket values to null for those in the predict dataset
    sql: CASE
            WHEN ${dataframe} = 'train' THEN ${TABLE}.income_bracket
            WHEN ${dataframe} = 'predict' THEN NULL
          END ;;

  }

  dimension: marital_status {
    type: string
    description: "Marital status"
    sql: ${TABLE}.marital_status ;;
  }

  dimension: country {
    type: string
    description: "Country of birth"
    sql: ${TABLE}.native_country ;;
  }

  dimension: occupation {
    type: string
    description: "Occupation category"
    sql: ${TABLE}.occupation ;;
  }

  dimension: race {
    type: string
    description: "Race"
    sql: ${TABLE}.race ;;
  }

  dimension: relationship {
    type: string
    description: "Relationship to the household"
    sql: ${TABLE}.relationship ;;
  }

  dimension: gender {
    type: string
    description: "Gender"
    sql: ${TABLE}.sex ;;
  }

  dimension: workclass {
    type: string
    description: "Nature of employment"
    sql: ${TABLE}.workclass ;;
  }

  measure: count {
    type: count
    drill_fields: [gender, age, race, country, education, marital_status, occupation, income_bracket]
  }
}
