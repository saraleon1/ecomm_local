view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: image_test {
    type: string
    sql: cast("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFk3tqiOgqRXbRKItsgpF8V8Oltcqghh6k9FJD3TA8zQhK06eh" as char);;
#     html: <center><img src="{{value}}" width = "40" /></center> ;;
    html:  <div class="slidecontainer">
  <input type="range" min="1" max="100" value="50" class="slider" id="myRange"> {{value}}
</div> ;;
  }




  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  parameter: points_from_date {
    type: date
    default_value: "after 2018/03/31"
  }

  dimension: order_id {
    type: number
    group_label: "group_label_test"
    # hidden: yes
    sql: ${TABLE}.order_id ;;
    html: {% if value < order_items.inventory_item_id._value %}
    <p style="color: red">{{ rendered_value }} </p>
    {% else %}
    <p style="color: green">{{ rendered_value }}</p>
    {% endif %} ;;
  }

  dimension: first_one {
    type: number
    sql: ${TABLE}.order_id / ${TABLE}.order_id ;;
    html: {% if order_items.yesnofortest._value == 'Yes' %}
              <p style="background-color: lightblue">{{rendered_value}}</p>
        {% endif %};;
  }

  dimension: second_one {
    type: number
    sql: ${TABLE}.order_id ;;
    html: {% if order_items.yesnofortest._value == 'Yes' %}
            <p style="background-color: lightblue">{{rendered_value}}</p>
          {% endif %};;
  }

  dimension: yesnofortest {
    type: yesno
    sql: ${first_one} = ${second_one} ;;
    html: {% if value == 'Yes' %}
            <p style="background-color: lightblue">{{rendered_value}}</p>
          {% endif %};;
  }


dimension: test_datetime {
  type: date_time
  sql: ${TABLE}.returned_at ;;
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
      year,
      millisecond
    ]
    label: "test"
    sql: ${TABLE}.returned_at ;;
    suggestable: yes
  }

  dimension: returned_date_test {
    sql: ${returned_date} ;;
    html:<font color="pink">{{ rendered_value | "%m/%d/%Y" }} </font> ;;
  }

  dimension: sale_price {
    label: "1_sale_price"
    type: number
    sql: ${TABLE}.sale_price ;;
#     html: {{order_items.returned_raw._value}} ;;
  }

  dimension: try_this {
    label: "2_try_this"
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

  measure: orderidcount {
    type: count
    # sql : ${order_id} ;;
  }

  measure: test {
    type: yesno
    sql: ${orderidcount} > 3 ;;
  }

  measure: status6 {
#hidden: yes
    type: date
    sql: (case when ${id}=6 then MAX(${returned_date_test}) OVER(PARTITION BY ${id} ORDER BY ${returned_date_test} end);;
  }




#
#   measure: item_total_currency {
#   type: number
# #   sql:
# #         if( {{_user_attributes['currency_type'] }} = gpb, ${TABLE}.sale_price, ${TABLE}.returned_at);;
#   sql:
#     CASE
#       WHEN '{{_user_attributes['currency_type'] }}' = 'gbp' THEN ${order_id}
#       ELSE ${sale_price}
#     END
#     ;;
# }
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

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }
}
