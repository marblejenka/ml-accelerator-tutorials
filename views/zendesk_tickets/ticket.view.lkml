view: ticket {
  sql_table_name: `looker-private-demo.zendesk.ticket` ;;

  dimension: required_followup {
    type: number
    sql: ${TABLE}.required_followup ;;
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
      required_followup,
      chat_duration,
      assignee_id,
      group_id,
      original_due_date_time,
      id,
      organization_id,
      requester_id,
      submitter_id,
      created_at_time,
      via_channel,
      priority,
      status,
      reason,
      self_assessment,
      issue_complexity,
      timeframe,
      next_step_owner,
      type,
      satisfaction_score
    ]
  }
}
