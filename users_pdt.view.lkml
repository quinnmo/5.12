view: users_pdt {
 derived_table: {
   sql: select id from users  ;;
  persist_for: "1 hour"
 }
dimension: id {}
}
