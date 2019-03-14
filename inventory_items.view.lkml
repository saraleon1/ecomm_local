view: inventory_items {
  sql_table_name: demo_db.inventory_items ;;

#   required_access_grants: [test_for_chat]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
#     required_access_grants: [test_for_chat]
    sql: ${TABLE}.cost ;;
  }

  measure: cost_measure {
    type: number
    sql: ${TABLE}.cost;;
  }

  parameter: date_part {
    type: date
    allowed_value: {
      label: "Oct 5"
      value: "2018-10-05"
    }

  }

  dimension: created_date_trunc {
    type: date
    sql: {% parameter date_part %};;
    group_label: "Created Date"
    convert_tz: no
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
      year,
      day_of_year
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
#     html:<b><center><p style="background-color:#44AEA5;"><font size = "10" color="#5B44AE"><a href="#drillmenu" target="_self"> {{ rendered_value | append: "% anything? can go in here?" | truncatewords: 5, " WORKING?" | split: "" | reverse | join: "" }} </a> </font> </p> </center></b>;;
    link: {
      label: "Show as scatter plot"
      url: "
      {% assign vis_config = '{

      \"show_view_names\"           : true,

      }' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}"
    }
  }


}
