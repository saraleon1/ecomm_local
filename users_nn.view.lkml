view: users_nn {
  sql_table_name: demo_db.usersNN ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name + ${other_table.dimension1};;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name]
  }
}


view: other_table {
    derived_table: {
      sql: SELECT
        users_nn.id  AS `users_nn.id`
      FROM demo_db.usersNN  AS users_nn
       ;;
    }
    dimension: dimension1 {
      sql: 1=1 ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: users_nn_id {
      type: number
      primary_key: yes
      sql: ${TABLE}.`users_nn.id` ;;
    }

    set: detail {
      fields: [users_nn_id]
    }
  }
