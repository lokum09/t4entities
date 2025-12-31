dotnet build -t:Rebuild -p:Configuration=Debug ./BikesStore.Database/BikesStore.Database.sqlproj

TargetConnectionString="Server=db;Database=samples;User=sa;Password=pass!word@123;TrustServerCertificate=True"

sqlpackage /Action:publish /p:BlockOnPossibleDataLoss=false /p:TreatVerificationErrorsAsWarnings=true /p:IgnoreExtendedProperties=True /p:ScriptDatabaseOptions=false /SourceFile:"./BikesStore.Database/bin/Debug/BikesStore.Database.dacpac" /TargetConnectionString:$TargetConnectionString