view: digitalvlinear {
  sql_table_name: rob.digital ;;

  dimension: bi_acct_exec_nm {
    type: string
    sql: ${TABLE}.BI_ACCT_EXEC_NM ;;
  }

  dimension: bi_actv_ae_nm {
    type: string
    sql: ${TABLE}.BI_ACTV_AE_NM ;;
  }

  dimension: bi_month_key {
    type: number
    sql: ${TABLE}.BI_MONTH_KEY ;;
  }

  dimension: bi_parent {
    type: string
    sql: ${TABLE}.BI_PARENT ;;
  }

  dimension: bi_primary {
    type: string
    sql: ${TABLE}.BI_PRIMARY ;;
  }

  dimension: bi_revcat_nm {
    type: string
    sql: ${TABLE}.BI_REVCAT_NM ;;
  }

  dimension: bi_syscode_type {
    type: string
    sql: ${TABLE}.BI_SYSCODE_TYPE ;;
  }

  dimension: crncy {
    type: number
    sql: ${TABLE}.CRNCY ;;
  }

  dimension: crnpy {
    type: number
    sql: ${TABLE}.CRNPY ;;
  }

  dimension: drncy {
    type: number
    sql: ${TABLE}.DRNCY ;;
  }

  dimension: drnpy {
    type: number
    sql: ${TABLE}.DRNPY ;;
  }

  dimension: legacy_co {
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
