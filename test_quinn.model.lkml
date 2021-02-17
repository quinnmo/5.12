connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  join: products_quinn {
    type: left_outer

    sql_on: ${inventory_items.product_id} = ${products_quinn.id} ;;
    relationship: many_to_one
  }
}


explore: liquid_in_join{
  view_name: products_quinn
  join: inventory_items {
    type: inner
    sql_on: ${inventory_items.product_id} = ${products_quinn.id}
    AND {% condition inventory_items.date %} ${inventory_items.created_time} {% endcondition %};;
    relationship: many_to_one
  }
}

explore: order_items_quinn {

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items_quinn.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items_quinn.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products_quinn {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products_quinn.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: products_quinn {}

explore: schema_migrations {}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}

explore: users_nn {}

explore: users_pdt {}
