view: user_churn {
  sql_table_name: `bqmlpublic.demo_ga4churnprediction.training_data`;;

# user ID
# {
  dimension: user_pseudo_id {
    primary_key: yes
    label: "UserID"
    description: "Represents a unique user with a distinct user ID"
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
# }

# Label
# {
  dimension: churned {
    group_label: "Label"
    label: "Churn Indicator"
    type: string
    sql: cast(${TABLE}.churned as string) ;;
  }
# }

# Demographic features
# {
  dimension: country {
    group_label: "Demographic Features"
    label: "Country"
    description: "Country information derived from geo.country"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: language {
    group_label: "Demographic Features"
    label: "Device Language"
    description: "Device Language information from device.language"
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: operating_system {
    group_label: "Demographic Features"
    label: "Device OS"
    description: "Device OS information from device.operating_system"
    type: string
    sql: ${TABLE}.operating_system ;;
  }
# }

# behavioral features in the first 24 hours of visiting the Google Merchandise Store
# {
  dimension: cnt_add_payment_info {
    group_label: "Behavioural Features"
    label: "Add Payment Info Event Count"
    description: "Count of add_payment_info event occurance in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_add_payment_info ;;
  }

  dimension: cnt_add_shipping_info {
    group_label: "Behavioural Features"
    label: "Add Shipping Info Event Count"
    description: "Count of add_shipping_info event occurance in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_add_shipping_info ;;
  }

  dimension: cnt_add_to_cart {
    group_label: "Behavioural Features"
    label: "Add to Cart Event Count"
    description: "Count of add_to_cart event occurance in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_add_to_cart ;;
  }

  dimension: cnt_begin_checkout {
    group_label: "Behavioural Features"
    label: "Begin Checkout Event Count"
    description: "Count of begin_checkout event occurance in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_begin_checkout ;;
  }

  dimension: cnt_page_view {
    group_label: "Behavioural Features"
    label: "Page View Event Count"
    description: "Count of page_view event occurance in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_page_view ;;
  }

  dimension: cnt_purchase {
    group_label: "Behavioural Features"
    label: "Purchase Event Count"
    description: "Count of purchase event occurance in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_purchase ;;
  }

  dimension: cnt_select_promotion {
    group_label: "Behavioural Features"
    label: "Select Promotion Event Count"
    description: "Count of select_promotion event occurance in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_select_promotion ;;
  }

  dimension: cnt_user_engagement {
    group_label: "Behavioural Features"
    label: "User Engagement Count"
    description: "Count of user_engagement event occurance in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_user_engagement ;;
  }

  dimension: cnt_view_item {
    group_label: "Behavioural Features"
    label: "View Item Event Count"
    description: "Count of view_item event occurance in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_view_item ;;
  }

  dimension: cnt_view_promotion {
    group_label: "Behavioural Features"
    label: "View Promotion Event Count"
    description: "Count of view_promotion event occurance in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_view_promotion ;;
  }
# }

# user_first_engagement time related features
# {
  # dimension: dayofweek {
  #   description: "Day of the week of user's first engagement"
  #   type: number
  #   sql: ${TABLE}.dayofweek ;;
  # }

  # dimension: julianday {
  #   description: "Day of the year of user's first engagement"
  #   type: number
  #   sql: ${TABLE}.julianday ;;
  # }

  # dimension: month {
  #   description: "Month of user's first engagement"
  #   type: number
  #   sql: ${TABLE}.month ;;
  # }

  dimension_group: user_first_engagement {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.user_first_engagement ;;
  }
# }


  measure: count {
    type: count
    drill_fields: []
  }
}
