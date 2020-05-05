- dashboard: 1__discount_usage
  title: 1__discount_usage
  layout: newspaper
  elements:
  - name: New Tile
    title: New Tile
    merged_queries:
    - model: sara_leon_ecommerce_git_test
      explore: inventory_items
      type: looker_line
      fields: [inventory_items.cost, inventory_items.date_test_ticket]
      sorts: [inventory_items.date_test_ticket desc]
      limit: 500
      query_timezone: UTC
    - model: sara_leon_ecommerce_git_test
      explore: inventory_items
      type: table
      fields: [inventory_items.date_test_ticket, inventory_items.product_id]
      sorts: [inventory_items.date_test_ticket desc]
      limit: 500
      query_timezone: UTC
      join_fields:
      - field_name: inventory_items.date_test_ticket
        source_field_name: inventory_items.date_test_ticket
      - field_name: inventory_items.product_id
        source_field_name: inventory_items.cost
    type: table
    listen:
    - test_filter: inventory_items.cost
    - test_filter: inventory_items.cost
    row: 0
    col: 0
    width: 8
    height: 6
  filters:
  - name: test_filter
    title: test_filter
    type: field_filter
    default_value: '18.54'
    allow_multiple_values: true
    required: false
    model: sara_leon_ecommerce_git_test
    explore: inventory_items
    listens_to_filters: []
    field: inventory_items.cost
