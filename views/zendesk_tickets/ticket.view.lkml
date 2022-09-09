view: ticket {
  sql_table_name: `looker-private-demo.zendesk.ticket` ;;

  dimension: required_followup {
    type: yesno
    sql: ${TABLE}.required_followup = 1 ;;
  }

  dimension: chat_duration {
    type: number
    sql: ${TABLE}.chat_duration ;;
  }

  dimension: assignee_id {
    type: string
    sql: ${TABLE}.assignee_id ;;
  }

  dimension: group_id {
    type: string
    sql: ${TABLE}.group_id ;;
  }

  dimension_group: original_due_date {
    type: time
    sql: ${TABLE}.original_due_date ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: organization_name {
    type: string
    case: {
      when: {
        label: "Acme Automotive"
        sql: ${organization_id} = '544dc39dc9dc5c0b7910fe91bccea52cb4ff502725e8c951d4420a05a96ef5ff4c023bc2bd7271e7ab285e48a0027cc0a131bd7349cda5c27ba64667907e1165' ;;
      }
      when: {
        label: "Mt. Pleasant Dance Academy"
        sql: ${organization_id} = '724135236807abb03640bd55a9765f24efeb710a357c47bfc869efe71795e7781ff90cf469b6afdf12975ec97ca622941f976d0e688cfdf8ad4f35dd2046ff4d' ;;
      }
      when: {
        label: "Bayside Manor"
        sql: ${organization_id} = '4279897acf95dc8b2a5b9160fd8601c0f5495bbee444e9e506afd3b0b61910d3d12adc461e16a60b7bf2b0ee38fc42156286f2002602ab5d151e86462d1fa547' ;;
      }
      when: {
        label: "Outdoor Adventures"
        sql: ${organization_id} = 'ae5a31f519f263d6ff96c3987308d3656c7a5ca7e10b0249f331eb48d886d796719d05f087d1055731e41d29e4a70029bb388aa9f04d4df9134298878a0b7275' ;;
      }
      when: {
        label: "Tower Realty"
        sql: ${organization_id} = '6e0ed4d6fe0ce1ff538daf1dbd98f07abae8da01acaec2a10c000d5c9dbaaf843e8fe8e84e239402e5dda51b54bc3b553e83ca63c50977d9513143e8e00325bd' ;;
      }
      when: {
        label: "Smith & Smith LLC"
        sql: ${organization_id} = 'b520e1da6961591fc0f8bb9e5ed5586262fbcbdac62699fa8b09447cf0b7bcac58fa211f8dba874c3b3bcb3ef73f6510a91349762ec2843c4ddd665f73afdbbd' ;;
      }
      when: {
        label: "Big TV Network"
        sql: ${organization_id} = 'd7cc88029e2a73aa2a26e9518dd3d4055f9948970e0405fe178818472620e41b514755999193ae5ece70116f7a550204b624b07ebf42047cc1d193be87b1672f' ;;
      }
      when: {
        label: "FM Radio Company"
        sql: ${organization_id} = 'd108762ca0a45b30ab8eaea5c1e9e8b8f89875d7a39111c22ce91894040e1488791b9b8f1e365b5a2e3ad66acfdc5213ad0b9884eff8171021c1fea65849a096' ;;
      }
      when: {
        label: "First Wall Street Bank"
        sql: ${organization_id} = '519d004e39c4c525f0a1854ec66614f82346f8c96846399d895ce61ceb2adc8e061f4a25188637521bbe145d93f02d357176a8255ec111b0a9f5a1014f7ecb61' ;;
      }
      when: {
        label: "Acme Big Box Store"
        sql: ${organization_id} = 'ab2fff9739d1cd314bf7312ade431559bdef1d11b502922021c4a1bc4431367df276b4278f015c4da1fc46038fdd3fb2ab7a07a4653d0c0d9ba80fd8a262e637' ;;
      }
    }
  }

  dimension: requester_id {
    type: string
    sql: ${TABLE}.requester_id ;;
  }

  dimension: submitter_id {
    type: string
    sql: ${TABLE}.submitter_id ;;
  }

  # dimension_group: old_created_at {
  #   type: time
  #   sql: ${TABLE}.old_created_at ;;
  # }

  dimension_group: created_at {
    type: time
    datatype: datetime
    sql: ${TABLE}.created_at ;;
  }

  dimension: via_channel {
    type: string
    sql: ${TABLE}.via_channel ;;
  }

  # dimension: tone {
  #   type: string
  #   sql: ${TABLE}.tone ;;
  # }

  # dimension: action {
  #   type: string
  #   sql: ${TABLE}.action ;;
  # }

  # dimension: request_or_bug_ {
  #   type: string
  #   sql: ${TABLE}.request_or_bug_ ;;
  # }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  # dimension: topic {
  #   type: string
  #   sql: ${TABLE}.topic ;;
  # }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: self_assessment {
    type: string
    sql: ${TABLE}.self_assessment ;;
  }

  # dimension: escalation {
  #   type: string
  #   sql: ${TABLE}.escalation ;;
  # }

  dimension: issue_complexity {
    type: string
    sql: ${TABLE}.issue_complexity ;;
  }

  dimension: timeframe {
    type: string
    sql: ${TABLE}.timeframe ;;
  }

  dimension: next_step_owner {
    type: string
    sql: ${TABLE}.next_step_owner ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: satisfaction_score {
    type: string
    sql: NULLIF(${TABLE}.satisfaction_score, 'offered') ;;
  }

  measure: ticket_count {
    type: count
    drill_fields: [detail*]
  }

  measure: customer_count {
    type: count_distinct
    sql: ${organization_id} ;;
  }

  measure: positive_feedback_count {
    type: count
    filters: [satisfaction_score: "good"]
  }

  measure: negative_feedback_count {
    type: count
    filters: [satisfaction_score: "bad"]
  }

  set: detail {
    fields: [
      id,
      status,
      created_at_time,
      chat_duration,
      via_channel,
      priority,
      type,
      reason,
      issue_complexity,
      required_followup,
      self_assessment,
      satisfaction_score
    ]
  }
}
