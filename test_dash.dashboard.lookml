- dashboard: test_lookml_conversion
  title: test_lookml_conversion
  layout: newspaper
  elements:
  - title: Untitled1
    name: Untitled1
    model: sara_leon_ecommerce_git_test
    explore: products
    type: table
    fields: [products.id]
    limit: 500
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Untitled2
    name: Untitled2
    model: thelook_dcleu
    explore: products
    type: table
    fields: [products.id, products.retail_price]
    filters:
      products.id: "[1, 1000]"
    limit: 500
    row: 0
    col: 8
    width: 8
    height: 6
