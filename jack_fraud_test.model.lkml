connection: "echo_actian"

# include all the views
include: "*.view"

datagroup: jack_fraud_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: jack_fraud_test_default_datagroup

explore: cf_case_management {}

# - explore: aap_address

# - explore: aap_addrref

# - explore: aap_bpt001

# - explore: aap_businesstransaction

# - explore: aap_claim

# - explore: aap_claimant

# - explore: aap_claimfinancialsummary

# - explore: aap_claimhistory

# - explore: aap_claimlookups

# - explore: aap_claimstatushistory

# - explore: aap_client

# - explore: aap_covers

# - explore: aap_drvlic

# - explore: aap_edipol

# - explore: aap_emlref

# - explore: aap_feature

# - explore: aap_fonref

# - explore: aap_loss

# - explore: aap_name

# - explore: aap_paymentdetails

# - explore: aap_pol_nulls

# - explore: aap_poldrv

# - explore: aap_policy

# - explore: aap_policysnapshot

# - explore: aap_premtran

# - explore: aap_quote_ref_correction

# - explore: aap_raw_edi_dttm

# - explore: aap_reservebreakdownhistory

# - explore: aap_reservebreakdownlatest

# - explore: aap_reservebreakdownlatest_backup

# - explore: aap_roleonclaimforclaimant

# - explore: aap_rolesubtype

# - explore: aap_vehicledetailsview

# - explore: abi_business_area

# - explore: abi_occupation

# - explore: acxiom

# - explore: backup_insight_renewals

# - explore: backup_insight_renewals_lookup

# - explore: breakdown

# - explore: calendar_week

# - explore: car_genie_hi_res

# - explore: car_genie_hi_res_fail

# - explore: car_genie_v

# - explore: cf_case_management_fon_lookup

# - explore: cf_case_management_test

# - explore: cf_cue_discrepencies

# - explore: cf_loading_errors

# - explore: cf_qm

# - explore: cf_qm_getclaims

# - explore: cf_qm_getconvictions

# - explore: cf_qm_getdrivers

# - explore: cf_qm_getvehicle

# - explore: cf_suspicious_surnames

# - explore: cf_user

# - explore: channel_code

# - explore: chub_bsm_customer_history

# - explore: chub_bsm_transaction_history

# - explore: chub_drs_customer_history

# - explore: chub_drs_customer_ms_history

# - explore: claim_extract_control

# - explore: confused_claims

# - explore: confused_convictions

# - explore: confused_cover

# - explore: confused_driver

# - explore: confused_enhanced_cover

# - explore: confused_sales

# - explore: connectedcar

# - explore: control_override

# - explore: cue_last_run

# - explore: echo

# - explore: experian_extract_control

# - explore: home_claims

# - explore: home_claims_backup

# - explore: home_claims_backup_20170221

# - explore: home_claims_historic

# - explore: home_claims_temp

# - explore: home_confused_applicants

# - explore: home_confused_claims

# - explore: home_confused_cover

# - explore: home_confused_enhanced_cover

# - explore: home_confused_items

# - explore: home_confused_sales

# - explore: home_cover

# - explore: home_cover_bkup

# - explore: home_items

# - explore: home_items_bkup

# - explore: hourly_sales

# - explore: insight

# - explore: insight_cargenie

# - explore: insight_renewal_lookup

# - explore: insight_renewals_lookup

# - explore: lexis_control

# - explore: lk_home_retention

# - explore: lk_motor_retention

# - explore: lk_retention_home

# - explore: lk_retention_home_summary

# - explore: lk_retention_motor

# - explore: lk_retention_motor_summary

# - explore: matchbox_cleaned

# - explore: mem_prop_for_radar

# - explore: member

# - explore: msm_error_pols

# - explore: onerow

# - explore: override_control

# - explore: policy_extract_control

# - explore: postcode_geography

# - explore: qas

# - explore: qs_acxiom

# - explore: qs_additional_qualifications

# - explore: qs_all_acxiom

# - explore: qs_all_additional_qualifications

# - explore: qs_all_claims

# - explore: qs_all_convictions

# - explore: qs_all_cover

# - explore: qs_all_drivers

# - explore: qs_all_echo

# - explore: qs_all_experian_consumer_all

# - explore: qs_all_experian_consumer_ph

# - explore: qs_all_experian_cue_motor

# - explore: qs_all_experian_cue_pi

# - explore: qs_all_experian_errors

# - explore: qs_all_experian_vehicle

