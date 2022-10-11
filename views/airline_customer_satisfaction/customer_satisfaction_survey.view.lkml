include: "/views/airline_customer_satisfaction/customer_satisfaction.view"

view: customer_satisfaction_survey {
 extends: [customer_satisfaction]


  dimension: seat_comfort {
    type: string
    sql: cast(${TABLE}.Seat_comfort as string) ;;
  }



  dimension: food_and_drink {
    type: string
    sql: cast(${TABLE}.Food_and_drink as string) ;;
  }

  dimension: gate_location {
    type: string
    sql: cast(${TABLE}.Gate_location as string) ;;
  }

  dimension: inflight_wifi_service {
    type: string
    sql: cast(${TABLE}.Inflight_wifi_service as string);;
  }

  dimension: inflight_entertainment {
    type: string
    sql: cast(${TABLE}.Inflight_entertainment as string) ;;
  }

  dimension: online_support {
    type: string
    sql: cast(${TABLE}.Online_support as string) ;;
  }

  dimension: ease_of_online_booking {
    type: string
    sql: cast(${TABLE}.Ease_of_Online_booking as string) ;;
  }

  dimension: on_board_service {
    type: string
    sql: cast(${TABLE}.On_board_service as string) ;;
  }

  dimension: leg_room_service {
    type: string
    sql: cast(${TABLE}.Leg_room_service as string) ;;
  }

  dimension: baggage_handling {
    type: string
    sql: cast(${TABLE}.Baggage_handling as string) ;;
  }

  dimension: checkin_service {
    type: string
    sql: cast(${TABLE}.Checkin_service as string);;
  }

  dimension: cleanliness {
    type: string
    sql: cast(${TABLE}.Cleanliness as string);;
  }

  dimension: online_boarding {
    type: string
    sql: cast(${TABLE}.Online_boarding as string);;
  }


 }
