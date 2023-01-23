# view: user_churn_input_data {
#   derived_table: {
#     sql: select * except(churned), case when ntile>1 then null else churned end as churned,
#       case when ntile = 1 then true else false end as training_flag
#       /* ,case when ntile = 2 then true else false end as prediction_flag */
#     from
#     (select *,
#       NTILE(3) over (
#       partition by operating_system, cnt_add_to_cart, cnt_page_view, cnt_purchase, cnt_user_engagement, cnt_view_item, cnt_view_promotion, country, churned
#       order by operating_system, cnt_add_to_cart, cnt_page_view, cnt_purchase, cnt_user_engagement, cnt_view_item, cnt_view_promotion, country, churned) as ntile
#     from `bqmlpublic.demo_ga4churnprediction.training_data`)
#   ;;
#   }
# }

# # farmfingerprint
# view: user_churn_input_data {
#   derived_table: {
#     sql: select * except(churned)
#     case when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) > 7 then null else churned end as churned,
#     /*, case when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) >= 9 then null else churned end as churned,*/
#     case when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) <= 7 then true else false end as training_flag
#     /*   case when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) <= 7 then true when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) between 7 and 9 then false end as training_flag,
#       case when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) >= 9 then true else false end as prediction_flag */
#     from `bqmlpublic.demo_ga4churnprediction.training_data`
#   ;;
#   }
# }


# view: user_churn_input_data {
#   derived_table: {
#     sql: select * from `bqmlpublic.demo_ga4churnprediction.training_data`
#     where country = "United States"
#       and cnt_user_engagement >0 and cnt_page_view>1
#   ;;
#   }
# }


# view: user_churn_input_data {
#   derived_table: {
#     sql: select * except(cnt_user_engagement,cnt_page_view,cnt_view_promotion,cnt_begin_checkout,cnt_view_item,cnt_add_shipping_info),
#     case when cnt_user_engagement>3 then 3 else cnt_user_engagement end as cnt_user_engagement,
#     case when cnt_page_view>3 then 3 else cnt_page_view end as cnt_page_view,
#     case when cnt_view_promotion>2 then 2 else cnt_view_promotion end as cnt_view_promotion,
#     case when cnt_begin_checkout>3 then 3 else cnt_begin_checkout end as cnt_begin_checkout,
#     case when cnt_view_item>2 then 2 else cnt_view_item end as cnt_view_item,
#     case when cnt_add_shipping_info>3 then 3 else cnt_add_shipping_info end as cnt_add_shipping_info
#     from `bqmlpublic.demo_ga4churnprediction.training_data`
#           where country = "United States"

#         ;;
#   }
# }

# view: user_churn_input_data {
#   derived_table: {
#     sql: select * from
#     (select * except(churned,cnt_user_engagement,cnt_page_view,cnt_view_promotion,cnt_begin_checkout,cnt_view_item,cnt_add_shipping_info,cnt_select_promotion),
# case when churned=1 and (cnt_add_shipping_info>1 or cnt_begin_checkout>0  or dayofweek in (1,2)) and ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) > 1 then 0 else churned end as churned,
#     case when cnt_user_engagement>3 then 3 else cnt_user_engagement end as cnt_user_engagement,
#     case when cnt_page_view>3 then 3 else cnt_page_view end as cnt_page_view,
#     case when cnt_view_promotion>2 then 2 else cnt_view_promotion end as cnt_view_promotion,
#     case when cnt_begin_checkout>3 then 3 else cnt_begin_checkout end as cnt_begin_checkout,
#     case when cnt_view_item>2 then 2 else cnt_view_item end as cnt_view_item,
#     case when cnt_add_shipping_info>3 then 3 else cnt_add_shipping_info end as cnt_add_shipping_info
#     from `bqmlpublic.demo_ga4churnprediction.training_data`
#           where country = "United States")
#           where churned is not null

#         ;;
#   }
# }

view: user_churn_input_data {
  derived_table: {
    sql: select * except(churned),
    case when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) > 7 then null else churned end as churned,
    /*, case when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) >= 9 then null else churned end as churned,*/
    case when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) <= 7 then true else false end as training_flag
    /*   case when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) <= 7 then true when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) between 7 and 9 then false end as training_flag,
      case when ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) >= 9 then true else false end as prediction_flag */
    from (select * from
    (select * except(churned,cnt_user_engagement,cnt_page_view,cnt_view_promotion,cnt_begin_checkout,cnt_view_item,cnt_add_shipping_info,cnt_select_promotion),
case when churned=1 and (cnt_add_shipping_info>1 or cnt_begin_checkout>0  or dayofweek in (1,2)) and ABS(MOD(FARM_FINGERPRINT(user_pseudo_id), 10)) > 1 then 0 else churned end as churned,
    case when cnt_user_engagement>3 then 3 else cnt_user_engagement end as cnt_user_engagement,
    case when cnt_page_view>3 then 3 else cnt_page_view end as cnt_page_view,
    case when cnt_view_promotion>2 then 2 else cnt_view_promotion end as cnt_view_promotion,
    case when cnt_begin_checkout>3 then 3 else cnt_begin_checkout end as cnt_begin_checkout,
    case when cnt_view_item>2 then 2 else cnt_view_item end as cnt_view_item,
    case when cnt_add_shipping_info>3 then 3 else cnt_add_shipping_info end as cnt_add_shipping_info
    from `bqmlpublic.demo_ga4churnprediction.training_data`
          where country = "United States")
          where churned is not null)
  ;;
  }
}
