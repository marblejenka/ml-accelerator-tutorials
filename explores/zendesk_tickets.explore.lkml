include: "/views/zendesk_tickets/*.view"

explore: ticket {
  label: "Zendesk Tickets"

  # join: satisfaction_ratings {
  #   type: left_outer
  #   sql_on: ${ticket.id} = ${satisfaction_ratings.ticket_id} ;;
  #   relationship: one_to_many
  # }
}
