connection: "thelook"

# include all the views
include: "*.view"
include: "test_dashboard.dashboard"

datagroup: sara_leon_ecommerce_git_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

access_grant: test_for_chat {
  user_attribute: sara_test_chat
  allowed_values: ["Test"]
}

datagroup: test_datagroup {
  sql_trigger: select max(date(timestamp)) from pdt_event_log  ;;
}

persist_with: sara_leon_ecommerce_git_test_default_datagroup

explore: events {
  description: "This data is filtered using the user attribute value <font>{{ _user_attributes['email'] }}</font>"
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  label: "1234test"
  group_label: "test model filter"
}

explore: order_items2 {
  from: order_items
  view_label: "order_items2"

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items2.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    view_label: "order_items2"
    sql_on: ${order_items2.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}
#
# explore: orders {
#   join: users {
#     type: left_outer
#     sql_on: ${orders.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }
# }

explore: products {}

explore: schema_migrations {}

explore: user_data {
#   join: users {
#     type: left_outer
#     sql_on: ${user_data.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }
}

# explore: users {
# #   join: users_ext {
# #     sql: ${users.id} = ${users_ext.id} ;;
# #     relationship: one_to_one
# #     fields: [users_ext.id, users_ext.zip]
# #   }
# }

# explore: users_nn {
# #   join: other_table {
# #     sql_on: ${users_nn.id} = ${users_nn.id} ;;
# #     type: left_outer
# #     relationship: many_to_one
# #   }
# }
explore: products2 {}
