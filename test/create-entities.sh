TT_PATH=t4
CONNECTION_STRING="Server=db;Database=samples;User=sa;Password=pass!word@123;TrustServerCertificate=True"
NAMESPACE=BikesStore.Database.Tests
CLASS_NAME=MyDbContext
INPUT_FOLDER="./../src"
OUTPUT_FOLDER="./BikesStore.Database.Tests"
DLL_FOLDER="/root/.nuget/packages/system.data.sqlclient/4.9.0/runtimes/unix/lib/net8.0"

#dotnet ef dbcontext scaffold "$CONNECTION_STRING" Microsoft.EntityFrameworkCore.SqlServer --force --no-onconfiguring --prefix-output --data-annotations --context MyDbContext --context-dir . -o Entities --no-build

$TT_PATH -P=$DLL_FOLDER -a=!!ConnectionString!"$CONNECTION_STRING" -a=!!Namespace!"$NAMESPACE" -a=!!ClassName!"$CLASS_NAME" -out "$OUTPUT_FOLDER/$CLASS_NAME.TableInputTypes.part.cs" "$INPUT_FOLDER/$CLASS_NAME.TableInputTypes.part.t4"

$TT_PATH -P=$DLL_FOLDER -a=!!ConnectionString!"$CONNECTION_STRING" -a=!!Namespace!"$NAMESPACE" -a=!!ClassName!"$CLASS_NAME" -out "$OUTPUT_FOLDER/$CLASS_NAME.TableOutputTypes.part.cs" "$INPUT_FOLDER/$CLASS_NAME.TableOutputTypes.part.t4"

$TT_PATH -P=$DLL_FOLDER -a=!!ConnectionString!"$CONNECTION_STRING" -a=!!Namespace!"$NAMESPACE" -a=!!ClassName!"$CLASS_NAME" -out "$OUTPUT_FOLDER/$CLASS_NAME.TableFunctions.part.cs" "$INPUT_FOLDER/$CLASS_NAME.TableFunctions.part.t4"

$TT_PATH -P=$DLL_FOLDER -a=!!ConnectionString!"$CONNECTION_STRING" -a=!!Namespace!"$NAMESPACE" -a=!!ClassName!"$CLASS_NAME" -out "$OUTPUT_FOLDER/$CLASS_NAME.ScalarFunctions.part.cs" "$INPUT_FOLDER/$CLASS_NAME.ScalarFunctions.part.t4"
