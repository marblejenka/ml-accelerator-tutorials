view: user_churn_common_dimensions {
# user ID
# {
  dimension: user_id {
    primary_key: yes
    label: "User Id"
    description: "Represents a unique user with a distinct user ID"
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
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

  dimension: device_language {
    group_label: "Demographic Features"
    label: "Device Language"
    description: "Device Language information from device.language"
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: device_os {
    group_label: "Demographic Features"
    label: "Device OS"
    description: "Device OS information from device.operating_system"
    type: string
    sql: ${TABLE}.operating_system ;;
  }
# }

# behavioral features in the first 24 hours of visiting the Google Merchandise Store
# {
  dimension: add_payment_info_event_count {
    group_label: "Behavioural Features"
    label: "Add Payment Info Event Count"
    description: "Count of add_payment_info event occurrence in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_add_payment_info ;;
  }

  dimension: add_shipping_info_event_count {
    group_label: "Behavioural Features"
    label: "Add Shipping Info Event Count"
    description: "Count of add_shipping_info event occurrence in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_add_shipping_info ;;
  }

  dimension: add_to_cart_event_count {
    group_label: "Behavioural Features"
    label: "Add to Cart Event Count"
    description: "Count of add_to_cart event occurrence in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_add_to_cart ;;
  }

  dimension: begin_checkout_event_count {
    group_label: "Behavioural Features"
    label: "Begin Checkout Event Count"
    description: "Count of begin_checkout event occurrence in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_begin_checkout ;;
  }

  dimension: page_view_event_count {
    group_label: "Behavioural Features"
    label: "Page View Event Count"
    description: "Count of page_view event occurrence in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_page_view ;;
  }

  dimension: purchase_event_count {
    group_label: "Behavioural Features"
    label: "Purchase Event Count"
    description: "Count of purchase event occurrence in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_purchase ;;
  }

  dimension: select_promotion_event_count {
    group_label: "Behavioural Features"
    label: "Select Promotion Event Count"
    description: "Count of select_promotion event occurrence in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_select_promotion ;;
  }

  dimension: user_engagement_event_count {
    group_label: "Behavioural Features"
    label: "User Engagement Event Count"
    description: "Count of user_engagement event occurrence in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_user_engagement ;;
  }

  dimension: view_item_event_count {
    group_label: "Behavioural Features"
    label: "View Item Event Count"
    description: "Count of view_item event occurrence in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_view_item ;;
  }

  dimension: view_promotion_event_count {
    group_label: "Behavioural Features"
    label: "View Promotion Event Count"
    description: "Count of view_promotion event occurrence in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_view_promotion ;;
  }
# }

# user_first_engagement time related features
# {
  dimension: dayofweek {
    description: "Day of the week of user's first engagement"
    type: number
    sql: ${TABLE}.dayofweek ;;
  }

  dimension: julianday {
    group_label: "Date related features"
    label: "User's first engagement Julianday"
    description: "User's first engagement Julianday"
    type: number
    sql: ${TABLE}.julianday ;;
  }

  # dimension: month {
  #   description: "Month of user's first engagement"
  #   type: number
  #   sql: ${TABLE}.month ;;
  # }

  dimension_group: user_first_engagement {
    group_label: "Date related features"
    label: "User's first engagement"
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
