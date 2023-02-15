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

  dimension_group: start {
    type: time
    sql: ${TABLE}.starttime ;;
    timeframes: [raw, date, time, day_of_week, hour_of_day, minute, hour, month, quarter, year, week]
  }

  dimension_group: stop {
    type: time
    sql: ${TABLE}.stoptime ;;
    timeframes: [raw, date, time, day_of_week, hour_of_day]
  }

  dimension_group: journey_time {
    type: duration
    sql_start: ${start_raw} ;;
    sql_end: ${stop_raw} ;;
    intervals: [minute, hour]
  }

  dimension: journey_time_mins_binned {
    label: "Binned Journey Time (Mins)"
    type: tier
    sql: ${minutes_journey_time} ;;
    style: integer
    tiers: [2, 5, 10, 20, 30, 60]
  }

  dimension: start_station_id {
    group_label: "Start Station"
    type: number
    sql: ${TABLE}.start_station_id ;;
  }

  dimension: start_station_name {
    group_label: "Start Station"
    type: string
    sql: ${TABLE}.start_station_name ;;
  }

  dimension: start_station_latitude {
    group_label: "Start Station"
    type: number
    sql: ${TABLE}.start_station_latitude ;;
  }

  dimension: start_station_longitude {
    group_label: "Start Station"
    type: number
    sql: ${TABLE}.start_station_longitude ;;
  }

  dimension: start_station {
    group_label: "Start Station"
    type: location
    sql_latitude: ${start_station_latitude} ;;
    sql_longitude: ${start_station_longitude} ;;
  }

  dimension: end_station_id {
    group_label: "End Station"
    type: number
    sql: ${TABLE}.end_station_id ;;
  }

  dimension: end_station_name {
    group_label: "End Station"
    type: string
    sql: ${TABLE}.end_station_name ;;
  }

  dimension: end_station_latitude {
    group_label: "End Station"
    type: number
    sql: ${TABLE}.end_station_latitude ;;
  }

  dimension: end_station_longitude {
    group_label: "End Station"
    type: number
    sql: ${TABLE}.end_station_longitude ;;
  }


  dimension: end_station {
    group_label: "End Station"
    type: location
    sql_latitude: ${end_station_latitude} ;;
    sql_longitude: ${end_station_longitude} ;;
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

  dimension: age {
    type: number
    sql: EXTRACT(YEAR FROM CURRENT_DATE()) - ${birth_year} ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  measure: trip_count {
    type: count
    drill_fields: [detail*]
  }

  measure: average_trip_duration {
    description: "Average Trip Duration (Minutes)"
    type: average
    sql: ${minutes_journey_time} ;;
    value_format_name: decimal_2
  }

  measure: total_trip_duration {
    description: "Total Trip Duration (Minutes)"
    type: sum
    sql: ${minutes_journey_time} ;;
  }

  measure: average_rider_age {
    type: average
    sql: ${age} ;;
    value_format_name: decimal_2
  }

  set: detail {
    fields: [
      trip_duration,
      start_time,
      stop_time,
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
