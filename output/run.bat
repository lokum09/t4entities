set TT_PATH=t4
set CONNECTION_STRING=Server=.;Database=BikeStores;User=sa;Password=sa;TrustServerCertificate=True
set NAMESPACE=MyApp.EfCore
set CLASS_NAME=MyDbContext
set INPUT_FOLDER="%~dp0/../src"
set OUTPUT_FOLDER="%~dp0"

"%TT_PATH%" -a !!ConnectionString!"%CONNECTION_STRING%" -a !!Namespace!"%NAMESPACE%" -a !!ClassName!"%CLASS_NAME%" -out "%OUTPUT_FOLDER%\%CLASS_NAME%.TableInputTypes.part.cs" "%INPUT_FOLDER%\%CLASS_NAME%.TableInputTypes.part.t4"

"%TT_PATH%" -a !!ConnectionString!"%CONNECTION_STRING%" -a !!Namespace!"%NAMESPACE%" -a !!ClassName!"%CLASS_NAME%" -out "%OUTPUT_FOLDER%\%CLASS_NAME%.TableOutputTypes.part.cs" "%INPUT_FOLDER%\%CLASS_NAME%.TableOutputTypes.part.t4"

"%TT_PATH%" -a !!ConnectionString!"%CONNECTION_STRING%" -a !!Namespace!"%NAMESPACE%" -a !!ClassName!"%CLASS_NAME%" -out "%OUTPUT_FOLDER%\%CLASS_NAME%.TableFunctions.part.cs" "%INPUT_FOLDER%\%CLASS_NAME%.TableFunctions.part.t4"

"%TT_PATH%" -a !!ConnectionString!"%CONNECTION_STRING%" -a !!Namespace!"%NAMESPACE%" -a !!ClassName!"%CLASS_NAME%" -out "%OUTPUT_FOLDER%\%CLASS_NAME%.ScalarFunctions.part.cs" "%INPUT_FOLDER%\%CLASS_NAME%.ScalarFunctions.part.t4"


:: https://learn.microsoft.com/en-us/ef/core/querying/user-defined-function-mapping
:: https://www.allhandsontech.com/data-professional/entityframework/entity-framework-core-advanced-mapping/