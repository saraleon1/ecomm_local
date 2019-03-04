view: sql_runner_query_test {
  derived_table: {
    sql: SELECT
        inventory_items.id  AS `inventory_items.id`,
        inventory_items.product_id  AS `inventory_items.product_id`
      FROM demo_db.order_items  AS order_items
      LEFT JOIN demo_db.inventory_items  AS inventory_items ON order_items.inventory_item_id = inventory_items.id

      GROUP BY 1,2
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: inventory_items_id {
    type: number
    sql: ${TABLE}.`inventory_items.id` ;;
  }

  dimension: inventory_items_product_id {
    type: number
    sql: ${TABLE}.`inventory_items.product_id` ;;
  }

  set: detail {
    fields: [inventory_items_id, inventory_items_product_id]
  }
}
