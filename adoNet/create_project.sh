#!/bin/bash
ProjectID=$1;
mkdir lesson_$ProjectID; 
cd lesson_$ProjectID;
mkdir db;

dotnet new console;
dotnet add package Microsoft.Data.SqlClient --version 5.0.1;

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=p@ssWo5d" -p 1433:1433 --name sql1 --hostname sql$ProjectID -v /home/asirush/Documents/learning/itstep/adoNet/lesson_$ProjectID/db/data:/var/opt/mssql/data -v /home/asirush/Documents/learning/itstep/adoNet/lesson_$ProjectID/db/log:/var/opt/mssql/log -v /home/asirush/Documents/learning/itstep/adoNet/lesson_$ProjectID/db/secrets:/var/opt/mssql/secrets -d mcr.microsoft.com/mssql/server:2022-latest


