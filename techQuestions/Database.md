# Database

#### Keywords: Database, ER Model, Relational Model

## Definitions
* **Database (DB)**: database is a collection of interrelated data which helps in efficient retrieval, insertion and deletion of data from it.
* **Database Management System (DBMS)**: Software used to manage database
* **Structured Query Language (SQL)**: the language used to communicate with a relational database. SQL statements are used to perform tasks such as update data on a database, or retrieve data from a database.
  * Some commonly known DBMS uses *SQL*: **Oracle**, **Sybase**, **Microsoft SQL Server**, **Access**, **Ingres**
  * Standard SQL commands CRUD: `SELECT`, `INSERT`, `UPDATE`, `DELETE`, `CREATE`, `DROP` and [more](https://github.com/HanmeiTang/Notes/blob/main/Useful_cmd_SQL.md).


## Common questions
#### Data vs. metadata 数据和元数据的区别？
metadata = schema, which is the description of data. 

#### metadata and data should be stored together?
Not really, especially for data like video or images. A better solution is to store data in file system and metadata in database.


## Entity-relationship Model (E-R Model)
ER Model is used to model the logical view of the system from a data perspective. It contains

* Entity

* Attributes: attributes are properties that define the netity type
  * Key attributes (unique)
  * Composite attributes
    - example: `address` = `street` + `city` + `state` + `zip` 
    - may consider creating a new table
  * Multivalued attributes
    - phone number: [xxx-xxx-xxx, xxx-xxx-xxx]
    - may contain more than one values
  * Derived attributes
    - age, can be derived from dob
    - attribute that can be derived from other attribute
    
* Relationship
  * Degree of a relationship set
    * unary relationship: A child has a monther
    * binary relatinship
    * n-ary relationship
  * Mapping Cardinality 映射基数 （number of unique values in a column）
    * 1 to 1
    * 1 to N: a student enrolls A class and B class...
    * M to N: students & classes
  * Participation constrians
    * total participation: a person must have an id
    * partial participation: a person may have a passport

## relational model
Relational model represents how data is stored in relational databases, in form of relations or tables.

* **Attribute**: properties define a relation
* **Relation Schema**: represents the name of the relation with its attributes, e.g. STUDENT (SID, NAME, ADDRESS, AGE) is a schema for STUDENT
* **Tuple** (a row)
* **Relation instance**: the set of tuples of a relation at a particular instance of time is called a relation instance....??
* **Degree**: the number of attributes in the relatino is the degree of relation. e.g. STUDENT (SID, NAME, ADDRESS, AGE) has a degree of 4
* **Cardinality**: the number of tuples in a relation is known as cardinality. A student relation (table) with 5 entries has a cardinality of 5.
* **Column**: a set of values for a particular attribute. e.g. the column `AGE`

#### Constraints in relational model
* Domain constraints: e.g. AGE > 0
* Referential integrity: when one attribute of a relation can only take values from other attributes of the same relation or any other relation, it is called referential integrity.
  * Primary key must be unique and not NULL
  * foreign key: fields defined in a second table, but it refers to the primary key or unique key in the first table
  
## Mapping from ER model to Relational Model
1. Turn every entity type into a relation with the same set of attributes 为entity建表
2. Replace a relationship by a relation whose attributes are the keys for the connected entity sets 为关系建表


