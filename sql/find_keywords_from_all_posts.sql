SELECT *
FROM `wp_posts`
WHERE post_content LIKE '%xyz-ips snippet%' && post_status = 'publish'