We will access the suggestions to prepare for MSSQL to PostgreSQL migration from the following JIRA tickets: [WM-1112](https://tetsuyuhealthcare.atlassian.net/browse/WM-1112) and [WM-1113](https://tetsuyuhealthcare.atlassian.net/browse/WM-1113)

# Using AWS SCT

- Can be downloaded from [here](https://docs.aws.amazon.com/SchemaConversionTool/latest/userguide/CHAP_Installing.html)
- Schema conversion does not have option to preserve case sensitivity of C4WMicrosite tables and column names.
- Data migration requires S3 to store the data file, and seems like only can migrate to DB on AWS.

# Using PgLoader

- Can be downloaded from [here](https://pgloader.readthedocs.io/en/latest/install.html)
- No Windows support

As such we will manually prepare scripts to perform C4WMicrosite DB Migration

# PostgreSQL Tables Setup

- Make sure valid DB is set up and is able to connect either using postgresql or custom user.
- Run all the sql scripts in order in [c4w-postgresql-tables-setup folder](/c4w-postgresql-tables-setup/)
- Verify all tables are created in PostgreSQL DB (Currently we are expecting 36 tables to be created in total)

# Exporting Data from MSSQL Tables

- Run [mssql-bcp.ps1](/c4w-mssql-export/mssql-bcp.ps1) to generate csv files containing data from all C4WMicrosite tables in MSSQL

# Importing Data to PostgreSQL Tables

- Currently don't have working script to perform auto import yet so we have to manually import to each of the table in PostgreSQL for now.
- From PgAdmin:
    - Right click on any table > "Import/Export Data..."
    - In the popup:
        - "General" tab:
            - Select Import option
            - Filename: Generated csv file with matching table name
            - Format: csv
        - "Options" tab
            - Delimiter: [tab]
        - "Columns" tab
            - Make sure all columns are selected for import
        - Click "OK"
    - Verify the import process is completed and the table contains the same data as in MSSQL table.
    - Repeat these processes for all other tables.

# Stored Procedures and Functions

- Since C4WMicrosite Stored Procedures and Functions are quite long, we will try to rewrite the logic in C4WMicrosite .NET App instead.