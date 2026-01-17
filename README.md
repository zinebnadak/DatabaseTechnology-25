INTRODUCTION TO SQL (Structured Query Language) and MQL (MongoDB Query Language)

Because I’m working with both Python and SQL, I need to run this script as a SQL query rather than just writing it.
I’m using PyCharm Community Edition, which doesn’t include built-in database tools — so when I write a .sql file, it’s simply a text file until it’s executed by a real database engine.
To actually run the SQL, I use an external tool such as MySQL, DBeaver, or SQLite’s command-line interface.
Remember that .sql files are just plain text scripts — they can be stored, shared, and version-controlled in GitHub like any other code file.

DrawSQL works with MySQL, and it’s mainly for visual design and generating SQL scripts, not for running queries directly.
MySQL Workbench is just a GUI tool. 
so I´ll need the MySQL server/database engine installed to actually run queries.

Stage	                Tool	                    Description
Design schema	        PyCharm	                    Write .sql
Execute schema	        DBeaver + MySQL	            Run SQL
Inspect results	        DBeaver	                    Verify
Commit scripts	        GitHub	                    Version control
Automate setup	        Python + MySQL connector    Optional





Learning Outcomes describe the knowledge, skills, and abilities you are expected to have achieved upon completing the course:

Can explain the fundamental principles of how databases function.
Can use a database language to create, modify, and retrieve data from a relational database.
Can use a database language to create, modify, and retrieve data from a document database.
Can explain the differences between relational and document databases.


You’ve by now covered all modules:

Relational Algebra: Symbols & Logic
Standard SQL: Joins, Queries, Aliases
Advanced SQL: EXISTS, Outer Joins, Views
Database Programming: Stored Procedures, Triggers, DDL
Transactions: ACID, COMMIT, ROLLBACK
NoSQL Foundations: JSON, Document Model
MQL: find(), update(), aggregation pipelines
Tooling: Compass, Atlas, APIs
