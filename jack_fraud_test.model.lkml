connection: "echo_actian"

# include all the views
include: "*.view"

datagroup: jack_fraud_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: jack_fraud_test_default_datagroup

explore: cf_case_management {}

explore: ifb_case_management {}
