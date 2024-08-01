# Setting Up PgAdmin Locally

- Download 64-bit installer for [PgAdmin](https://www.pgadmin.org/download/pgadmin-4-windows/) (current latest version is v8.9 as of 22nd July 2024)
- Follow the installation instructions

## Creating New Server

- Open the installed PgAdmin 4
- There will be default “PostgreSQL 16” server installed with the following credentials:
  - Username: postgresql
  - Password: superuser password that’s set when installing PostgreSQL server earlier
- [Optional] Create new server
  - Use either “Add New Server” under “Quick Links” or right click on “Servers” dropdown at the left menu > Register > Server…
  - Provide the following configs:
    - Name: Use any name for the server (e.g. CARES)
    - Check “Connect Now?” to connect to the server immediately after saving the configs
    - Host name/address: localhost
    - Username: Use default postgresql for now
    - Password: Use the superuser password that is set when installing postgreSQL server earlier
    - Click “Save”
  - Verify the new server can be created and connected successfully.

## Create New Server Login

- This step is optional, we could use postgresql as a superuser that is created during PostgreSQL server installation.
- After connecting to any server, right click on “Login/Group Roles” > “Create” > “Login/Group Role…”
- Provide the following:
  - Name: Any login name (e.g. sa)
  - Password: Any password (e.g. atom405071#)
  - Check “Can login?” and “Create database?” options
- Right click on any server with the created credentials, click “Properties…”
  - Update the username to match with the newly created username
- Verify the server can be logged in with the newly created credentials

## Create New Database

- After connecting to any server, right click on “Databases” > “Create” > “Database…”
- Provide the following:
  - Database: Any database name (e.g. C4WMicrosite)
  - Make sure the owner matches the username that’s used to login to the server.
- Verify the database is created successfully
