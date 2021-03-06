view: users {
  sql_table_name: demo_db.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    tags: ["user_id","groupId"]
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tier {
    type: tier
    tiers: [10, 18, 25, 40, 55, 65, 75, 90, 110]
    style: integer
    sql: ${age} ;;
    tags: ["segment_group_id"]
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }


  filter: testing {
    type: string
    suggest_dimension: city
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    tags: ["email"]
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    tags: ["first_name"]
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
    tags: ["last_name"]
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {

    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    link: {label: "Explore Top 20 Results by Sale Price" url: "https://dcleu.eu.looker.com/looks/134?toggle=fil,pik" }
  }

  dimension: perc_test_dim {
    type: number
    sql: ${age}/${id};;
    value_format: "0.0%"
  }

  measure: perc_test_two {
    type: number
    sql: COUNT(distinct ${city})/COUNT(distinct ${id})-1;;
    value_format: "+#,##0.00%;(#,##0.00%)"
  }

  measure: fake_decimal {
    type: number
    value_format: "0.0%"
    sql: 1.0 * 55/100 ;;
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
}
