### Create a PHP snippet
```PHP
<?php
$posts = $wpdb->get_results("SELECT formid, ipaddr FROM test 
WHERE 1 ORDER BY id DESC LIMIT 1");
if (!$posts) {
    echo 'Empty Query Result!';
} else {
    echo "Successful Query!<br>";
    echo $posts[0]->ipaddr;
}
?>
```
