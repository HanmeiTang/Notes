# SQL Instruction

### 查看SQL DB以及组件的版本

Go to https://wordpress.com/home/usaaqtax.com （不是wordpress后台）
Manager > Hosting Configuaration > Database Access > Open PhpMyAdmin
Click on ‘PhpMyAdmin’ logo to the upper left corner > Plugins > 可以看到所有组件的版本

### 为什么需要知道SQL DB版本?

wordpress后台用MariaDB，和常见的MySQL操作有区别。MariaDB数据库管理系统是MySQL的一个分支，主要由开源社区在维护，采用GPL授权许可。开发这个分支的原因之一是：甲骨文公司收购了MySQL后，有将MySQL闭源的潜在风险，因此社区采用分支的方式来避开这个风险。

### MariaDB operation examples

#### 1. query using regular expression
```SQL
SELECT
    *,
    REGEXP_SUBSTR(
        `paypal_post`,
        '(https:\/\/[A-Za-z0-9.\/-]*)'
    ) AS test
FROM
    `hanmei_wp_cp_calculated_fields_form_posts`
WHERE
    1
ORDER BY
    `hanmei_wp_cp_calculated_fields_form_posts`.`id`
DESC
LIMIT 7
```


#### 2. Extract name from data
```SQL
SELECT
    *,
    REGEXP_SUBSTR( `data`, BINARY "(?<=您的姓名: ).*") AS Name
FROM
    `wp_cp_calculated_fields_form_posts`
WHERE
    1
ORDER BY
    `wp_cp_calculated_fields_form_posts`.`id`
DESC
LIMIT 7
```

#### 目前版本
```SQL
SELECT
    `id`,
    `formid`,
    `time`,
    `ipaddr`,
    `notifyto` AS Email,
    `data`,
    REGEXP_SUBSTR(`data`, BINARY "(?<=您的姓名: ).*") AS NAME,
    REGEXP_SUBSTR(
        `paypal_post`,
        'https://[A-Za-z0-9./_-]*'
    ) AS test
FROM
    `wp_cp_calculated_fields_form_posts`
WHERE
    1
ORDER BY
    `wp_cp_calculated_fields_form_posts`.`id`
DESC
```

```SQL
SELECT
    id,
    REGEXP_REPLACE(
        `paypal_post`,
        '(https://usaaqtax.com/wp-content/uploads[A-Za-z0-9./_-]*).*(https://usaaqtax.com/wp-content/uploads[A-Za-z0-9./_-]*)',
        '1, 2'
    ) AS File1
FROM
    `hanmei_wp_cp_calculated_fields_form_posts`
WHERE
    1
ORDER BY
    `hanmei_wp_cp_calculated_fields_form_posts`.`id`
DESC
LIMIT 6
```

#### Create a new column
```SQL
ALTER TABLE hanmei_wp_cp_calculated_fields_form_posts
ADD urls mediumtext;
```

### References

* [MariaDB SQL RE](https://mariadb.com/kb/en/regexp_replace/)
* [SQL IDE](https://sqliteonline.com)
