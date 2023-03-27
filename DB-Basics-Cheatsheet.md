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

