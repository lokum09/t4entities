<#= Types() #>
----------------------------------------
<#= Objects() #>


    private string Types()
    {
        return GetDbTypes()
            .Aggregate(
                string.Empty,
                (content, next) => $"{content}\n{next.TypeSchema}-{next.TypeName}-{next.BaseType}-{next.TypeCategory}"
            );
    }

    private string Objects()
    {
        return GetDbObjects()
            .Aggregate(
                string.Empty,
                (content, next) => {
                    var sb = new StringBuilder($"{content}\n{next.SchemaName}-{next.FunctionName}-{next.ReturnType}");
                    foreach(var arg in next.Arguments)
                    {
                        sb.Append($"\n{Tab(1)}- {arg.ArgumentName} - {arg.DotNetType} - {arg.SqlType} - {arg.SqlBaseType} - {arg.HasUserType} - {arg.HasAllowedUserType} - {arg.TypeCategory}");
                    }
                    return sb.ToString();
                }
            );
    }






    					/*
					var regex = new Regex(@"CREATE\s+FUNCTION\s*[\w\d\[\]\.]+\s*\(([\w\W]+?)\)");
					Match m = regex.Match(reader["definition"].ToString());
					if (m.Success)
					{
						var arguments = new List<DbArgument>();

						var args = m.Groups[1].ToString().Split(',');
						foreach(var arg in args)
						{
							var (field, type) = ExtractFieldAndType(arg);

							var (typeSchema, typeName) = ExtractSchemaAndTable(type);
							var dbType = dbTypes.SingleOrDefault(x => x.TypeSchema == typeSchema && x.TypeName == typeName);
							var typeCategory = dbType.TypeCategory;
							
							bool hasUserType = typeCategory != TypeCategoryEnum.Embedded; 

							string targetType = typeCategory == TypeCategoryEnum.Scalar
								? ConvertSqlToDotNetType(dbType.BaseType).Name
								: hasUserType
									? $"{ClassName}.{TableInputTypes}.{typeSchema}.{typeName}"
									: ConvertSqlToDotNetType(type).Name;
							
							arguments.Add(new DbArgument {
								ArgumentName = field,
								DotNetType = targetType,
								SqlType = type,
								SqlBaseType = dbType.BaseType == null ? null : FixSqlType(dbType.BaseType),
								HasUserType = hasUserType,
								TypeCategory = typeCategory
							});                
						}

						dbObjects.Add(new DbObject {
							SchemaName = reader["schema_name"].ToString(),
							FunctionName = reader["function_name"].ToString(),
							Arguments = arguments
						});
						
					}
					*/