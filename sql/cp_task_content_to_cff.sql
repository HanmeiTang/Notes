-- Copy all original data to cff
UPDATE wp_cp_calculated_fields_form_posts cff
    INNER JOIN aq_task task ON cff.id = task.id
SET cff.paid_amount         = task.`paid amount`,
    cff.paid_status         = task.`Paid or not?`,
    cff.pmt_date            = task.`Task Start or Last Pmt Date`,
    cff.task_status         = task.`Task Status`,
    cff.wait_files          = task.`Wait files`,
    cff.task_type           = task.`Task Type`,
    cff.fee_paid_for_client = task.`application fee need to pay for client`,
    cff.what_to_file        = task.`what to file`,
    cff.due_date            = task.`Due date`,
    cff.task_period         = task.`Task Period`,
    cff.received_files      = task.`Received files`,
    cff.get_a_quote_or_not  = task.`get a quote or not`,
    cff.assigned_to         = task.`Task assigned to`,
    cff.note                = task.`backoffice note`;


-- Update `note_by` to `Back Ind` WHERE `note` is not null
UPDATE wp_cp_calculated_fields_form_posts
SET note_by = 'Back Ind'
WHERE LENGTH(note) != 0;