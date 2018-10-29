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
    drill_fields: [detail*]
  }

  dimension: bi_actv_ae_nm {
    label: "Acct AE Name"
    type: string
    sql: ${TABLE}.BI_ACTV_AE_NM ;;
    drill_fields: [detail*]
  }

  dimension: bi_month_key {
    group_label: "Date Dimensions"
    label: "Month Number"
    type: number
    sql: ${TABLE}.BI_MONTH_KEY ;;
    drill_fields: [detail*]
  }

  dimension: month_name {
    group_label: "Date Dimensions"
    type: string
    sql: case
          when ${bi_month_key} = 1 THEN 'Jan'
          when ${bi_month_key} = 2 THEN 'Feb'
          when ${bi_month_key} = 3 THEN 'Mar'
          when ${bi_month_key} = 4 THEN 'Apr'
          when ${bi_month_key} = 5 THEN 'May'
          when ${bi_month_key} = 6 THEN 'June'
          when ${bi_month_key} = 7 THEN 'July'
          when ${bi_month_key} = 8 THEN 'Aug'
          when ${bi_month_key} = 9 THEN 'Sept'
          when ${bi_month_key} = 10 THEN 'Oct'
          when ${bi_month_key} = 11 THEN 'Nov'
          when ${bi_month_key} = 12 THEN 'Dec'
          ELSE null END;;
  }

  dimension: bi_parent {
    label: "Parent"
    type: string
    sql: ${TABLE}.BI_PARENT ;;
    drill_fields: [detail*]

    link: {
      label: "Website"
      url: "http://www.google.com/search?q={{ value | encode_uri }}&btnI"
      icon_url: "http://www.google.com/s2/favicons?domain=www.{{ value | encode_uri }}.com"
    }


    link: {
      label: "{{value}} Single Customer Dashboard"
      url: "/dashboards/418?Parent={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }

  }

  measure: count_of_customers {
    type: count_distinct
    sql: ${bi_parent} ;;
    drill_fields: [detail*]
  }

  dimension: bi_primary {
    label: "Primary"
    type: string
    sql: ${TABLE}.BI_PRIMARY ;;
    drill_fields: [detail*]
  }

  dimension: bi_revcat_nm {
    label: "Revenue Category Name"
    type: string
    sql: ${TABLE}.BI_REVCAT_NM ;;
    drill_fields: [detail*]
  }

  dimension: bi_syscode_type {
    label: "Syscode Type"
    type: string
    sql: ${TABLE}.BI_SYSCODE_TYPE ;;
    drill_fields: [detail*]
  }

  dimension: crncy {
    hidden: yes
    label: "Customer Revenue Current Year"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.CRNCY ;;
    drill_fields: [detail*]
  }

  measure: linear_revenue_current_year {
    group_label: "Financial Metrics"
    label: "Linear Revenue Current Year"
    type: sum
    value_format_name: usd_0
    sql: ${crncy} ;;
    drill_fields: [detail*]
  }

  dimension: crnpy {
    hidden: yes
    label: "Customer Revenue Prior Year"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.CRNPY ;;
    drill_fields: [detail*]
  }

  measure: linear_revenue_prior_year {
    group_label: "Financial Metrics"
    label: "Linear Revenue Prior Year"
    type: sum
    value_format_name: usd_0
    sql: ${crnpy} ;;
    drill_fields: [detail*]
  }

  dimension: drncy {
    hidden: yes
    label: "Digital Revenue Current Year"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.DRNCY ;;
    drill_fields: [digitaldrill*]
  }

  measure: digital_revenue_current_year {
    group_label: "Financial Metrics"
    label: "Digital Revenue Current Year"
    type: sum
    value_format_name: usd_0
    sql: ${drncy} ;;
    drill_fields: [digitaldrill*]
  }

  dimension: drnpy {
    hidden: yes
    label: "Digital Revenue Prior Year"
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.DRNPY ;;
    drill_fields: [digitaldrill*]
  }

  measure: digital_revenue_Prior_year {
    group_label: "Financial Metrics"
    label: "Digital Revenue Prior Year"
    type: sum
    value_format_name: usd_0
    sql: ${drnpy} ;;
    drill_fields: [digitaldrill*]
  }

   dimension: combined_drncy_crncy {
    hidden: yes
     type: number
     value_format_name: usd
     sql: ${drncy} + ${crncy} ;;
    drill_fields: [detail*]
  }


  measure: combined_revenue {
    group_label: "Financial Metrics"
    label: "Total Revenue Current Year"
    type: sum
    value_format_name: usd_0
    sql: ${combined_drncy_crncy} ;;
    drill_fields: [detail*]
  }

  dimension: legacy_co {
    label: "Legacy Co"
    type: string
    sql: ${TABLE}.LEGACY_CO ;;
    drill_fields: [detail*]
  }

  dimension: market {
    type: string
    sql: ${TABLE}.MARKET ;;
    drill_fields: [detail*]
  }

  measure: count_of_markets {
    type: count_distinct
    sql: ${market} ;;
    drill_fields: [detail*]
  }

  dimension: week {
    group_label: "Date Dimensions"
    type: number
    sql: ${TABLE}.WEEK ;;
    drill_fields: [detail*]
  }

  dimension: lat {
    hidden: yes
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: long {
    hidden: yes
    type: number
    sql: ${TABLE}.long ;;
  }

  dimension: location {
    type: location
    sql_latitude: round(${lat},1) ;;
    sql_longitude: round(${long},1) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

   set: detail {
     fields: [bi_parent, bi_primary, market,
             digital_revenue_current_year,digital_revenue_Prior_year,
             linear_revenue_current_year, linear_revenue_prior_year]
   }
  set: digitaldrill {
    fields: [bi_parent, bi_primary, market,digital.bi_network_product_type, digital.bi_network_product_nm,
     digital_revenue_current_year,digital_revenue_Prior_year]
  }

}