# - explore: qs_all_insight

# - explore: qs_all_lexisnexis

# - explore: qs_all_lexisnexis_driver

# - explore: qs_all_loading_errors

# - explore: qs_all_mi_outputs

# - explore: qs_all_modifications

# - explore: qs_all_radar_return

# - explore: qs_all_security_devices

# - explore: qs_all_sira

# - explore: qs_all_tad

# - explore: qs_all_tav

# - explore: qs_all_vehicles

# - explore: qs_arc_acxiom

# - explore: qs_arc_additional_qualifications

# - explore: qs_arc_claims

# - explore: qs_arc_convictions

# - explore: qs_arc_cover

# - explore: qs_arc_drivers

# - explore: qs_arc_echo

# - explore: qs_arc_experian_consumer_all

# - explore: qs_arc_experian_consumer_ph

# - explore: qs_arc_experian_cue_motor

# - explore: qs_arc_experian_cue_pi

# - explore: qs_arc_experian_errors

# - explore: qs_arc_experian_vehicle

# - explore: qs_arc_insight

# - explore: qs_arc_lexisnexis

# - explore: qs_arc_lexisnexis_driver

# - explore: qs_arc_loading_errors

# - explore: qs_arc_mi_outputs

# - explore: qs_arc_modifications

# - explore: qs_arc_radar_return

# - explore: qs_arc_security_devices

# - explore: qs_arc_service_timing_details

# - explore: qs_arc_service_timings

# - explore: qs_arc_sira

# - explore: qs_arc_tad

# - explore: qs_arc_tav

# - explore: qs_arc_vehicles

# - explore: qs_archive_ck_exceptions

# - explore: qs_archive_fields

# - explore: qs_archive_ref_exceptions

# - explore: qs_archive_retention

# - explore: qs_claims

# - explore: qs_convictions

# - explore: qs_correlation_correction

# - explore: qs_correlation_correction_dt

# - explore: qs_cover

# - explore: qs_drivers

# - explore: qs_echo

# - explore: qs_error_exceptions

# - explore: qs_experian_consumer_all

# - explore: qs_experian_consumer_ph

# - explore: qs_experian_cue_motor

# - explore: qs_experian_cue_pi

# - explore: qs_experian_errors

# - explore: qs_experian_vehicle

# - explore: qs_insight

# - explore: qs_ipt_history

# - explore: qs_last_loaded

# - explore: qs_last_loaded_20170816

# - explore: qs_last_loaded_20171005

# - explore: qs_last_loaded_backup

# - explore: qs_last_loaded_backup2

# - explore: qs_last_loaded_test

# - explore: qs_lexisnexis

# - explore: qs_lexisnexis_driver

# - explore: qs_loading_errors

# - explore: qs_mi_outputs

# - explore: qs_modifications

# - explore: qs_not_deconstructed

# - explore: qs_original_insight

# - explore: qs_policy_last_updated

# - explore: qs_radar_diagnostics

# - explore: qs_radar_return

# - explore: qs_reverb

# - explore: qs_security_devices

# - explore: qs_service_timing_details

# - explore: qs_service_timings

# - explore: qs_sira

# - explore: qs_tad

# - explore: qs_tad_correct

# - explore: qs_tad_correct2

# - explore: qs_tav

# - explore: qs_tav_correct

# - explore: qs_tav_correct2

# - explore: qs_text_load_filter

# - explore: qs_vehicle_lookup

# - explore: qs_vehicles

# - explore: quotes

# - explore: radar_scores

# - explore: radar_scores_res_v4

# - explore: rated_areas

# - explore: renewal_static_loading_errors

# - explore: renewal_static_table

# - explore: renewal_static_table_backup

# - explore: replication_control

# - explore: reverb

# - explore: reverb00

# - explore: reverb00_idx

# - explore: reverb01

# - explore: reverb01_idx

# - explore: reverb02

# - explore: reverb02_idx

# - explore: reverb03

# - explore: reverb03_idx

# - explore: reverb04

# - explore: reverb04_idx

# - explore: reverb05

# - explore: reverb05_idx

# - explore: reverb06

# - explore: reverb06_idx

# - explore: reverb07

# - explore: reverb07_idx

# - explore: reverb08

# - explore: reverb08_idx

# - explore: reverb09

# - explore: reverb09_idx

# - explore: reverb10

# - explore: reverb10_idx

# - explore: reverb11

# - explore: reverb11_idx

# - explore: reverb12

# - explore: reverb12_idx

