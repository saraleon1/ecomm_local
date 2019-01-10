view: dt_sme_work {
  derived_table: {
    sql:
    SELECT
        user_id
        , COUNT(*) AS lifetime_orders
         , MAX(orders.created_at) AS most_recent_purchase_at
        , MIN(orders.created_at) AS first_purchase_at
        , DATEDIFF(now(), MIN(orders.created_at)) AS days_since_first_purchase
        , if((COUNT(*)) > 1,1,0) AS is_repeat_customer
        , TIMESTAMPDIFF(MONTH, MIN(orders.created_at), now()) AS months_since_first_purchase
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

dimension: days_since_first_purchase {
  type: number
}

dimension: is_repeat_customer{
  type: yesno
  sql:  ${TABLE}.is_repeat_customer ;;
}

dimension: months_since_first_purchase {
  type: number
}

dimension: avg_orders_per_month {
  type: number
  sql: 1.0 * ${lifetime_orders} / ${months_since_first_purchase} ;;
  value_format_name: decimal_2
}

}
