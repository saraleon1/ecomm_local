connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

access_grant: test_for_chat {
  user_attribute: sara_test_chat
  allowed_values: ["Test"]
}

# datagroup: ecommerce_default_datagroup {
#   # sql_trigger: SELECT MAX(id) FROM etl_log;;
#   max_cache_age: "1 hour"
# }

# persist_with: ecommerce_default_datagroup

# explore: events {
#   join: users {
#     type: left_outer
#     sql_on: ${events.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: inventory_items {
#   join: products {
#     type: left_outer
#     sql_on: ${inventory_items.product_id} = ${products.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: order_items {
#   join: inventory_items {
#     type: left_outer
#     sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
# #     sql_where: ${order_items.inventory_item_id} > 1 ;;
#     relationship: many_to_one
#   }
#
#   join: orders {
#     type: left_outer
#     sql_on: ${order_items.order_id} = ${orders.id} ;;
#     relationship: many_to_one
#   }
#
#   join: products {
#     type: left_outer
#     sql_on: ${inventory_items.product_id} = ${products.id} ;;
#     relationship: many_to_one
#   }
#
#   join: users {
#     type: left_outer
#     sql_on: ${orders.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: orders {
#   join: users {
#     type: left_outer
#     sql_on: ${orders.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: products {
# #   access_filter: {
# #     field: products.id
# #     user_attribute: sara_test_chat
# #   }
# }

explore: schema_migrations {}

explore: user_data {
  join: users {
    type: left_outer
    view_label: "Account Information"
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
    fields: [-user_data.id]
  }
  join: user_data2 {
    from:  user_data
    view_label: "Account Information"
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id}  where ${user_data.user_id} > 22;;
    relationship: many_to_one
#we take the opportunity value to save the join
    fields: [user_data2.max_num_orders]
  }
}

explore: users {
#   required_access_grants: [test_for_chat]
}

explore: users_nn {}

# explore: ndt_1 {}

explore: pdt_1 {}

explore: user_facts {}

explore: orders_extended {}

explore: dt_sme_work {}
