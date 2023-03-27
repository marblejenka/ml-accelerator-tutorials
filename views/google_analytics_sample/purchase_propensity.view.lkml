view: purchase_propensity {
  derived_table: {
    sql:
    {% assign df = dataframe._parameter_value %}
    SELECT
      CONCAT(fullvisitorid, CAST(visitId AS STRING)) AS unique_session_id,

      {% if df == 'train' %}will_buy_on_return_visit {%else%} cast(null as string) {% endif %} as will_buy_on_return_visit,
      MAX(CAST(h.eCommerceAction.action_type AS INT64)) AS latest_ecommerce_progress,

      sum(IFNULL(totals.bounces, 0)) AS bounces,
      sum(IFNULL(totals.timeOnSite, 0)) AS time_on_site,
      sum(IFNULL(totals.pageviews, 0)) AS pageviews,

      string_agg(DISTINCT trafficSource.source) as source,
      string_agg(DISTINCT trafficSource.medium) as medium,
      channelGrouping,

      device.deviceCategory,

      min(IFNULL(geoNetwork.country, "")) AS country
  FROM `bigquery-public-data.google_analytics_sample.*`,
     UNNEST(hits) AS h
    JOIN (
          SELECT
            fullvisitorid,
            IF(COUNTIF(totals.transactions > 0 AND totals.newVisits IS NULL) > 0, "yes", "no") AS will_buy_on_return_visit
            FROM `bigquery-public-data.google_analytics_sample.*`
            GROUP BY fullvisitorid
          ) all_visitor_stats USING(fullvisitorid)
  WHERE 1=1

    AND totals.newVisits = 1
    AND date BETWEEN
        {% if df == 'train' %}
        '20160801' AND '20170531'
        {% else %}
        '20170701' AND '20170801'
        {% endif %}

  GROUP BY
  unique_session_id,
  will_buy_on_return_visit,
  channelGrouping,
  device.deviceCategory
 ;;
  }

  parameter: dataframe {
    type: unquoted
    default_value: "train"
    allowed_value: {
      value: "train"
    }
    allowed_value: {
      value: "predict"
    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: unique_session_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.unique_session_id ;;
  }

  dimension: will_buy_on_return_visit {
    type: string
    sql: ${TABLE}.will_buy_on_return_visit ;;
  }

  dimension: latest_ecommerce_progress {
    type: string
    sql: cast(${TABLE}.latest_ecommerce_progress as string) ;;
  }

  dimension: bounces {
    type: string
    sql: cast(${TABLE}.bounces as string) ;;
  }

  dimension: time_on_site {
    type: number
    sql: ${TABLE}.time_on_site ;;
  }

  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: channel_grouping {
    type: string
    sql: ${TABLE}.channelGrouping ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.deviceCategory ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  set: detail {
    fields: [
      unique_session_id,
      will_buy_on_return_visit,
      latest_ecommerce_progress,
      bounces,
      time_on_site,
      pageviews,
      source,
      medium,
      channel_grouping,
      device_category,
      country
    ]
  }
}
