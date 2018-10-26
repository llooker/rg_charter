view: digitalvlinear {
  # sql_table_name: rob.digital ;;

  derived_table: {
    sql:
      SELECT
        GENERATE_UUID() as uuid, *
      FROM `rob.digital` AS digitalvlinear;;
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

  dimension: bi_month_key {
    label: "Month Key"
    type: number
    sql: ${TABLE}.BI_MONTH_KEY ;;
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

  dimension: crncy {
    label: "Customer Revenue Current Year"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.CRNCY ;;
  }

  dimension: crnpy {
    label: "Customer Revenue Prior Year"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.CRNPY ;;
  }

  dimension: drncy {
    label: "Digital Revenue Current Year"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.DRNCY ;;
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
