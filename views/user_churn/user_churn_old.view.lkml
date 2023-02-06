# include: "./user_churn_common_dimensions.view.lkml"
# view: user_churn {
#   derived_table: {
#     # sql: select * from ${user_churn_input_data.SQL_TABLE_NAME} where prediction_flag=false;;
#     sql: select * from ${user_churn_input_data.SQL_TABLE_NAME};;
#   }
#   extends: [user_churn_common_dimensions]
# # Custom Training Split Flag
# # {
#   dimension: training_flag {
#     label: "Training Flag"
#     description: "Pre split training and prediction data for custom split"
#     type: yesno
#     sql: ${TABLE}.training_flag ;;
#   }
# # }

# # Label
# # {
#   dimension: churn_indicator {
#     # group_label: "Label"
#     label: "Churn Indicator"
#     type: string
#     # sql: cast(${TABLE}.churned as string) ;;
#     sql: (case when cast(${TABLE}.churned as string) = "1" then "Churned" when cast(${TABLE}.churned as string)= "0" then "Not Churned" else Null end) ;;
#   }
#   # dimension: churn_indicator {
#   #   # group_label: "Label"
#   #   label: "Churn Indicator"
#   #   # type: yesno
#   #   # sql: cast(${TABLE}.churned as string) ;;
#   #   sql: (case when cast(${TABLE}.churned as string) = "1" then True when cast(${TABLE}.churned as string)= "0" then False end) ;;
#   # }
# # }

# # # Prediction Flag
# # # {
# # dimension: prediction_flag {
# #   # group_label: "Label"
# #   label: "Prediction Flag"
# #   type: yesno
# #   sql: ${TABLE}.prediction_flag;;
# #   }
# # # }
# }
