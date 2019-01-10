# If necessary, uncomment the line below to include explore_source.
# include: "ecommerce.model.lkml"

view: ndt_1 {
  derived_table: {
    explore_source: orders {
      column: created_day_of_week {}
      column: count {}
      column: age { field: users.age }
      filters: {
        field: users.age
        value: ">30"
      }
      filters: {
        field: orders.count
        value: ""
      }
    }
  }
  dimension: created_day_of_week {
    type: date_day_of_week
  }
  dimension: count {
    type: number
  }
  dimension: age {
    type: number
  }
}
