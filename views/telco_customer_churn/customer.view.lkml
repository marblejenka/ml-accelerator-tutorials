view: customer {
  sql_table_name: `machine-learning-accelerator.telco_customer_churn.{% parameter dataframe %}` ;;

  parameter: dataframe {
    type: unquoted
    default_value: "train"
    allowed_value: {
      value: "train"
    }
    allowed_value: {
      value: "test"
    }
  }

  dimension: customer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: account_length {
    type: number
    sql: ${TABLE}.account_length ;;
  }

  dimension: area_code {
    type: string
    sql: ${TABLE}.area_code ;;
  }

  dimension: international_plan {
    type: string
    sql: ${TABLE}.international_plan ;;
  }

  dimension: voice_mail_plan {
    type: string
    sql: ${TABLE}.voice_mail_plan ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: churn {
    type: string
    sql:  {% if dataframe._parameter_value == 'train' %}
            CASE
              WHEN ${TABLE}.churn IS TRUE THEN 'Yes'
              WHEN ${TABLE}.churn IS FALSE THEN 'No'
            END
          {% elsif dataframe._parameter_value == 'test' %}
            ''
          {% endif %}
    ;;
  }

  measure: total_day_calls {
    type: sum
    sql: ${TABLE}.total_day_calls ;;
  }

  measure: total_day_charge {
    type: sum
    sql: ${TABLE}.total_day_charge ;;
  }

  measure: total_day_minutes {
    type: sum
    sql: ${TABLE}.total_day_minutes ;;
  }

  measure: total_eve_calls {
    type: sum
    sql: ${TABLE}.total_eve_calls ;;
  }

  measure: total_eve_charge {
    type: sum
    sql: ${TABLE}.total_eve_charge ;;
  }

  measure: total_eve_minutes {
    type: sum
    sql: ${TABLE}.total_eve_minutes ;;
  }

  measure: total_intl_calls {
    type: sum
    sql: ${TABLE}.total_intl_calls ;;
  }

  measure: total_intl_charge {
    type: sum
    sql: ${TABLE}.total_intl_charge ;;
  }

  measure: total_intl_minutes {
    type: sum
    sql: ${TABLE}.total_intl_minutes ;;
  }

  measure: total_night_calls {
    type: sum
    sql: ${TABLE}.total_night_calls ;;
  }

  measure: total_night_charge {
    type: sum
    sql: ${TABLE}.total_night_charge ;;
  }

  measure: total_night_minutes {
    type: sum
    sql: ${TABLE}.total_night_minutes ;;
  }

  measure: total_service_calls {
    type: sum
    sql: ${TABLE}.number_customer_service_calls ;;
  }

  measure: total_vmail_messages {
    type: sum
    sql: ${TABLE}.number_vmail_messages ;;
  }

  measure: customer_count {
    type: count
  }

  measure: churn_count {
    type: count
    filters: [churn: "Yes"]
  }

  measure: churn_rate {
    type: number
    sql: 1.0*${churn_count} / NULLIF(${customer_count},0) ;;
    value_format_name: percent_1
  }
}
