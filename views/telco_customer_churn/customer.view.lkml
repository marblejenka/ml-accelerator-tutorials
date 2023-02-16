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

  dimension: churn {
    type: string
    sql:  {% if dataframe._parameter_value == 'train' %}
            ${TABLE}.churn
          {% elsif dataframe._parameter_value == 'test' %}
            NULL
          {% endif %}
    ;;
  }

  dimension: international_plan {
    type: string
    sql: ${TABLE}.international_plan ;;
  }

  dimension: number_customer_service_calls {
    type: number
    sql: ${TABLE}.number_customer_service_calls ;;
  }

  dimension: number_vmail_messages {
    type: number
    sql: ${TABLE}.number_vmail_messages ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: total_day_calls {
    type: number
    sql: ${TABLE}.total_day_calls ;;
  }

  dimension: total_day_charge {
    type: number
    sql: ${TABLE}.total_day_charge ;;
  }

  dimension: total_day_minutes {
    type: number
    sql: ${TABLE}.total_day_minutes ;;
  }

  dimension: total_eve_calls {
    type: number
    sql: ${TABLE}.total_eve_calls ;;
  }

  dimension: total_eve_charge {
    type: number
    sql: ${TABLE}.total_eve_charge ;;
  }

  dimension: total_eve_minutes {
    type: number
    sql: ${TABLE}.total_eve_minutes ;;
  }

  dimension: total_intl_calls {
    type: number
    sql: ${TABLE}.total_intl_calls ;;
  }

  dimension: total_intl_charge {
    type: number
    sql: ${TABLE}.total_intl_charge ;;
  }

  dimension: total_intl_minutes {
    type: number
    sql: ${TABLE}.total_intl_minutes ;;
  }

  dimension: total_night_calls {
    type: number
    sql: ${TABLE}.total_night_calls ;;
  }

  dimension: total_night_charge {
    type: number
    sql: ${TABLE}.total_night_charge ;;
  }

  dimension: total_night_minutes {
    type: number
    sql: ${TABLE}.total_night_minutes ;;
  }

  dimension: voice_mail_plan {
    type: string
    sql: ${TABLE}.voice_mail_plan ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
