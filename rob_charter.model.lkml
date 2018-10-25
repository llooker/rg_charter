connection: "bigquery"
include: "*.view"

datagroup: rg_charter_default_datagroup {
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
            AND ${digitalvlinear.bi_parent} = ${digital.bi_parent}
            AND ${digitalvlinear.market} = ${digital.market}
            AND ${digitalvlinear.bi_revcat_nm} = ${digital.bi_revcat_nm}
            AND ${digitalvlinear.bi_syscode_type} = ${digital.bi_syscode_type}
            ;;
    fields: [
        digital.bi_network_cd,
        digital.bi_network_nm,
        digital.bi_digital,
        digital.bi_network_product_type,
        digital.bi_network_type,
        digital.drncy
      ]
  }
}
