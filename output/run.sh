#!/bin/bash
TT_PATH=t4
CONNECTION_STRING="Server=db;Database=samples;User=sa;Password=pass!word@123;TrustServerCertificate=True"
NAMESPACE=MyApp.EfCore
CLASS_NAME=MyDbContext
DLL_FOLDER="/root/.nuget/packages/system.data.sqlclient/4.9.0/runtimes/unix/lib/net8.0"

$TT_PATH -P=$DLL_FOLDER -a=!!ConnectionString!"$CONNECTION_STRING" -a=!!Namespace!"$NAMESPACE" -a=!!ClassName!"$CLASS_NAME" -out "./$CLASS_NAME.TableInputTypes.part.cs" "./../src/$CLASS_NAME.TableInputTypes.part.t4"

$TT_PATH -P=$DLL_FOLDER -a=!!ConnectionString!"$CONNECTION_STRING" -a=!!Namespace!"$NAMESPACE" -a=!!ClassName!"$CLASS_NAME" -out "./$CLASS_NAME.TableOutputTypes.part.cs" "./../src/$CLASS_NAME.TableOutputTypes.part.t4"

$TT_PATH -P=$DLL_FOLDER -a=!!ConnectionString!"$CONNECTION_STRING" -a=!!Namespace!"$NAMESPACE" -a=!!ClassName!"$CLASS_NAME" -out "./$CLASS_NAME.TableFunctions.part.cs" "./../src/$CLASS_NAME.TableFunctions.part.t4"

$TT_PATH -P=$DLL_FOLDER -a=!!ConnectionString!"$CONNECTION_STRING" -a=!!Namespace!"$NAMESPACE" -a=!!ClassName!"$CLASS_NAME" -out "./$CLASS_NAME.ScalarFunctions.part.cs" "./../src/$CLASS_NAME.ScalarFunctions.part.t4"
