view: user_facts {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
        user_id as user_id
        , COUNT(*) as lifetime_orders
        , MAX(orders.created_at) as most_recent_purchase_at
        , MIN(orders.created_at) as first_purchase_at
        , DATEDIFF(now(), first_purchase_at) as days_since_first_purchase
        , lifetime_orders > 1 as is_repeat_customer
      FROM orders
      GROUP BY user_id
      ;;
  }

  dimension: user_id {}
  dimension: lifetime_orders {}
  dimension_group: first_purchase_at {
    type: time
    timeframes: [date, day_of_month, day_of_week, week, week_of_year, month, month_name, year]
  }

  dimension_group: most_recent_purchase_at {
    type: time
    timeframes: [date, day_of_month, day_of_week, week, week_of_year, month, month_name, year]
  }

  dimension: days_since_first_purchase {
    type:  number
  }

  dimension: is_repeat_customer {
    type:  yesno
    sql: ${TABLE}.is_repeat_customer ;;
  }

  dimension: months_since_first_purchase {
    type: number
  }

  dimension: avg_orders_per_month {
    type: number
    sql: 1.0*${lifetime_orders}/${months_since_first_purchase} ;;
    value_format_name: decimal_2
  }



}
