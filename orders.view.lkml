include: "users.view.lkml"
view: orders {
  sql_table_name: demo_db.orders ;;
  extends: [users]

  parameter: test {
      type: unquoted
      allowed_value: {value:"a"}
      allowed_value: {value:"b"}
      default_value: "b"
    }

    label: "{% if test._parameter_value == 'a' %} A
    {% elsif test._parameter_value == 'b' %} B
    {% else %} C {% endif %} Change in Base"


  dimension: test_text{
    type: string
    sql: 1=1 ;;
    html: <h1> test if this works </h1> ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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
  }

  dimension: test_string {
    type: string
    sql: concat(${status}, ' ', ${city}) ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
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


dimension: bracket {
  type: tier
  tiers: [0,50,100,500,1000, 10000]
  style: integer
  sql: ${user_id} ;;
}

  measure: count_distinct_of_user_ids {
    type: count_distinct
    sql: ${user_id} ;;

    drill_fields: [user_id]
  }

  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
    html: <div style="float: left
    ; width:{{ value | times:100}}%
    ; background-color: rgba(0,180,0,{{ value | times:100 }})
    ; text-align:left
    ; color: #FFFFFF
    ; border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 4px;">{{ value | times:100 }}%</p>
    </div>
    <div style="float: left
    ; width:{{ 1| minus:value | times:100}}%
    ; background-color: rgba(0,180,0,0.1)
    ; text-align:right
    ; border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 0px; color:rgba(0,0,0,0.0" )>{{value}}</p>
    </div>
    ;;
  }

  measure: percent_complete {type: number sql: (1/100)*(${user_id});;
    html: <div style="float: left
          ; width:{{ value | times:100}}%
          ; background-color: rgba(0,180,0,{{ value | times:100 }})
          ; text-align:left
          ; color: #FFFFFF
          ; border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 4px;">{{ value | times:100 }}%</p>
          </div>
          <div style="float: left
          ; width:{{ 1| minus:value | times:100}}%
          ; background-color: rgba(0,180,0,0.1)
          ; text-align:right
          ; border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 0px; color:rgba(0,0,0,0.0" )>{{value}}</p>
          </div>
      ;;
  }
}
