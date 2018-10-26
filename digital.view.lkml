view: digital {
  # sql_table_name: rob.digitalonly ;;

  derived_table: {
    sql:
      SELECT
        GENERATE_UUID() as uuid, *
      FROM `rob.digitalonly` AS digital ;;
  }

  dimension: uuid {
    primary_key: yes
    hidden: yes
  }

  dimension: bi_acct_exec_nm {
    label: "Acct Exec Name"
    type: string
    sql: ${TABLE}.BI_ACCT_EXEC_NM ;;
  }

  dimension: bi_actv_ae_nm {
    label: "Acct AE Name"
    type: string
    sql: ${TABLE}.BI_ACTV_AE_NM ;;
  }

  dimension: bi_digital {
    label: "Digital"
    type: yesno
    sql: ${TABLE}.BI_DIGITAL ;;
  }

  dimension: bi_month_key {
    label: "Month Key"
    type: number
    sql: ${TABLE}.BI_MONTH_KEY ;;
  }

  dimension: bi_network_cd {
    label: "Network Code"
    type: string
    sql: ${TABLE}.BI_NETWORK_CD ;;
  }

  dimension: bi_network_nm {
    label: "Network Name"
    type: string
    sql: ${TABLE}.BI_NETWORK_NM ;;
  }

  dimension: bi_network_product_type {
    label: "Network Product Type"
    type: string
    sql: ${TABLE}.BI_NETWORK_PRODUCT_TYPE ;;
  }

  dimension: bi_network_type {
    label: "Network Type"
    type: string
    sql: ${TABLE}.BI_NETWORK_TYPE ;;
  }

  dimension: bi_parent {
    label: "Parent"
    type: string
    sql: ${TABLE}.BI_PARENT ;;
  }

  dimension: bi_primary {
    label: "Primary"
    type: string
    sql: ${TABLE}.BI_PRIMARY ;;
  }

  dimension: bi_revcat_nm {
    label: "Revenue Category Name"
    type: string
    sql: ${TABLE}.BI_REVCAT_NM ;;
  }

  dimension: bi_syscode_type {
    label: "Syscode Type"
    type: string
    sql: ${TABLE}.BI_SYSCODE_TYPE ;;
  }

  dimension: drncy {
    label: "Digital Revenue Current Year"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.DRNCY ;;
  }

  dimension: drncytm {
    label: "Digital Revenue Current Year Two Months"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.DRNCYTM ;;
  }

  dimension: drnpy {
    label: "Digital Revenue Prior Year"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.DRNPY ;;
  }

  dimension: legacy_co {
    label: "Legacy Co"
    type: string
    sql: ${TABLE}.LEGACY_CO ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.MARKET ;;
  }

  dimension: week {
    type: number
    sql: ${TABLE}.WEEK ;;
  }

  measure: count {
    type: count
     drill_fields: []
  }
}
