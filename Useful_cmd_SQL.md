
# Learning SQL Programming

## 0. Table manipulation
### 0.1 delete a table

```SQL
DROP TABLE IF EXISTS table_name;
```

### 0.2 create a table

```SQL
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
);
```
### 0.3 Insert
```SQL
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

### 0.4 delete
```SQL
DELETE FROM table_name WHERE condition;
```



## 1. Ask for data from a Database

### 1.1 Ask for data with `SELECT`

#### Print out using `SELECT`, anything in single quotes will bre returned as text

```SQL
SELECT 'Hello, World!';
```

#### List all one field or more fields of the table

```SQL
SELECT first_name FROM people;
SELECT first_name, last_name FROM people;
SELECT * FROM people;
```

### 1.2 Narrow down a query with `WHERE`

#### Note that `WHERE` and `FROM` clases cannot be exchanged

```SQL
SELECT first_name, last_name, shirt_or_hat 
FROM people WHERE state = 'CA';
```

### 1.3 Add more criteria to a statement

#### `AND`, `OR` & `IS`, `IS NOT` vs. `!=`

```SQL
SELECT first_name, last_name
FROM people 
WHERE state = 'CA' AND shirt_or_hat = 'shirt';
```

#### Combined logic operators by using `()`

```SQL
SELECT first_name, last_name
FROM people 
WHERE (state = 'CA' OR state = 'CO') AND shirt_or_hat = 'shirt';
```

### 1.4 Limit responses

#### `LIKE` operator, matching part of the text

```SQL
/* Give me all records with state starting with letter C */
SELECT first_name, last_name, state 
FROM people
WHERE state LIKE 'C%';

/* Give me all records with company name ending with LLC */
SELECT first_name, last_name, state, company
FROM people
WHERE COMPANY LIKE '%LLC';
```

#### Tell db how many we would like to see with the `LIMIT` keyword

```SQL
/* Returns the first 10 query records */
SELECT first_name, last_name, state, company
FROM people
WHERE COMPANY LIKE '%LLC'
LIMIT 10;
```

#### Skip records using `OFFSET` keyword

```SQL
/* Returns 5th-15th query records using OFFSET keyword */
SELECT first_name, last_name, state, company
FROM people
WHERE COMPANY LIKE '%LLC'
LIMIT 10 OFFSET 5;
```

### 1.5 Organize responses with `ORDER BY` along with `ASC` & `DESC`

```SQL
/* ASC is the default if not specified */
SELECT first_name, last_name 
FROM people
ORDER BY first_name;

/* Ordered using state, within every state ordered using last_name */
SELECT state, last_name, company
FROM people
ORDER BY state ASC, last_name ASC;
```

### 1.6 Find information about the data

#### `LENGTH` function, the length of the field

```SQL
SELECT first_name, LENGTH(first_name) FROM people;
```

#### `DISTINCT` function, ignore the following after the first record presents

```SQL
/* Get one record if there is only one name or 100 names */
SELECT DISTINCT(first_name) FROM people;
```

#### `COUNT` function, which measures number of rows

```SQL
SELECT COUNT(*) FROM people WHERE state = 'CA';
```
## 2. Ask for data across two or more tables

## 2.1 Ask for data across two or more tables

```SQL
/* Join 'people' table and 'states' table, we can further treat the two tables as one */
SELECT *
FROM people
JOIN states
```

```SQL
/* This is a overly reduced query, which is correct yet a VERY BAD example */
SELECT first_name, state, division
FROM people
JOIN states
ON state=state_abbrev
WHERE people.first_name LIKE 'J%' AND states.region = 'South';

/* Be more specific and also maintain a good practice */
SELECT people.first_name, people.state, states.division
FROM people
JOIN states
ON people.state=states.state_abbrev
WHERE people.first_name LIKE 'J%' AND states.region = 'South';
```

```SQL
SELECT *
FROM people
JOIN states
ON people.state=states.state_abbrev;
```
## 2.2 Understand JOIN types 

```sql
/* This gives us 1003 records rather than 1000, let's figure out why */
SELECT people.first_name, people.state, states.division
FROM states
LEFT JOIN people
ON people.state=states.state_abbrev;

/* Try print out corresponding fields */
/* They are supposed to be the same but 3 states are missing in people table, interesting */
SELECT DISTINCT(people.state), states.state_abbrev
FROM states
LEFT JOIN people
ON people.state=states.state_abbrev
ORDER BY people.state;
```

## 2.3 Combine results using `GROUP BY` keywords

```sql
SELECT last_name, COUNT(last_name)
FROM people
GROUP BY last_name;
```
Similar to `ORDER BY`, `GROUP BY` can also have multiple group criteria

```sql
SELECT state, quiz_points, COUNT(quiz_points)
FROM people
GROUP BY state, quiz_points;
```

## 3. Data Types, Math, and Helpful Functions

### 3.1 Data types in SQL

* Not all data types are supported in every implementation of SQL, so be sure to check documentation for the setup.
* The **binary** fields; store ones and zeros that might be in fixed or variable way.
* The **date and time** types indicate that the data in a field should be treated as a time value. 
* The **number** types represent different kinds of numeric values, including integers of different lengths, floating points of various lengths, and precisions, and so on. 
* The **text** types represent different lengths of characters treated as text rather than as numbers or binary data.
* **Boolean** types represetn true or false.
* **NULL**, null is not zero and null is not no.

So to store a person's name, we would use a text to type with a variable length, usually VARCHAR, or VARCHAR, depending on how you like to pronounce it, for variable character length. To store the number of points that someone earned on a quiz, we'd probably use an integer type, because we aren't concerned about decimal points there. To store calendar date, we'd use a date type. And to store a true false value, we might us a binary.

### 3.2 Math in SQL
* Most basic, use a `SELECT` statement
* Basic arithmetic operators, `+`, `-`, `*`, `/` and '%'
* Numbers are treated as integer otherwise specified

```sql
SELECT 4 + 2;  /* 6 */
SELECT 1 / 3;  /* 0 */
SELECT 1 / 3.0;  /* 0.3333; the take-away is don't reply to SQL math */
```

#### Logic expressions:

```sql
SELECT 3 > 2;  /* 1, which means TRUE */
SELECT 2 > 3;  /* 0, which means FALSE */
SELECT 3 = 3  /* 1, which is true */
SELECT 3 != 5  /* 1, which is true */
```
#### We can use the logic expressions in database query:

```sql
SELECT first_name, quiz_points 
FROM people
WHERE quiz_points > 70;
```

#### We can also use some handy functions: `MAX`, `MIN` and `SUM`.

```sql
SELECT MAX(quiz_points), MIN(quiz_points), SUM(quiz_points)
FROM people
WHERE quiz_points >= 70;
```

### 3.3 Compound Select

```sql
/* MAX has to work with SELECT */
SELECT first_name, last_name, quiz_points
FROM people

