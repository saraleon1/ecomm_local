view: products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
#     required_access_grants: [test_for_chat]
    sql: ${TABLE}.brand ;;
  }

  dimension: yesnodim {
    type: yesno
    sql: ${category} = "leggings";;
  }

  measure: brand_yesno {
    type: sum
    sql:  case when (${brand} = NULL) OR ${brand} <> "adidas" then 1 else 0 end ;;
  }

parameter: id_type {
  allowed_value: {
    label: "Yes"
    value: "brand"
    }
  allowed_value: {
    label: "No"
    value: "category"
  }
}

dimension: category_or_brand {
  type: string
  sql: case when {% parameter id_type %} = "brand" then ${brand} else ${category} end;;
}

#   measure: test_sum {
#     type: sum
#     sql: ${brand_yesno} ;;
#   }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    html: {% if value == "Accessories" %}
            These are accessories
          {% elsif value == "Pants"%}
            These are pants
          {% elsif value == "Active"%}
            This is activewear
          {% else %}
            {{value}}
          {% endif %} ;;
  }

  dimension: department {
    type: string
    label: "more testing"
    sql: ${TABLE}.department ;;
  }

  dimension: user_attribute_test {
    sql: 1=1 ;;
    html: This data is filtered using the user attribute value <font color="black">{{ _user_attributes['email'] }}</font> ;;
  }
  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension_group: rank {
    type: time
    timeframes: [hour_of_day]
    sql: ${TABLE}.rank ;;
#     html: {% if test == "1" %}
#               0{{rendered_value}}:00
#           {% endif %}
#
#           {% if test == "0" %}
#               {{rendered_value}}:00
#           {% endif %}
#
#           asdf{{value}}}}
#           ;;
  }

  dimension: cast_test{
    type: string
    sql: cast(${rank_hour_of_day} as char) ;;
  }
#
  dimension: test {
    type: string
    sql: (case when ${cast_test} == "0" then "1"
               when ${cast_test} == "1" then "1"
               when ${cast_test} == "2" then "1"
               when ${cast_test} == "3" then "1"
               when ${cast_test} == "4" then "1"
               when ${cast_test} == "5" then "1"
               else "0"
          end)
        ;;
  }

  dimension: retail_price {
    type: number
    value_format: "$#,##0"
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
#     filters:  {
#       field: sku
#       value: "<subscription_products.begin_date"
#     }
#     drill_fields: [id, item_name, inventory_items.count]
#     html: {{value}}:00 ;;
  }

  measure: nooryes {
    type: yesno
    sql: ${count} > 1 ;;
  }
}
