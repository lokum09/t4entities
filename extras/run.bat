set TT_PATH=C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\TextTransform.exe
set CONNECTION_STRING=Server=.;Database=BikeStores;User=sa;Password=sa;MultipleActiveResultSets=true;TrustServerCertificate=True
set NAMESPACE=MyApp.EfCore
set CLASS_NAME=MyDbContext
set CONTEXT_FOLDER=%~dp0..\myapp\Libraries\myapp.Data\Context

"%TT_PATH%" -a !!ConnectionString!"%CONNECTION_STRING%" -a !!Namespace!"%NAMESPACE%" -a !!ClassName!"%CLASS_NAME%" -out "%CONTEXT_FOLDER%\%CLASS_NAME%.TableInputTypes.part.cs" "%CONTEXT_FOLDER%\%CLASS_NAME%.TableInputTypes.part.t4"

"%TT_PATH%" -a !!ConnectionString!"%CONNECTION_STRING%" -a !!Namespace!"%NAMESPACE%" -a !!ClassName!"%CLASS_NAME%" -out "%CONTEXT_FOLDER%\%CLASS_NAME%.TableOutputTypes.part.cs" "%CONTEXT_FOLDER%\%CLASS_NAME%.TableOutputTypes.part.t4"

"%TT_PATH%" -a !!ConnectionString!"%CONNECTION_STRING%" -a !!Namespace!"%NAMESPACE%" -a !!ClassName!"%CLASS_NAME%" -out "%CONTEXT_FOLDER%\%CLASS_NAME%.TableFunctions.part.cs" "%CONTEXT_FOLDER%\%CLASS_NAME%.TableFunctions.part.t4"

"%TT_PATH%" -a !!ConnectionString!"%CONNECTION_STRING%" -a !!Namespace!"%NAMESPACE%" -a !!ClassName!"%CLASS_NAME%" -out "%CONTEXT_FOLDER%\%CLASS_NAME%.ScalarFunctions.part.cs" "%CONTEXT_FOLDER%\%CLASS_NAME%.ScalarFunctions.part.t4"


:: https://learn.microsoft.com/en-us/ef/core/querying/user-defined-function-mapping
:: https://www.allhandsontech.com/data-professional/entityframework/entity-framework-core-advanced-mapping/