/* 'WHERE quiz_points = MAX(quiz_points)' is wrong */
WHERE quiz_points = (SELECT MAX(quiz_points) FROM people);
```

#### Use the sub-query result:

```sql
SELECT * FROM people
WHERE state = (SELECT state_abbrev FROM states WHERE state_name = 'Minnesota');
```

### 3.4 Transform data

#### Modify string type data using `LOWER`, `UPPER`, `SUBSTR` and `REPLACE`.

```sql
/* Print in lower/upper cased equivalent */
SELECT LOWER(first_name), UPPER(last_name)
FROM people;

/* Return part of the string */
SELECT LOWER(first_name), SUBSTR(first_name, 1, 2)
FROM people;

/* Replace part of the string, which is case sensitive */
SELECT LOWER(first_name), REPLACE(first_name, 'a', '_')
FROM people;
```
#### Use `CAST` to tell database to interpret one datat type as another. e.g. `CAST(quiz_points AS CHAR)`

```sql
/* Ordered as number: 10, 20, 30 ... 100 */
SELECT quiz_points FROM people ORDER BY quiz_points;

/* Ordered as characters: 10, 100, 20, 30... */
SELECT quiz_points FROM people ORDER BY CAST(quiz_points AS CHAR);

/* Treat quiz_points as number, the max is 100 */
SELECT MAX(quiz_points) FROM people;

/* Treat quiz_points as an ascii character array, the max is 90 */
SELECT MAX(CAST(quiz_points AS CHAR)) FROM people;
```

### 3.5 Use aliaes to shorten field names

#### Print a more reader-friendly table

```sql
SELECT first_name, UPPER(last_name) AS surname
FROM people;
```

## 4. Add or Modify Data

### 4.1 Add data to a table

#### Format

INSERT INTO _tablename_ (_filed1, field2_)
VALUES (_value1, value2_);

```sql
INSERT INTO people (first_name) VALUES ('Bob');

/* Check it out, Bob shows up but no relevant data for him */
SELECT * FROM people 
WHERE first_name = 'Bob';
```

#### A compelete single insertion example

```sql
INSERT INTO people (first_name, last_name, state, city, shirt_or_hat) 
VALUES('Mary', 'Hanmilton', 'OR', 'Portland', 'hat');

SELECT * FROM people;
```
#### Insert more than one records in one statement

```sql
INSERT INTO people (first_name, last_name) 
VALUES('George', 'White'), ('John', 'Smith'), ('Hanmei', 'Tang');

SELECT * FROM people;
```

But it is not a good practice to insert a record with only one or two fields since any change made for a database is **permanent**.

### 4.2 Modify data in a table

#### Format

UPDATE _tablename_ 
SET _filed1_ = _value1_, _filed2_ = _value2_
WHERE _condition_;

```sql
UPDATE people SET first_name = 'Martha'
WHERE first_name = 'George' AND last_name = 'White';

/* Now we have a 'Martha White' */
SELECT * FROM people;
```

### 4.3 Remove data from a table


#### Format

DELETE FROM _tablename_ 
WHERE _condition_;

#### Let's delete 'Martha White'

```sql
DELETE FROM people 
WHERE first_name = 'Martha' AND last_name = 'White';

/* This 'Martha White' is gone */
SELECT * FROM people 
WHERE first_name = 'Martha' AND last_name = 'White';
```

#### Remove invalid data

```sql
DELETE FROM people 
WHERE id_number IS NULL;
```

## 5. Conclusion

### 5.1 Overcome common SQL mistakes
* Typos and syntax erors - read the error, break down statement.
* Put text values in '**single quotes**'.
* Put field names with spaces 'inside backticks'.
* Keep a development journal in **plain text**.
* Copy/paste to/from plain text rather than formatted text.
* (Smart quotes)[http://smartquotesforsmartpeople.com/] can cause problems.
* Share statements as plain-text.sql attachments rather than in chat/email.
* To find null values, use `IS NULL` or `IS NOT NULL` instead of `0`, `no` or `false`.
* You should test your matching conditions before using them for a destructive action (`UPDATE`/`DELETE`).
* Most software will run all of the statements in a window at once. You can select, or other wise isolate, the one(s) you want to run.

### 5.2 Next steps

#### Create and Administer Databases
* Microsoft SQL Server 2016 Essential Training
* MySQL Essential Training
* Learning Oracle Database 12c

#### More Advanced SQL
* SQL Essential Training
* SQL: Data Reporting and Analysis
* SQL Tips, Tricks, & Techniques

#### Build an Application with a Database
* PHP with MySQL Essential Training
* Java: Database Access with Hibernate
