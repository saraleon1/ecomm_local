view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
<<<<<<< HEAD
    value_format: "0.00\%"
    # hidden: yes
    sql: ${TABLE}.order_id/100000 ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
=======
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
#     html: {{order_items.returned_raw._value}} ;;
  }

  dimension: try_this {
    sql: ${returned_time} ;;
  }

#   dimension: part_1 {
#     sql: case when {{_user_attributes['ubm_current_url']}} = 'value1' then ${part_1} = 'something'
#           when {{_user_attributes['ubm_current_url']}} != 'value1'  then ${part_1} = 'value2'
#           else null end;;
#     hidden:yes
#   }

#   html:
#   {% if value > 100 %}
#   <font color="darkgreen">{{ rendered_value }}</font>
#   {% elsif value > 50 %}
#   <font color="goldenrod">{{ rendered_value }}</font>
#   {% else %}
#   <font color="darkred">{{ rendered_value }}</font>
#   {% endif %} ;;

#   dimension: sitename {
#     label: "Site Name with Site Code"
#     type: string
#     sql: ${order_id} ;;
#     link: {
#       label: "Site & Account Details"
#       url:"https://www.google.com/{{_user_attributes['ubm_current_url']}}"
# #       icon_url: "https://www.{{part_1}}.com/SbolDotNetReports/images/favicon.ico"
#     }
#   }

#   dimension: sitename {
#     label: "Site Name with Site Code"
#     type: string
#     sql: ${order_id} ;;
#     link: {
#       label: "Site & Account Details"
#       url:"https://{{_user_attributes['ubm_current_url']}}.looker.com/dashboards/451}"
# #       icon_url: "https://www.{{part_1}}.com/SbolDotNetReports/images/favicon.ico"
#     }
#     }


  dimension: sitename {
    label: "Site Name with Site Code"
    type: string
    sql: ${order_id} ;;
    link: {
      label: "Site & Account Details"
      url:"https://{{_user_attributes['ubm_current_url']}}.looker.com/dashboards/123"
      icon_url: "https://{{_user_attributes['ubm_current_url']}}.looker.com/dashboards/123/images/favicon.ico"
    }
  }


  dimension: gpb {
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd_0
  }

  dimension: usd {
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd
  }

  measure: items_id_list {
    type: list
    list_field: inventory_item_id
  }
#
  measure: item_total_currency {
  type: number
#   sql:
#         if( {{_user_attributes['currency_type'] }} = gpb, ${TABLE}.sale_price, ${TABLE}.returned_at);;
  sql:
    CASE
      WHEN '{{_user_attributes['currency_type'] }}' = 'gbp' THEN ${order_id}
      ELSE ${sale_price}
    END
    ;;
}
#
# parameter: currency_selection {
#    {{_user_attributes['currency_type'] }};;


#    measure: item_total_currency {
#     type: number
#     sql:
#       case
#         when {% parameter currency_selection %} = 'gbp' then ${order_id}
#         when {% parameter currency_selection %} = 'usd' then ${sale_price}
#       end;;
#       }
>>>>>>> branch 'master' of git@github.com:saraleon1/ecomm_local.git

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }
}