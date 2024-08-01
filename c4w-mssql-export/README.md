# mssql-bcp.ps1 README

- Before running this script make sure to modify this script to update both `$server` and `$database` to match with your local setup:
    - $server => MSSQL server host name (e.g. localhost)
    - $database => MSSQL database name

# Additional Info

- Generates csv file of table data using [bcp utility](https://learn.microsoft.com/en-us/sql/tools/bcp-utility?view=sql-server-ver16&tabs=windows)
- Generated csv files have:
    - tab delimiter
    - UTF-8 Encoding
    - Uses Windows Authentication to connect to MSSQL DB
- This script does not generate csv files for audit tables, audit tables are expected to be inserted through triggers