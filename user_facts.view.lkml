view: user_facts {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
        *
      FROM orders
      GROUP BY user_id
      LIMIT 100
      ;;
  }

  dimension: user_id {}

}
