connection: "thelook"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: test {}

view: test {
  derived_table: {
    sql:
       select 0 as a, 5 as b;;
  }

  dimension: boo {
    type: number
    sql: ${TABLE}.a ;;
  }

  dimension: foo {
    type: number
    sql: ${TABLE}.b ;;
  }

  measure: zoo {
    type: number
    sql: CASE WHEN ${boo} > 0 THEN ${foo} / ${boo} END ;;
  }
}
