# C4W PostgreSQL Tables Setup SQL Scripts

- Each script do the following:
    - Drop any existing audit tables (if they should be audited)
    - Create audit tables (if they should be audited)
    - Drop any existing tables
    - Create tables
    - Create trigger functions to insert into audit tables (if they should be audited)
    - Create trigger for the created tables using the created trigger functions (if they should be audited)

- Generated tables have:
    - Case-sensitive table and column names
    - PK, FK and default values defined
    - Triggers and respective trigger functions if they should be audited

- Stored procedures and functions are not generated.