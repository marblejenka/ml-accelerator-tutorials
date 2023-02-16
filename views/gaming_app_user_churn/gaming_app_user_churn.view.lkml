view: gaming_app_user_churn {
  sql_table_name: `machine-learning-accelerator.ml_accelerator_tutorials.gaming_app_user_churn` ;;

# Custom Training Split Flag
# {
  dimension: training_flag {
    label: "Training Flag"
    description: "Pre split training and prediction data for custom split"
    type: yesno
    sql: ${TABLE}.training_flag ;;
  }
# }

# Label
# {
  dimension: churn_indicator {
    # group_label: "Label"
    label: "Churn Indicator"
    type: string
    # sql: cast(${TABLE}.churned as string) ;;
    sql: (case when cast(${TABLE}.churned as string) = "1" then "True" when cast(${TABLE}.churned as string)= "0" then "False" else Null end) ;;
  }
# }

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
  dimension: user_engagement_event_count {
    group_label: "Behavioural Features"
    label: "User Engagement Event Count"
    description: "Count of user_engagement event occurrence in first 24 hours"
    type: number
    sql: ${TABLE}.cnt_user_engagement ;;
  }

  dimension: level_start_quickplay_count {
    group_label: "Behavioural Features"
    label: "Quickplay Level Start Count"
    description: "Count of event where user starts quickplay"
    type: number
    sql: ${TABLE}.cnt_level_start_quickplay ;;
  }

  dimension: level_end_quickplay_count {
    group_label: "Behavioural Features"
    label: "Quickplay Level End Count"
    description: "Count of event where user ends quickplay"
    type: number
    sql: ${TABLE}.cnt_level_end_quickplay ;;
  }

  dimension: level_complete_quickplay_count {
    group_label: "Behavioural Features"
    label: "Quickplay Level Complete Count"
    description: "Count of event where user completes quickplay"
    type: number
    sql: ${TABLE}.cnt_level_complete_quickplay ;;
  }

  dimension: level_reset_quickplay_count {
    group_label: "Behavioural Features"
    label: "Quickplay Level Reset Count"
    description: "Count of event where user resets quickplay"
    type: number
    sql: ${TABLE}.cnt_level_reset_quickplay ;;
  }

  dimension: post_score_count {
    group_label: "Behavioural Features"
    label: "User Posts Score Event Count"
    description: "Count of event where user posts score"
    type: number
    sql: ${TABLE}.cnt_post_score ;;
  }

  dimension: spend_virtual_currency_count {
    group_label: "Behavioural Features"
    label: "User Virtual Currency Spend Event Count"
    description: "Count of event where user spends virtual currency"
    type: number
    sql: ${TABLE}.cnt_spend_virtual_currency ;;
  }

  dimension: ad_reward_count {
    group_label: "Behavioural Features"
    label: "User Ad Reward Event Count"
    description: "Count of event where user receives ad reward"
    type: number
    sql: ${TABLE}.cnt_ad_reward ;;
  }

  dimension: challenge_a_friend_count {
    group_label: "Behavioural Features"
    label: "User Challenge A Friend Event Count"
    description: "Count of event where user challenges a friend"
    type: number
    sql: ${TABLE}.cnt_challenge_a_friend ;;
  }

  dimension: completed_5_levels_count {
    group_label: "Behavioural Features"
    label: "User Five Level Completed Event Count"
    description: "Count of event where user completed 5 levels"
    type: number
    sql: ${TABLE}.cnt_completed_5_levels ;;
  }

  dimension: use_extra_steps_count {
    group_label: "Behavioural Features"
    label: "Extra Steps Used Event Count"
    description: "Count of event where user uses extra steps"
    type: number
    sql: ${TABLE}.cnt_use_extra_steps ;;
  }

# }

# user_first_engagement time related features
# {
  dimension: dayofweek {
    group_label: "Date related features"
    label: "User's first engagement Day of Week"
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

  dimension_group: user_first_engagement {
    group_label: "Date related features"
    label: "User's first engagement"
    type: time
    timeframes: [
      raw,
      date,
      month,
      year
    ]
    sql: ${TABLE}.user_first_engagement ;;
  }
# }

  measure: user_count {
    type: count
  }

  measure: user_churn_count {
    type: count
    filters: [churn_indicator: "True"]
  }

  measure: churn_rate {
    type: number
    sql: 1.0*${user_churn_count} / NULLIF(${user_count},0) ;;
    value_format_name: percent_2
  }
}
