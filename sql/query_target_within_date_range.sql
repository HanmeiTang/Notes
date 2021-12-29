SELECT `name`, `time`, `expedited`
FROM `wp_cp_calculated_fields_form_posts`
WHERE `formid` = 14
  AND `time` < NOW() - INTERVAL 20 DAY
  AND `time`
    > NOW() - INTERVAL 50 DAY
  AND `ipaddr` != ''108.60.104.202''
  AND (
    `task_status` = '' Wait client provide info ''
   OR `task_status` = '' Not start ''
   OR `task_status` = '' Urge ''
   OR LENGTH (task_status) = 0
    )