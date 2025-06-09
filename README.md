# t4entities

## Overview

Set of T4 (Text Template Transformation Toolkit) scripts to generate an access layer to database objects like scalar and table-valued functions within a SQL Server database.
By leveraging these templates, developers can streamline the creation of boilerplate code, ensuring consistency and reducing manual coding efforts.
It creates strongly-typed wrappers for SQL Server database objects including:

- Scalar functions
- Table-valued functions 
- User-defined table types
- Function result types

## Features

- Schema-based organization
- Full type safety for inputs and outputs
- Entity Framework Core integration
- Automatic parameter handling
- Clean and maintainable generated code

## Requirements

- TextTransform (this tool is installed along with Visual Studio)
- Access to a SQL Server database
- Entity Framework Core in your project

## Example of usage:
```c#
string idsAsString = context.ScalarFunctions.dbo
    .GetIdsAsString(new TableInputTypes.dbo.IdList { 1, 2, 3 });

List<TableOutputTypes.dbo.GetBrandsByIds_Result> getBrandsByIds_Result = context.TableFunctions.dbo
	.GetBrandsByIds(new TableInputTypes.dbo.IdList { 1, 2 }).ToList();
```

## Getting Started

1. Copy the T4 template files to your project:

    - common.t4
    - MyDbContext.ScalarFunctions.part.t4
    - MyDbContext.TableFunctions.part.t4
    - MyDbContext.TableInputTypes.part.t4
    - MyDbContext.TableOutputTypes.part.t4

2. Create your own run.bat to generate cs files based on output\run.bat file. Configure the generation settings:

    ```bat
    set TT_PATH=<path to TextTransform.exe>
    set CONNECTION_STRING=<your connection string>
    set NAMESPACE=<target namespace>
    set CLASS_NAME=<context class name>
    ```

3. Executing the run.bat file will create these four cs files:

    - MyDbContext.ScalarFunctions.part.cs
    - MyDbContext.TableFunctions.part.cs
    - MyDbContext.TableInputTypes.part.cs
    - MyDbContext.TableOutputTypes.part.cs

4. Configure your DbContext class:
```c#
    public partial class MyDbContext : DbContext
    {
        ...

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder)
        {
            OnScalarFunctionsCreatingPartial(modelBuilder);
            OnTableFunctionsCreatingPartial(modelBuilder);
            ...
        }
    }
```
