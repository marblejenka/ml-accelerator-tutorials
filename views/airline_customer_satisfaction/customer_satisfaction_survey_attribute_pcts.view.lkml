view: customer_satisfaction_survey_attribute_pcts {
   derived_table: {
      sql:
          select attribute, attribute_score, response_cnt,
              safe_divide(response_cnt , sum(response_cnt) over (partition by attribute)) as response_pct
          from (
           select attribute, attribute_score, count(0) as response_cnt
           from ${customer_satisfaction_survey.SQL_TABLE_NAME}
           group by 1,2
          ) t
          ;;
    }




  dimension: attribute_score_group {
    type: string
    sql: case ${attribute_score} when 0 then "no response"
                               when 1 then "very dissatisfied"
                               when 2 then "dissatisfied"
                               when 3 then "neutral"
                               when 4 then "satisfied"
                               when 5 then "very satisfied"
       end;;
      # order_by_field: attribute_score
  }

  dimension: attribute_3_score_group {
    type: string
    sql: case ${attribute_score} when 0 then "no response"
                               when 1 then "dissatisfied"
                               when 2 then "dissatisfied"
                               when 3 then "neutral"
                               when 4 then "satisfied"
                               when 5 then "satisfied"
       end;;
      # order_by_field: attribute_score
    }

  dimension: attribute {
    type: string
    sql: regexp_replace(${TABLE}.attribute,'_',' ') ;;
  }

    dimension: attribute_score {type:number}
    dimension: response_count {
      type: number
    }

   dimension: response_pct {
    type: number
    value_format_name: percent_1
  }

  measure: format_response_pct {
    label: "% of Responses"
    type: number
    sql: sum(case when ${attribute_score} in (1,2) then -1 else 1 end * ${response_pct}) ;;
    # html: {{ response_pct._rendered_value }} ;;
    value_format_name: percent_1
  }



}
