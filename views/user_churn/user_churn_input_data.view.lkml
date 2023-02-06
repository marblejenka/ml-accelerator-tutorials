# view: user_churn_input_data {
#   derived_table: {
#     sql: select * except(churned),
#     case when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) > 7 then null else churned end as churned,
#     case when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) <= 7 then true else false end as training_flag
#     from looker_bqml.input_data_user_churn
#   ;;
#   }
# }

view: user_churn_input_data {
  derived_table: {
    sql: select * except(churned,user_first_engagement),
    (TIMESTAMP_MICROS(user_first_engagement)) as user_first_engagement,
    case when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) > 7 then null else churned end as churned,
    case when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) <= 7 then true else false end as training_flag
    from (select * except(churned),
      case when churned=1 and (cnt_level_reset_quickplay>0) and ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 100)) > 3 then 0
      when churned=0 and (cnt_level_complete_quickplay>1 or dayofweek in (5,6,7)) and ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) > 1 then 1
      else churned end as churned,
      from looker_bqml.input_data_user_churn
    )
  ;;
  }
}
