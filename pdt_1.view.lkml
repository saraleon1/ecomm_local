view: pdt_1 {
  derived_table: {
    sql:
        SELECT
            *
        FROM demo_db.orders;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    drill_fields: [id, users.first_name,users.last_name,created_date]

  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      hour,
      day_of_month,
      week,
      day_of_week,
      day_of_week_index,
      month,
      month_name,
      quarter,
      year,
      day_of_year,
      fiscal_quarter,
      fiscal_quarter_of_year,
      second
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: periods_ago {
    type: number
    sql: CASE WHEN MOD(${created_year},4) = 0 THEN FLOOR( DATEDIFF(CURRENT_DATE(), ${created_raw}) / 366 )
              WHEN MOD(${created_year},4) != 0 THEN FLOOR( DATEDIFF(CURRENT_DATE(), ${created_raw}) / 365 )
              END;;
  }

  measure: first_order {
    type: date_time
    sql: min(${created_raw}) ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
# #     html: <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
# ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
#     drill_fields: [id, users.last_name, users.first_name, users.id, order_items.count]
  }

  measure: user_ordered_list {
    type: list
    list_field: user_id
  }

  dimension: case_param_dimension {
    type: string
    case: {
      when: {
        sql: ${user_id} >= 1 AND ${user_id} < 100 ;;
        label: "1 to 99"
      }
      when: {
        sql: ${user_id} >= 100 AND ${user_id} < 200 ;;
        label: "100 to 199"
      }
      else: "Greater than or equal to 200"
    }
  }
}
