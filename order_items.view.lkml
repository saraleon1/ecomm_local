view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: part_1 {
    sql: case when {{_user_attributes['ubm_current_url']}} = "value1" then "value1"
          when {{_user_attributes['ubm_current_url']}} = "value2"  then "value2"
          else null end;;
    hidden:yes
  }

  dimension: sitename {
    label: "Site Name with Site Code"
    type: string
    sql: ${order_id} ;;
    link: {
      label: "Site & Account Details"
      url:"https://{{part_1}}/SBOLDotNetReports/ProfileSelection.aspx?formaction=/SBOLDotNetReports/Webpages/SiteReports/SiteAccountsView.aspx&id_user=ENOC&idoption=18&p=2152&os=LIVE&site={{value}}"
      icon_url: "https://www.{{part_1}}.com/SbolDotNetReports/images/favicon.ico"
    }
  }


  dimension: sale_price_format0 {
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd_0
  }

  dimension: sale_price_format1 {
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd
  }

  measure: items_id_list {
    type: list
    list_field: inventory_item_id
  }


  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]
  }
}
