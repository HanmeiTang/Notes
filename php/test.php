<?php
// This script is to remove name, phone, email from `data` and save to `clean_data`
$table = "wp_cp_calculated_fields_form_posts";

$query_null_clean_data = "SELECT id, formid, data, paypal_post, ipaddr FROM  $table WHERE `clean_data` IS NULL ORDER BY id DESC";
$query_all = "SELECT id, formid, data, paypal_post, ipaddr FROM  $table WHERE 1 ORDER BY id DESC";
$query_specific = "SELECT id, formid, data, paypal_post, ipaddr FROM  $table WHERE `id` = 949 ORDER BY id DESC";

$entries = $wpdb->get_results($query_all);  // change condition here

// Verify a successful SQL query
if ($entries) {
    // regular expression extraction
    for ($x = 0; $x < sizeof($entries); $x++) {
        // get index and resource
        $id = $entries[$x]->id;
        $data = $entries[$x]->data;
        $paypal_post = $entries[$x]->paypal_post;
        $ipaddr = $entries[$x]->ipaddr;
        $formid = $entries[$x]->formid;

        /* Parse ipaddr */
        $query_ip_count = "SELECT count(*) cunt FROM $table WHERE `ipaddr` = '$ipaddr' && `id` <= $id && formid IN (8,9)";
        $ip_count = $wpdb->get_var($query_ip_count);

        /* Parse data */

        // a big tail to be removed from data
        $tail_pattern = "/(?<=您的姓名: )[\s\S]*/";  // everything after name is removed

        // Name from data
        $matches = array();
        $name_pattern = "/(?<=您的姓名: ).*/";
        preg_match_all($name_pattern, $data, $matches);
        $names = array_values(array_unique($matches[0])); // dedup & reindex
        $name = "\"" . $names[0] . "\"";

        // Email from data
        $matches = array();
        $email_pattern = '/[\._a-zA-Z0-9-]+@[\._a-zA-Z0-9-]+/i';
        preg_match_all($email_pattern, $data, $matches);
        $emails = array_values(array_unique($matches[0]));
        $email = "\"" . $emails[0] . "\"";

        // Phone from data
        $matches = array();
        $phone_pattern = "/[0-9]{3}-[0-9]{3}-[0-9]{4}/";
        preg_match_all($phone_pattern, $data, $matches);
        $phones = array_values(array_unique($matches[0]));
        $phone = "\"" . $phones[0] . "\"";

        // SSN from data
        $matches = array();
        $ssn_pattern = "/(?<=SSN.{3}: )[0-9]{9}/";
        preg_match_all($ssn_pattern, $data, $matches);
        $ssns = array_values(array_unique($matches[0]));
        $ssn = "\"" . $ssns[0] . "\"";

        // expedited from data
        $expedited = "\"" . "正常" . "\"";
        if (strpos($data, '加急+$100（5天）') !== false) {
            $expedited = "\"" . "加急" . "\"";
        }

        // quote from data
        $matches = array();
        $quote_pattern = "/(?<=\\$)[0-9]+(?>[\n])/";
        preg_match_all($quote_pattern, $data, $matches);
        $quotes = array_values(array_unique($matches[0]));
        if ($formid == 8 || $formid == 9) {
            $quote = "\"" . $quotes[0] . "\"";
        } else {
            $quote = "\"\"";
        }

        // remove phone, email, name from data
        $clean_data = preg_replace($tail_pattern, "", $data);
        $clean_data = preg_replace($phone_pattern, "NA", $clean_data);
        $clean_data = preg_replace($email_pattern, "NA", $clean_data);
        $clean_data = preg_replace("/[\"\']/", "", $clean_data); // remove double quote
        $clean_data = "\"" . $clean_data . $names[0] . "\"";

        /* Parse paypal_post */

        // URLS from paypal_post
        $matches = array();
        //$pattern = "/https:\/\/usaaqtax.com\/wp-content\/uploads\/[0-9a-zA-Z\/._–-]+/";
        $pattern = "/(?<=\")https:\/\/usaaqtax.com\/wp-content\/uploads\/[^\"\r\n]+(?=\")/";
        preg_match_all($pattern, $paypal_post, $matches);
        $extract = array_values(array_unique($matches[0]));

        // using re matches to create html url link
        $urls = '';
        $clean_urls = '';
        for ($i = 0; $i < sizeof($extract); $i++) {
            $str = sprintf(
                "<a href=\'%s\' rel=\'nofollow\' target=\'_blank\'> file %d </a><br>",
                $extract[$i], $i + 1);
            $short_str = sprintf("%s ", $extract[$i]);
            //print($str);
            //print($short_str);
            $urls = $urls . $str;
            $clean_urls = $clean_urls . $short_str;
        }

        $urls = "\"" . $urls . "\""; // wrap it in SQL command
        $clean_urls = "\"" . $clean_urls . "\""; // wrap it in SQL command

        /* Implementation block */
        $sql_update = "UPDATE $table 
                       SET `clean_data` = BINARY $clean_data,
                           `name` = BINARY $name,
                           `email` = $email,
                           `phone` = $phone,
                           `ssn` = $ssn,
                           `urls` = BINARY $urls,
                           `clean_urls` = BINARY $clean_urls,
                           `expedited` = BINARY $expedited,
                           `quote` = $quote,
                           `ip_count` = $ip_count
                       WHERE `id` = $id";
        $wpdb->query($sql_update);
        //print($id . " " . $formid . $quote . "<br>");
        //print($sql_update);
    }

    //echo "<div>File urls updated successfully!</div>";
}

?>