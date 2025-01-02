-- Databricks notebook source
-- MAGIC %md
-- MAGIC ### This is an example
-- MAGIC This notebook creates a dataframe with some sample data that can be used for a quick visualization.

-- COMMAND ----------

-- MAGIC %python
-- MAGIC data = [[1, "Elia"], [2, "Teo"], [3, "Fang"]]
-- MAGIC sdf = spark.createDataFrame(data, schema="id LONG, name STRING")
-- MAGIC display(sdf)

-- COMMAND ----------

-- Databricks notebook source


CREATE TABLE students
  (id INT, name STRING, value DOUBLE);
  
INSERT INTO students VALUES (1, "Yve", 1.0);
INSERT INTO students VALUES (2, "Omar", 2.5);
INSERT INTO students VALUES (3, "Elia", 3.3);

INSERT INTO students
VALUES 
  (4, "Ted", 4.7),
  (5, "Tiffany", 5.5),
  (6, "Vini", 6.3);
  
UPDATE students 
SET value = value + 1
WHERE name LIKE "T%";

DELETE FROM students 
WHERE value > 6;

CREATE OR REPLACE TEMP VIEW updates(id, name, value, type) AS VALUES
  (2, "Omar", 15.2, "update"),
  (3, "", null, "delete"),
  (7, "Blue", 7.7, "insert"),
  (11, "Diya", 8.8, "update");
  
MERGE INTO students b
USING updates u
ON b.id=u.id
WHEN MATCHED AND u.type = "update"
  THEN UPDATE SET *
WHEN MATCHED AND u.type = "delete"
  THEN DELETE
WHEN NOT MATCHED AND u.type = "insert"
  THEN INSERT *;

-- COMMAND ----------