# - explore: reverb13

# - explore: reverb13_idx

# - explore: reverb14

# - explore: reverb14_idx

# - explore: reverb15

# - explore: reverb15_idx

# - explore: reverb16

# - explore: reverb16_idx

# - explore: reverb17

# - explore: reverb17_idx

# - explore: reverb18

# - explore: reverb18_idx

# - explore: reverb19

# - explore: reverb19_idx

# - explore: reverb20

# - explore: reverb20_idx

# - explore: reverb21

# - explore: reverb21_idx

# - explore: reverb22

# - explore: reverb22_idx

# - explore: reverb23

# - explore: reverb23_idx

# - explore: reverb_heap_grp0

# - explore: reverb_heap_grp1

# - explore: reverb_last_updated

# - explore: sira_lookup

# - explore: staging_breakdown

# - explore: staging_insight

# - explore: staging_member

# - explore: staging_qs_last_loaded

# - explore: staging_reverb_last_updated

# - explore: staging_vl_vehicle_data_plus

# - explore: stg_qs_acxiom

# - explore: stg_qs_additional_qualifications

# - explore: stg_qs_claims

# - explore: stg_qs_convictions

# - explore: stg_qs_correlation_correction

# - explore: stg_qs_cover

# - explore: stg_qs_drivers

# - explore: stg_qs_echo

# - explore: stg_qs_experian_consumer_all

# - explore: stg_qs_experian_consumer_ph

# - explore: stg_qs_experian_cue_motor

# - explore: stg_qs_experian_cue_pi

# - explore: stg_qs_experian_errors

# - explore: stg_qs_experian_vehicle

# - explore: stg_qs_insight

# - explore: stg_qs_ipt_history

# - explore: stg_qs_last_loaded

# - explore: stg_qs_lexisnexis

# - explore: stg_qs_lexisnexis_driver

# - explore: stg_qs_loading_errors

# - explore: stg_qs_mi_outputs

# - explore: stg_qs_modifications

# - explore: stg_qs_radar_return

# - explore: stg_qs_reverb

# - explore: stg_qs_security_devices

# - explore: stg_qs_service_timing_details

# - explore: stg_qs_service_timings

# - explore: stg_qs_sira

# - explore: stg_qs_tad

# - explore: stg_qs_tav

# - explore: stg_qs_vehicle_lookup

# - explore: stg_qs_vehicles

# - explore: subject_searches

# - explore: subject_summary_2

# - explore: subject_summary_3

# - explore: tablename

# - explore: temp_matchbox

# - explore: temp_pf

# - explore: temp_push_events_vehicles

# - explore: temp_qs_cover

# - explore: temp_trip_coordinates

# - explore: temp_trips

# - explore: temp_vehicles_devices_trips_calc

# - explore: temp_vehicles_devices_trips_dtcs

# - explore: temptable

# - explore: test

# - explore: test_pb_load

# - explore: test_qs_cover_uuid

# - explore: tmp_crossley_file

# - explore: v_aap_reservebreakdownhistory

# - explore: v_actian_failures

# - explore: v_av_qtd_prem

# - explore: v_cf_case_management

# - explore: v_claim_status

# - explore: v_conv_rdr

# - explore: v_conversion

# - explore: v_experian_failures

# - explore: v_hourly_qts

# - explore: v_hourly_sales

# - explore: v_mi_outputs

# - explore: v_model_abi_code

# - explore: v_mta_by_model

# - explore: v_poq_failures_last_week

# - explore: v_poq_service_check

# - explore: v_qs_claims_rdr

# - explore: v_qs_cover

# - explore: v_qs_driver_rdr

# - explore: v_veh_mm_avg_bhp

# - explore: v_veh_mm_avg_cc

# - explore: v_veh_prop_claims

# - explore: v_veh_prop_conv

# - explore: v_veh_prop_mods

# - explore: v_xq_stats

# - explore: vl_flag_body_style

# - explore: vl_flag_manual

# - explore: vl_flag_manufacturer

# - explore: vl_flag_theft

# - explore: vl_open_research

# - explore: vl_vehicle_data

# - explore: vl_vehicle_data_bk

# - explore: vl_vehicle_data_plus

# - explore: vl_vehicle_data_prod02

# - explore: vl_vehicle_update_data

# - explore: vl_years

# - explore: wl_email

# - explore: wl_postcode

# - explore: wl_telephone

# - explore: zzz_insight

# - explore: zzz_insight_renewal_lookup
