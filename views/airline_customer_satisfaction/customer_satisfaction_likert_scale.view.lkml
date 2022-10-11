include: "/views/airline_customer_satisfaction/customer_satisfaction.view"

view: customer_satisfaction_likert_scale {
 extends: [customer_satisfaction]


  dimension: seat_comfort {
    type: string

  }



  dimension: food_and_drink {
    type: string
    # sql: ${TABLE}.Food_and_drink ;;
  }

  dimension: gate_location {
    type: string
    # sql: ${TABLE}.Gate_location ;;
  }

  dimension: inflight_wifi_service {
    type: string
    # sql: ${TABLE}.Inflight_wifi_service ;;
  }

  dimension: inflight_entertainment {
    type: string
    # sql: ${TABLE}.Inflight_entertainment ;;
  }

  dimension: online_support {
    type: string
    # sql: ${TABLE}.Online_support ;;
  }

  dimension: ease_of_online_booking {
    type: string
    # sql: ${TABLE}.Ease_of_Online_booking ;;
  }

  dimension: on_board_service {
    type: string
    # sql: ${TABLE}.On_board_service ;;
  }

  dimension: leg_room_service {
    type: string
    # sql: ${TABLE}.Leg_room_service ;;
  }

  dimension: baggage_handling {
    type: string
    # sql: ${TABLE}.Baggage_handling ;;
  }

  dimension: checkin_service {
    type: string
    # sql: ${TABLE}.Checkin_service ;;
  }

  dimension: cleanliness {
    type: string
    # sql: ${TABLE}.Cleanliness ;;
  }

  dimension: online_boarding {
    type: string
    # sql: ${TABLE}.Online_boarding ;;
  }


 }
