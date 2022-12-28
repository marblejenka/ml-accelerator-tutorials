view: user_churn_input_data {
   derived_table: {
    sql: select *,
      case when ntile = 1 then true else false end as training_flag,
      case when ntile = 2 then true else false end as prediction_flag
    from
    (select *,
      NTILE(3) over (
      partition by operating_system, cnt_add_to_cart, cnt_page_view, cnt_purchase, cnt_user_engagement, cnt_view_item, cnt_view_promotion, country, churned
      order by operating_system, cnt_add_to_cart, cnt_page_view, cnt_purchase, cnt_user_engagement, cnt_view_item, cnt_view_promotion, country, churned) as ntile
    from `bqmlpublic.demo_ga4churnprediction.training_data`)
   ;;
  }
}
