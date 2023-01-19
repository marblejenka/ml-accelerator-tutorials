view: citi_bike_trips {
  derived_table: {
    sql:  SELECT *, GENERATE_UUID() as trip_id
          FROM `bigquery-public-data`.new_york.citibike_trips
    ;;
  }

  dimension: trip_id {
    type: string
    sql: ${TABLE}.trip_id ;;
    primary_key: yes
  }

  dimension: trip_duration {
    type: number
    sql: ${TABLE}.tripduration ;;
  }

  dimension_group: start_time {
    type: time
    sql: ${TABLE}.starttime ;;
  }

  dimension_group: stop_time {
    type: time
    sql: ${TABLE}.stoptime ;;
  }

  dimension: start_station_id {
    type: number
    sql: ${TABLE}.start_station_id ;;
  }

  dimension: start_station_name {
    type: string
    sql: ${TABLE}.start_station_name ;;
  }

  dimension: start_station_latitude {
    type: number
    sql: ${TABLE}.start_station_latitude ;;
  }

  dimension: start_station_longitude {
    type: number
    sql: ${TABLE}.start_station_longitude ;;
  }

  dimension: end_station_id {
    type: number
    sql: ${TABLE}.end_station_id ;;
  }

  dimension: end_station_name {
    type: string
    sql: ${TABLE}.end_station_name ;;
  }

  dimension: end_station_latitude {
    type: number
    sql: ${TABLE}.end_station_latitude ;;
  }

  dimension: end_station_longitude {
    type: number
    sql: ${TABLE}.end_station_longitude ;;
  }

  dimension: bike_id {
    type: number
    sql: ${TABLE}.bikeid ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.usertype ;;
  }

  dimension: birth_year {
    type: number
    sql: ${TABLE}.birth_year ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  measure: trip_count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      trip_duration,
      start_time_time,
      stop_time_time,
      start_station_id,
      start_station_name,
      start_station_latitude,
      start_station_longitude,
      end_station_id,
      end_station_name,
      end_station_latitude,
      end_station_longitude,
      bike_id,
      user_type,
      birth_year,
      gender
    ]
  }
}
