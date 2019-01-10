view: inventory_items {
  sql_table_name: demo_db.inventory_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
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
    html:<b><center><p style="background-color:#44AEA5;"><font size = "13" color="#800000"> {{ rendered_value | date: "%b %d, %y" }} </font> </p> </center></b>;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: sold {
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
    sql: ${TABLE}.sold_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, products.item_name, products.id, order_items.count]
    html:<b><center><p style="background-color:#44AEA5;"><font size = "10" color="#5B44AE"><a href="#drillmenu" target="_self"> {{ rendered_value | append: "% anything? can go in here?" | truncatewords: 5, " WORKING?" | split: "" | reverse | join: "" }} </a> </font> </p> </center></b>;;

  }
}
