SELECT ipaddr,
       COUNT(ipaddr),
       email
FROM wp_cp_calculated_fields_form_posts
GROUP BY ipaddr
ORDER BY COUNT(ipaddr) DESC;