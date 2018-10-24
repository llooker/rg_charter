connection: "bigquery"

# include all the views
include: "*.view"

datagroup: rg_charter_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: rg_charter_default_datagroup

explore: digitalvlinear {
  label: "Digital vs. Linear"
  view_label: "Digital vs. Linear"
  join: digital {
    view_label: "Digital"
    relationship: one_to_many
    sql_on: ${digitalvlinear.bi_month_key} = ${digital.bi_month_key}
    AND
    ${digitalvlinear.bi_primary} = ${digital.bi_primary};;
  }
}
