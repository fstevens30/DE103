# Database Creation Basics

Some basic scripting examples to create databases using `SQL` in `SQL Server Management Studio`. Please note that not all of these commands are supported by all database engines.

## Create a database

```sql
CREATE DATABASE DatabaseName;
```

## Creating a table
    
```sql
CREATE TABLE TableName (
    ColumnName1 DataType,
    ColumnName2 DataType,
    ColumnName3 DataType,
    ...
);
```

## Creating a table with a primary key

There are two main ways to create a primary key. The first is to create a column with the `IDENTITY` property. This will automatically create a primary key for you, which is good for when you want the PK to be an auto generated `int` value. The second way is to create a column with the `PRIMARY KEY` property. This is good for when you want the PK to be a `varchar` or `char` value.

- This example shows the `PRIMARY KEY` declared with the column.

```sql
CREATE TABLE TableName (
    ColumnName1 DataType PRIMARY KEY,
    ColumnName2 DataType,
    ColumnName3 DataType,
);
```

- And this example shows the `PRIMARY KEY` declared after the column. This method is best for composite keys and when you want to create a primary key on a column that already exists.

```sql
CREATE TABLE TableName (
    ColumnName1 DataType,
    ColumnName2 DataType,
    ColumnName3 DataType,
    PRIMARY KEY (ColumnName1)
);
```

## Data Types

It is crucial to select an approprait data type for each column. The data type will determine the size of the column, the range of values that can be stored, and the operations that can be performed on the column. The following table shows the most common data types and their properties.

- NOTE: I will update this table with more data types as I learn them.

| Data Type | Description | Size | Range | Operations |
| --- | --- | --- | --- | --- |
| `int` | Integer | 4 bytes | -2,147,483,648 to 2,147,483,647 | Arithmetic, Comparison, Logical |
| `bigint` | Large Integer | 8 bytes | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 | Arithmetic, Comparison, Logical |
| `smallint` | Small Integer | 2 bytes | -32,768 to 32,767 | Arithmetic, Comparison, Logical |
| `tinyint` | Tiny Integer | 1 byte | 0 to 255 | Arithmetic, Comparison, Logical |
| `bit` | Boolean | 1 bit | 0 or 1 | Arithmetic, Comparison, Logical |
| `char` | Fixed Length String | 0-8,000 characters | | Arithmetic, Comparison, Logical |
| `varchar` | Variable Length String | 0-8,000 characters | | Arithmetic, Comparison, Logical |
