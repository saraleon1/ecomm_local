# - dashboard: test_dashboard
#   title: filter_test
#   layout: newspaper
#   refresh: 1 minute
#   query_timezone: query_saved
#   elements:
#   - title: New Tile 2
#     name: New Tile 2
#     model: sara_leon_ecommerce_git_test
#     explore: order_items
#     type: looker_column
#     fields: [inventory_items.sold_week, inventory_items.count]
#     fill_fields: [inventory_items.sold_week]
#     sorts: [inventory_items.sold_week desc]
#     limit: 50
#     query_timezone: UTC
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     series_types: {}
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     listen:
#       test_more_filters: order_items.inventory_item_id
#     row: 0
#     col: 14
#     width: 8
#     height: 6
#   - name: ''
#     type: text
#     body_text: |-
#       <div class="slidecontainer">
#         <input type="range" min="1" max="100" value="50" class="slider" id="myRange">
#       </div>
#     row: 6
#     col: 14
#     width: 8
#     height: 6
#   - title: New Tile 3
#     name: New Tile 3
#     model: sara_leon_ecommerce_git_test
#     explore: order_items
#     type: table
#     fields: [order_items.id, order_items.gpb]
#     limit: 500
#     query_timezone: UTC
#     row: 8
#     col: 0
#     width: 8
#     height: 6
#   - name: Test Tile 4
#     title: Test Tile 4
#     model: sara_leon_ecommerce_git_test
#     explore: order_items
#     type: single_value
#     fields: [order_items.id]
#     sorts: [inventory_items.cost]
#     limit: 500
#     column_limit: 50
#     query_timezone: UTC
#     custom_color_enabled: true
#     custom_color: ''
#     show_single_value_title: true
#     single_value_title: Test Override
#     show_comparison: false
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     series_types: {}
#     listen:
#       ID: inventory_items.id
#       start time test: inventory_items.created_date
#     row: 0
#     col: 0
#     width: 14
#     height: 8
#   filters:
# #   - name: ID
# #     title: ID
# #     type: field_filter
# #     default_value: '1,2,3'
# #     allow_multiple_values: true
# #     required: true
# #     model: sara_leon_ecommerce_git_test
# #     explore: inventory_items
# #     listens_to_filters: []
# #     field: inventory_items.id
#   - name: start time test
#     title: start time test
#     type: date_filter
#     default_value: 2019/04/15 to 2019/04/15
#     allow_multiple_values: true
#     required: false
# #   - name: test_more_filters
# #     title: test_more_filters
# #     type: field_filter
# #     default_value: ''
# #     allow_multiple_values: true
# #     required: false
# #     model: sara_leon_ecommerce_git_test
# #     explore: order_items
# #     listens_to_filters: []
# #     field: order_items.inventory_item_id
