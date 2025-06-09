set TT_PATH=C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\TextTransform.exe
set CONNECTION_STRING=Server=.;Database=BikeStores;User=sa;Password=sa;MultipleActiveResultSets=true;TrustServerCertificate=True
set NAMESPACE=MyApp.EfCore
set CLASS_NAME=MyDbContext

"%TT_PATH%" -a !!ConnectionString!"%CONNECTION_STRING%" -a !!Namespace!"%NAMESPACE%" -a !!ClassName!"%CLASS_NAME%" -out "%~dp0.\%CLASS_NAME%.TableInputTypes.part.cs" "%~dp0..\src\%CLASS_NAME%.TableInputTypes.part.t4"

"%TT_PATH%" -a !!ConnectionString!"%CONNECTION_STRING%" -a !!Namespace!"%NAMESPACE%" -a !!ClassName!"%CLASS_NAME%" -out "%~dp0.\%CLASS_NAME%.TableOutputTypes.part.cs" "%~dp0..\src\%CLASS_NAME%.TableOutputTypes.part.t4"

"%TT_PATH%" -a !!ConnectionString!"%CONNECTION_STRING%" -a !!Namespace!"%NAMESPACE%" -a !!ClassName!"%CLASS_NAME%" -out "%~dp0.\%CLASS_NAME%.TableFunctions.part.cs" "%~dp0..\src\%CLASS_NAME%.TableFunctions.part.t4"

"%TT_PATH%" -a !!ConnectionString!"%CONNECTION_STRING%" -a !!Namespace!"%NAMESPACE%" -a !!ClassName!"%CLASS_NAME%" -out "%~dp0.\%CLASS_NAME%.ScalarFunctions.part.cs" "%~dp0..\src\%CLASS_NAME%.ScalarFunctions.part.t4"


:: https://learn.microsoft.com/en-us/ef/core/querying/user-defined-function-mapping
:: https://www.allhandsontech.com/data-professional/entityframework/entity-framework-core-advanced-mapping/