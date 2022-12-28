include: "./user_churn_common_dimensions.view.lkml"
view: user_churn_prediction {
  derived_table: {
    sql: select * from ${user_churn_input_data.SQL_TABLE_NAME} where prediction_flag=false;;
  }
  extends: [user_churn_common_dimensions]
}
