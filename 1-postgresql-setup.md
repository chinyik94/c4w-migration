# Setting Up PostgreSQL Server Locally
- Download Windows x86-64 installer for [PostgreSQL Server](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) (current latest version is v16.3 as of 22nd July 2024)
- Follow the installation instructions
  - Uncheck “Stack Builder” options when prompted to select components to be installed.
  ![alt text](/images/uncheck-stack-builder.png)
  - Provide any password that you can remember when prompted for db superuser
  - Use the default port (5432 for postgresql server)
- Once the installation is complete, verify postgresql server service is running in your local machine. Find “Services” from Windows Search, then look for “postgresql-x64-16 or similar name, and make sure this service is running
![alt text](/images/verify-psql-server.png)