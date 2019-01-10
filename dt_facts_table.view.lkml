view: dt_facts_table {
  derived_table: {
      sql:
            SELECT
              orders.id  AS `orders.id`,
              COUNT(*) AS `orders.count`,
              SUM(orders.)
            FROM demo_db.orders  AS orders

            GROUP BY 1
            ORDER BY COUNT(*) DESC
            ;;
      }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    drill_fields: [id, users.first_name,users.last_name,created_date]
  }


  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      hour,
      day_of_month,
      week,
      day_of_week,
      day_of_week_index,
      month,
      month_name,
      quarter,
      year,
      day_of_year,
      fiscal_quarter,
      fiscal_quarter_of_year,
      second
    ]
    sql: ${TABLE}.created_at ;;
  }
}
