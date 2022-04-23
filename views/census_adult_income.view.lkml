view: census_adult_income {
  sql_table_name: `bigquery-public-data.ml_datasets.census_adult_income`
    ;;

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
    description: "Indicates if record belongs to the Training, Evaluation or Prediction dataframes"
    sql:  CASE
            WHEN MOD(functional_weight, 10) < 8 THEN 'training'
            WHEN MOD(functional_weight, 10) = 8 THEN 'evaluation'
            WHEN MOD(functional_weight, 10) = 9 THEN 'prediction'
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
    description: "Sample weight of the individual from the original Census data. How likely they were to be included in this dataset, based on their demographic characteristics vs. whole-population estimates."
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
    sql: ${TABLE}.income_bracket ;;
  }

  dimension: marital_status {
    type: string
    description: "Marital status"
    sql: ${TABLE}.marital_status ;;
  }

  dimension: native_country {
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

  dimension: sex {
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
    drill_fields: [sex, age, race, native_country, education, marital_status, occupation, income_bracket]
  }
}
