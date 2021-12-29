<?php
// This script is to remove name, phone, email from `data` and save to `clean_data`
$source = "wp_cp_calculated_fields_form_posts";
$target = "aq_task";

$query_max_id_from_source = "SELECT id FROM $source ORDER BY id DESC LIMIT 1";
$query_max_id_from_target = "SELECT id FROM $target ORDER BY id DESC LIMIT 1";

$end = $wpdb->get_results($query_max_id_from_source)[0]->id;
$start = $wpdb->get_results($query_max_id_from_target)[0]->id + 1;

for ($x = $start; $x <= $end; $x++) {
    if ($x >= $start) {
        $insert_target = "INSERT INTO $target(id) value($x)";
        $wpdb->query($insert_target);
    }

    // update formid
    $query_formid = "SELECT formid FROM $source WHERE id=$x";
    $formid = $wpdb->get_results($query_formid)[0]->formid;

    $update_formid = "UPDATE $target SET formid = $formid WHERE id=$x";
    $wpdb->query($update_formid);

    // update name
    $query_name = "SELECT name FROM $source WHERE id=$x";
    $name = $wpdb->get_results($query_name)[0]->name;
    $name = "\"" . $name . "\"";

    $update_name = "UPDATE $target SET name = BINARY $name WHERE id=$x";
    $wpdb->query($update_name);

    // update clean_data
    $query_clean_data = "SELECT clean_data FROM $source WHERE id=$x";
    $clean_data = $wpdb->get_results($query_clean_data)[0]->clean_data;
    $clean_data = "\"" . $clean_data . "\"";

    $update_clean_data = "UPDATE $target SET clean_data = $clean_data WHERE id=$x";
    $wpdb->query($update_clean_data);
}
?>