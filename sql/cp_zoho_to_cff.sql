UPDATE wp_cp_calculated_fields_form_posts cff
    INNER JOIN aq_zoho_csv zoho
    ON CAST(cff.ssn AS UNSIGNED INTEGER) = zoho.`Client Fed ID`
SET cff.zoho_task_status = zoho.`Task Status`,
    cff.zoho_paid_status = zoho.`Paid or not?`,
    cff.zoho_paid_amount = zoho.`Total amount`,
    cff.zoho_pmt_date    = zoho.`pmt date`;


# Quick check
# SELECT *
# FROM wp_cp_calculated_fields_form_posts cff
#          INNER JOIN aq_zoho_csv zoho ON
#     CAST(cff.ssn AS UNSIGNED INTEGER) = zoho.`Client Fed ID`
# ORDER BY cff.ssn ASC