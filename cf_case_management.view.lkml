view: cf_case_management {
  sql_table_name: actian.cf_case_management ;;

  dimension: ap {
    type: number
    sql: ${TABLE}.ap ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension_group: date_in {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: to_timestamp(${TABLE}.date_in) ;;
  }

  dimension_group: date_out {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_out ;;
  }

  dimension: imageflag {
    type: string
    sql: ${TABLE}.imageflag ;;
  }

  dimension: investigation_number {
    type: string
    sql: ${TABLE}.investigation_number ;;
  }

  dimension: invtransno {
    type: number
    sql: ${TABLE}.invtransno ;;
  }

  dimension_group: loaddttm {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.loaddttm ;;
  }

  dimension: misrep_class {
    type: string
    sql: ${TABLE}.misrep_class ;;
  }

  dimension: outcome {
    type: string
    sql: ${TABLE}.outcome ;;
  }

  dimension: policy_no_aauicl {
    type: string
    sql: ${TABLE}.policy_no_aauicl ;;
  }

  dimension: referral_source {
    type: string
    sql: CASE WHEN ${TABLE}.referral_source IN ('QM Convictions','QM Multiple','QM Claims','QM NCD','QM Lic Years','QM Vehicle DOP','QM Proposer','QM Storage') THEN 'QM' ELSE  ${TABLE}.referral_source END ;;
  }

  dimension: saving {
    type: number
    sql: ${TABLE}.saving ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user {
    type: string
    sql: LOWER(${TABLE}."user") ;;
  }

  dimension: adverse_group {
    type : number
    sql: CASE WHEN UPPER(${TABLE}.outcome) IN ('CHARGED AP', 'VOID', 'CANCELLED') AND ${TABLE}.imageflag = ' ' THEN 1 ELSE 0 END ;;
  }

dimension: month_previous {
  type: date
  sql:  add_months(to_date (current_timestamp),-1) ;;
}

  dimension: year_previous {
    type: date
    sql:  add_months(to_date (current_timestamp),-12) ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
  measure: ap_charged {
    type:  sum
    sql:  ${TABLE}.ap ;;
    filters: {
      field:  imageflag
      value: "' '"
    }
    value_format_name: gbp
  }

  measure: ap_charged_this_month {
    type:  sum
    sql:  ${TABLE}.ap ;;
    filters: {
      field:  imageflag
      value: "' '"
    }
    filters: {
      field: date_in_month
      value: "this month"
    }
    html:
    {% if value > ap_charged_last_month._value %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_up.png" height=20 width=20></p>
    {% elsif value == ap_charged_last_month._value %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/1035/human_o2/128/new_go_next.png" height=20 width=20></p>
    {% else %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_down.png" height=20 width=20></p>
    {% endif %}
    ;;
    value_format_name: gbp
  }

  measure: ap_charged_last_month {
    type:  sum
    sql:  ${TABLE}.ap ;;
    filters: {
      field:  imageflag
      value: "' '"
    }
    filters: {
      field: date_in_month
      value: "last month"
    }
  }

  measure: referred {
    type :  count

    filters: {
      field:  status
      value: "-Clear Not Investigated"
    }
    filters: {
      field:  imageflag
      value: "' '"
    }

  }
  measure: clear_not_investigated {
    type :  count

    filters: {
      field:  status
      value: "Clear Not Investigated"
    }
    filters: {
      field:  imageflag
      value: "' '"
    }
    drill_fields: [user, referral_rate, referrals, clear_not_investigated]
  }
  measure:  referrals{
    type:  count
    filters: {
      field: imageflag
      value: "' '"}
    drill_fields: [user, referral_rate, referrals, clear_not_investigated]
  }
  measure:  referrals_current_month{
    type:  count
    filters: {
      field: imageflag
      value: "' '"}
    filters: {
      field:  date_in_month
      value: "this month"
    }
    html:
    {% if value > referrals_last_month._value %}
      <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_up.png" height=20 width=20></p>
    {% elsif value == referrals_last_month._value %}
     <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/1035/human_o2/128/new_go_next.png" height=20 width=20></p>
    {% else %}
      <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_down.png" height=20 width=20></p>
    {% endif %}
;;
  }
  measure:  referrals_last_month{
    type:  count
    filters: {
      field: imageflag
      value: "' '"}
    filters: {
      field:  date_in_month
      value: "last month"
    }
  }
  measure: referral_rate{
    type:   number
    sql: 1.0*${referred}/${referrals} ;;
    value_format_name: percent_2
  }
  measure: adverse_outcomes {
    type:  count
    filters: {
      field:  status
      value: "Suspect, Inconsistency, Fraud"
    }
    filters: {
      field:imageflag
      value: "' '"
    }
    drill_fields: [user, referral_rate, referrals, clear_not_investigated]
  }
  measure: adverse_outcomes_this_month {
    type:  count
    filters: {
      field:  status
      value: "Suspect, Inconsistency, Fraud"
    }
    filters: {
      field:imageflag
      value: "' '"
    }
    filters: {
      field:  date_in_month
      value: "this month"
    }
    html:
    {% if value >= adverse_outcomes_last_month._value %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_up.png" height=20 width=20></p>
    {% elsif value == open_investigations_last_month._value %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/1035/human_o2/128/new_go_next.png" height=20 width=20></p>
    {% else %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_down.png" height=20 width=20></p>
    {% endif %}
    ;;
  }
  measure: adverse_outcomes_last_month {
    type: count
    filters: {
      field:  status
      value: "Suspect, Inconsistency, Fraud"
    }
    filters: {
      field:  imageflag
      value: "' '"
    }
    filters: {
      field:  date_in_month
      value: "last month"
    }
  }
  measure: success_rate {
    type:  number
    sql: 1.0*${adverse_outcomes}/${referrals} ;;
    value_format_name: percent_2
  }
  measure: claim_savings {
    type:  sum
    sql:  ${TABLE}.saving ;;
    filters: {
      field:  imageflag
      value: "' '"
    }
    value_format_name: gbp
  }

  measure: claim_savings_this_month {
    type:  sum
    sql:  ${TABLE}.saving ;;
    filters: {
      field:  imageflag
      value: "' '"
    }
    filters: {
      field:  date_in_month
      value: "this month"
    }
    html:
    {% if value >= claim_savings_last_month._value %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_up.png" height=20 width=20></p>
    {% elsif value == claim_savings_last_month._value %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/1035/human_o2/128/new_go_next.png" height=20 width=20></p>
    {% else %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_down.png" height=20 width=20></p>
    {% endif %}
    ;;
    value_format_name: gbp
  }

  measure: claim_savings_last_month {
    type:  sum
    sql:  ${TABLE}.saving ;;
    filters: {
      field:  imageflag
      value: "' '"
    }
    filters: {
      field:  date_in_month
      value: "last month"
    }
  }

  measure: open_investigations_last_month {
    type: count
    filters: {
      field:  status
      value: "Investigating"
    }
    filters: {
      field:  imageflag
      value: "' '"
    }
    filters: {
      field:  date_in_month
      value: "last month"
    }
  }
  measure: open_investigations_current_month {
    type: count
    filters: {
      field:  status
      value: "Investigating"
    }
    filters: {
      field:  imageflag
      value: "' '"
    }
filters: {
      field:  date_in_month
      value: "this month"
    }
    html:
    {% if value >= open_investigations_last_month._value %}
      <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_up.png" height=20 width=20></p>
    {% elsif value == open_investigations_last_month._value %}
     <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/1035/human_o2/128/new_go_next.png" height=20 width=20></p>
    {% else %}
      <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_down.png" height=20 width=20></p>
    {% endif %}
;;
  }

  measure:  cancelled_this_month{
    type:  count
    filters: {
      field: outcome
      value: "Cancelled"
    }
    filters: {
      field:  imageflag
      value: "' '"
    }
filters: {
      field:  date_in_month
      value: "this month"
    }
    html:
    {% if value > cancelled_last_month._value %}
      <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_up.png" height=20 width=20></p>
    {% elsif value == cancelled_last_month._value %}
     <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/1035/human_o2/128/new_go_next.png" height=20 width=20></p>
    {% else %}
      <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_down.png" height=20 width=20></p>
    {% endif %}
;;
  }
  measure: cancelled_last_month {
    type: count
    filters: {
      field:  outcome
      value: "Cancelled"
    }
    filters: {
      field:  imageflag
      value: "' '"
    }
    filters: {
      field:  date_in_month
      value: "last month"
    }
  }
  measure: void_this_month {
    type:  count
    filters: {
      field:  outcome
      value: "Void"
    }
    filters: {
      field:  imageflag
      value: "' '"
    }
    filters: {
      field:  date_in_month
      value: "this month"
    }
    html:
    {% if value > void_last_month._value %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_up.png" height=20 width=20></p>
    {% elsif value == void_last_month._value %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/1035/human_o2/128/new_go_next.png" height=20 width=20></p>
    {% else %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_down.png" height=20 width=20></p>
    {% endif %}
    ;;
  }
  measure: void_last_month {
    type: count
    filters: {
      field:  outcome
      value: "Void"
    }
    filters: {
      field:  imageflag
      value: "' '"
    }
    filters: {
      field:  date_in_month
      value: "last month"
    }
  }
  measure: charged_additional_premium_this_month {
    type: count
    filters: {
      field:  outcome
      value: "Charged AP"
    }
    filters: {
      field:  imageflag
      value: "' '"
    }
    filters: {
      field:  date_in_month
      value: "this month"
    }
    html:
    {% if value > charged_additional_premium_last_month._value %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_up.png" height=20 width=20></p>
    {% elsif value == charged_additional_premium_last_month._value %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/1035/human_o2/128/new_go_next.png" height=20 width=20></p>
    {% else %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_down.png" height=20 width=20></p>
    {% endif %}
    ;;
  }
  measure: charged_additional_premium_last_month {
    type: count
    filters: {
      field:  outcome
      value: "Charged AP"
    }
    filters: {
      field:  imageflag
      value: "' '"
    }
    filters: {
      field:  date_in_month
      value: "last month"
    }
  }
  measure: proportionate_settlement_this_month {
    type:  count
    filters: {
      field: outcome
      value: "Proportionate"
    }
    filters: {
      field:  imageflag
      value: "' '"
    }
    filters: {
      field:  date_in_month
      value: "this month"
    }
    html:
    {% if value > proportionate_settlement_last_month._value %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_up.png" height=20 width=20></p>
    {% elsif value == proportionate_settlement_last_month._value %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/1035/human_o2/128/new_go_next.png" height=20 width=20></p>
    {% else %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_down.png" height=20 width=20></p>
    {% endif %}
    ;;
  }
  measure: proportionate_settlement_last_month {
    type: count
    filters: {
      field:  outcome
      value: "Proportionate"
    }
    filters: {
      field:  imageflag
      value: "' '"
    }
    filters: {
      field:  date_in_month
      value: "last month"
    }
  }
  measure: adverse_outcome_rate_this_month {
    type: number
    sql: 1.0*${adverse_outcomes_this_month}/${referrals_current_month} ;;
    value_format_name: percent_2

    html:
    {% if value > adverse_outcome_rate_last_month._value %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_up.png" height=20 width=20></p>
    {% elsif value == adverse_outcome_rate_last_month._value %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/1035/human_o2/128/new_go_next.png" height=20 width=20></p>
    {% else %}
    <p>{{ rendered_value }}<img src="https://findicons.com/files/icons/573/must_have/48/stock_index_down.png" height=20 width=20></p>
    {% endif %}
    ;;
  }
  measure: adverse_outcome_rate_last_month {
    type: number
    sql: 1.0*${adverse_outcomes_last_month}/${referrals_last_month} ;;

  }

  #----------Create Dummy Table For Transposing Monthly Report----------#

  dimension: dummy_monthly_report {
    case: {
      when: {
        label: "Referrals Current Month"
        sql: 1=1 ;;
      }
      when: {
        label: "Open Investigations Current Month"
        sql: 1=1 ;;
      }
      when: {
        label: "Cancelled This Month"
        sql: 1=1 ;;
      }
      when: {
        label: "Void This Month"
        sql: 1=1 ;;
      }
      when: {
        label: "Charged Additional Premium This Month"
        sql: 1=1 ;;
      }
      when: {
        label: "Propotionate Settlement This Month"
        sql: 1=1 ;;
      }
      when: {
        label: "Adverse Outcomes This Month"
        sql: 1=1 ;;
      }
      when: {
        label: "Adverse Outcome Rate This Month"
        sql: 1=1 ;;
      }
      when: {
        label: "Ap Charged This Month"
        sql: 1=1 ;;
      }
      when: {
        label: "Claim Savings This Month"
        sql: 1=1 ;;
      }
    }
  }

}
