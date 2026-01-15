INTRODUCTION TO SQL (Structured Query Language)

Because I’m working with both Python and SQL, I need to run this script as a SQL query rather than just writing it.
I’m using PyCharm Community Edition, which doesn’t include built-in database tools — so when I write a .sql file, it’s simply a text file until it’s executed by a real database engine.
To actually run the SQL, I use an external tool such as MySQL, DBeaver, or SQLite’s command-line interface.
Remember that .sql files are just plain text scripts — they can be stored, shared, and version-controlled in GitHub like any other code file.

DrawSQL works with MySQL, and it’s mainly for visual design and generating SQL scripts, not for running queries directly.
MySQL Workbench is just a GUI tool. 
so I´ll need the MySQL server/database engine installed to actually run queries.

Stage	           Tool	                Description
Design schema	  PyCharm	                Write .sql
Execute schema	DBeaver + MySQL	        Run SQL
Inspect results	DBeaver	                Verify
Commit scripts	GitHub	                Version control
Automate setup	Python + MySQL connector Optional

