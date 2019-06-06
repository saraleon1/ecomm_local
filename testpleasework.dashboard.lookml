- dashboard: tests_lookml
  title: tests_lookML
  layout: newspaper
  elements:
  - title: New Tile
    name: New Tile
    model: thelook_dcleu
    explore: order_items
    type: looker_scatter
    fields: [products.brand, products.department, orders.count]
    pivots: [products.department]
    filters:
      products.brand: ''
    sorts: [orders.count desc 0, products.brand, products.department]
    limit: 5
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color: [lightgrey]
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    # y_axes: [{label: '', orientation: bottom, series: [{id: Men - orders.count, name: Men,
    #         axisId: orders.count}, {id: Women - orders.count, name: Women, axisId: orders.count}],
    #     showLabels: true, showValues: true, maxValue: 2000, unpinAxis: false, tickDensity: default,
    #     tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    query_timezone: user_timezone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 0
    col: 0
    width: 8
    height: 6
  - title: New Tile 2
    name: New Tile 2
    model: thelook_dcleu
    explore: order_items
    type: looker_scatter
    fields: [products.brand, products.department, orders.count]
    pivots: [products.department]
    filters:
      products.brand: ''
    sorts: [orders.count desc 0, products.brand, products.department]
    limit: 5
    query_timezone: user_timezone
    stacking: ''
    show_value_labels: true
    label_density: 25
    label_color: [lightgrey]
    legend_position: right
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    y_axes: [{label: '', orientation: bottom, series: [{id: Men - orders.count, name: Men,
            axisId: orders.count}, {id: Women - orders.count, name: Women, axisId: orders.count}],
        showLabels: true, showValues: true, maxValue: 2000, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 6
