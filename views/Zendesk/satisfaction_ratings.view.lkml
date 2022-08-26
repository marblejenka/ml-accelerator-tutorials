view: satisfaction_ratings {
    sql_table_name: `looker-private-demo.zendesk.satisfaction_ratings` ;;

  dimension: assignee_id {
    type: string
    sql: ${TABLE}.assignee_id ;;
  }

  dimension: group_id {
    type: string
    sql: ${TABLE}.group_id ;;
  }

  dimension: requester_id {
    type: string
    sql: ${TABLE}.requester_id ;;
  }

  dimension: ticket_id {
    type: string
    sql: ${TABLE}.ticket_id ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: score {
    type: string
    sql: ${TABLE}.score ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      assignee_id,
      group_id,
      requester_id,
      ticket_id,
      id,
      score,
      comment
    ]
  }
}
