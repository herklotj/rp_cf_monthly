 view: ifb_case_management {
   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql: SELECT *
FROM (SELECT *,
             forename + surname + dob + email + postcode + cor_postcode + mobile + day_fon + eve_fon + business + vrn AS no_matches,
             CASE
               WHEN referred = 'Yes' THEN 'Referred'
               WHEN referred = 'Already' THEN 'Already Captured'
               WHEN cause_code = ' ' THEN
                 CASE
                   WHEN referred = 'Yes' THEN 'Referred'
                   WHEN referred = 'Already' THEN 'Already Captured'
                 END
               ELSE cause_code
             END AS RESULT,
             CASE
               WHEN cause_code = 'KYO' THEN 'KYO'
               WHEN cause_code IN ('No Concerns','Weak Intel','Single Company M','Non Fault') OR referred = 'No' THEN 'Cleared'
               WHEN referred IN ('Yes','Already') OR cause_code = 'Too Late for Int' THEN 'Referred'
               ELSE referred
             END AS projected_outcome,
             CASE
               WHEN business = 1 OR cor_postcode = 1 OR day_fon = 1 THEN 'Business'
               ELSE 'Indivudal'
             END AS match_type,
             CASE
               WHEN locate (intel_insurance_type1,'Personal Lines Motor') != 257 THEN 1
               ELSE 0
             END AS personal_lines_motor,
             CASE
               WHEN locate (intel_insurance_type1,'Commercial Motor') != 257 THEN 1
               ELSE 0
             END AS commercial_motor,
             CASE
               WHEN locate (intel_insurance_type1,'Employers Liability') != 257 THEN 1
               ELSE 0
             END AS employers_liability,
             CASE
               WHEN locate (intel_insurance_type1,'Public Liability') != 257 THEN 1
               ELSE 0
             END AS public_liability,
             CASE
               WHEN locate (intel_insurance_type1,'Commercial Property') != 257 THEN 1
               ELSE 0
             END AS commercial_property,
             CASE
               WHEN locate (intel_mocat2_1,'Claims Fraud') != 257 THEN 1
               ELSE 0
             END AS claims_fraud,
             CASE
               WHEN locate (intel_mocat2_1,'Enabling Activity') != 257 THEN 1
               ELSE 0
             END AS enabling_activity,
             CASE
               WHEN locate (intel_mocat2_1,'Application Fraud') != 257 THEN 1
               ELSE 0
             END AS application_fraud,
             CASE
               WHEN forename = 1 AND surname = 1 AND dob = 1 THEN 1
               ELSE 0
             END AS full_name_dob,
             CASE
               WHEN surname = 1 AND forename = 0 AND (email = 1 OR dob = 1 OR postcode = 1 OR day_fon = 1 OR eve_fon = 1 OR mobile = 1 OR cor_postcode = 1 OR fax = 1 OR vrn = 1 OR business = 1) THEN 1
               ELSE 0
             END AS surname_other,
             CASE
               WHEN forename = 1 AND surname = 0 AND (email = 1 OR dob = 1 OR postcode = 1 OR day_fon = 1 OR eve_fon = 1 OR mobile = 1 OR cor_postcode = 1 OR fax = 1 OR vrn = 1 OR business = 1) THEN 1
               ELSE 0
             END AS forename_other,
             CASE
               WHEN surname = 1 AND forename = 1 AND (email = 1 OR dob = 1 OR postcode = 1 OR day_fon = 1 OR eve_fon = 1 OR mobile = 1 OR cor_postcode = 1 OR fax = 1 OR vrn = 1 OR business = 1) THEN 1
               ELSE 0
             END AS full_name_other
      FROM ifb_case_management
      WHERE current_flag = 'Y') a
  CROSS JOIN (SELECT COUNT(DISTINCT claim_number) AS total_claims
              FROM ice_dim_claim acp
                LEFT JOIN ice_trn_claim tc
                       ON acp.claim_id = tc.claim_id
                      AND tc.current_flag = 'Y'
              WHERE status_code IN ('OPEN','REOPENED')) b




       ;;
   }

   # Define your dimensions and measures here, like this:
   dimension: claim_number {
     type: string
     sql: ${TABLE}.claim_number ;;
   }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: productive_match {
    type: string
    sql: ${TABLE}.productive_match ;;
  }

  dimension: result {
    type: string
    sql: ${TABLE}.result ;;
  }


  dimension: cause_code {
    type: string
    sql: ${TABLE}.cause_code ;;
  }

  dimension: referred {
    type: string
    sql: ${TABLE}.referred ;;
  }

  dimension: match_type {
    type: string
    sql: ${TABLE}.match_type ;;
  }

  dimension: positive_match {
    type: string
    sql: ${TABLE}.postive_match ;;
  }

  dimension: projected_outcome {
    type: string
    sql: ${TABLE}.projected_outcome ;;
  }

  measure: no_claims {
    type:  count_distinct
    sql: ${TABLE}.claim_number;;
  }

  measure: total_claims {
    type: max
    sql: ${TABLE}.total_claims ;;
  }

  measure:  no_matches{
    type: sum
    sql: 1.0*${TABLE}.no_matches ;;
  }

  measure: all_claims {
    type: max
    sql: ${TABLE}.total_claims ;;
  }

  measure:  forname{
    type: sum
    sql: ${TABLE}.forename ;;
  }

  measure:  surname{
    type: sum
    sql: ${TABLE}.surname ;;
  }

  measure:  dob{
    type: sum
    sql: ${TABLE}.dob ;;
  }

  measure:  email{
    type: sum
    sql: ${TABLE}.email ;;
  }

  measure:  postcode{
    type: sum
    sql: ${TABLE}.postcode ;;
  }

  measure:  cor_postcode{
    type: sum
    sql: ${TABLE}.cor_postcode ;;
  }

  measure:  mobile{
    type: sum
    sql: ${TABLE}.mobile ;;
  }

  measure:  day_fon{
    type: sum
    sql: ${TABLE}.day_fon ;;
  }

  measure:  eve_fon{
    type: sum
    sql: ${TABLE}.eve_fon ;;
  }

  measure:  fax{
    type: sum
    sql: ${TABLE}.fax ;;
  }

  measure:  business{
    type: sum
    sql: ${TABLE}.business ;;
  }

  measure:  vrn{
    type: sum
    sql: ${TABLE}.vrn ;;
  }

  measure: personal_lines_motor {
    type: sum
    sql: ${TABLE}.personal_lines_motor ;;
  }

  measure: commercial_motor {
    type: sum
    sql: ${TABLE}.commercial_motor ;;
  }

  measure: employers_liability {
    type: sum
    sql: ${TABLE}.employers_liability ;;
  }

  measure: public_liability {
    type: sum
    sql: ${TABLE}.public_liability ;;
  }

  measure: commercial_property {
    type: sum
    sql: ${TABLE}.commercial_property ;;
  }

  measure: claims_fraud {
    type: sum
    sql: ${TABLE}.claims_fraud ;;
  }

  measure: enabling_activity {
    type: sum
    sql: ${TABLE}.enabling_activity ;;
  }

  measure: application_fraud {
    type: sum
    sql: ${TABLE}.application_fraud ;;
  }

  measure: full_name_dob {
    type: sum
    sql: ${TABLE}.full_name_dob ;;
  }

  measure: surname_other {
    type:  sum
    sql: ${TABLE}.surname_other ;;
  }

  measure: forename_other {
    type: sum
    sql: ${TABLE}.forename_other ;;
  }

  measure: full_name_other {
    type: sum
    sql:  ${TABLE}.full_name_other ;;
  }

  measure: av_matches {
    type:  average
    sql: ${TABLE}.no_matches ;;
  }
 }
