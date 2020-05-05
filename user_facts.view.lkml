view: user_facts {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
        *
      FROM orders
      GROUP BY user_id
      LIMIT 92
      ;;
      indexes: ["id"]
  }

  dimension: user_id {}

}
