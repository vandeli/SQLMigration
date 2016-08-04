using SQLMigrationInterface.Interface.SourceQuery;
using System;

namespace SQLMigrationConverter.SourceQuery
{
    public class MssQuery : ISourceQuery
    {
        public string GetUDTQuery()
        {
            var sql = @"
			SELECT st.NAME
				,bs.[name] AS data_type
				,st.max_length
				,st.precision
				,st.scale
				,st.is_nullable
			FROM sys.types st
			INNER JOIN sys.schemas ss ON st.[schema_id] = ss.[schema_id]
			INNER JOIN sys.types bs ON bs.[user_type_id] = st.[system_type_id]
			WHERE st.[is_user_defined] = 1 -- exclude system types
			ORDER BY st.[name]
				,ss.[name]
			";
            Console.WriteLine("MssQuery.GetUDTQuery : Done");
            return sql;
        }

        public string GetTableQuery()
        {
            var sql = @"
			SELECT a.TABLE_NAME
	            ,a.COLUMN_NAME
	            ,a.ORDINAL_POSITION
	            ,a.COLUMN_DEFAULT
	            ,a.IS_NULLABLE
	            ,a.DOMAIN_NAME
	            ,a.DATA_TYPE
	            ,a.CHARACTER_MAXIMUM_LENGTH
	            ,a.NUMERIC_PRECISION
	            ,a.NUMERIC_SCALE
            FROM INFORMATION_SCHEMA.columns a
            JOIN INFORMATION_SCHEMA.Tables b ON a.TABLE_NAME = b.TABLE_NAME
            WHERE TABLE_TYPE = 'BASE TABLE'
            ORDER BY table_name
	            ,ORDINAL_POSITION
			";
            Console.WriteLine("MssQuery.GetTableQuery : Done");
            return sql;
        }

        public string GetPKQuery()
        {
            var sql = @"
			SELECT CONSTRAINT_NAME AS PK_Name
	            ,TABLE_NAME
	            ,COLUMN_NAME
	            ,ORDINAL_POSITION
            FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE b
            JOIN (
	            SELECT NAME
	            FROM sysobjects a
	            WHERE xtype = 'pk'
		            AND parent_obj IN (
			            SELECT id
			            FROM sysobjects
			            WHERE xtype = 'U'
			            )
	            ) a ON a.NAME = b.CONSTRAINT_NAME
            ORDER BY table_name
	            ,ORDINAL_POSITION
			";
            Console.WriteLine("MssQuery.GetPKQuery : Done");
            return sql;          
        }

        public string GetIndexQuery()
        {
            var sql = @"
			   SELECT 
                     i.name as IndexName, 
                     o.name as TableName, 
                     ic.key_ordinal as ColumnOrder,
                     ic.is_included_column as IsIncluded, 
                     co.[name] as ColumnName
                FROM sys.indexes i 
                    join sys.objects o on i.object_id = o.object_id
                    join sys.index_columns ic on ic.object_id = i.object_id 
                    and ic.index_id = i.index_id
                    join sys.columns co on co.object_id = i.object_id 
                    and co.column_id = ic.column_id
            --    WHERE i.[type] = 2 
            --    and i.is_unique = 0 
            --    and i.is_primary_key = 0
                  WHERE o.[type] = 'U'
                order by o.[name], i.[name], ic.is_included_column, ic.key_ordinal
			";
            Console.WriteLine("MssQuery.GetIndexQuery : Done");
            return sql;
        }

        public string GetSPQuery()
        {
            var sql = @"
			   select specific_name,OBJECT_DEFINITION (OBJECT_ID(SO.name)) AS SqlCode , parameter_name,ORDINAL_POSITION,PARAMETER_MODE,IS_RESULT,USER_DEFINED_TYPE_NAME,DATA_TYPE,CHARACTER_MAXIMUM_LENGTH,NUMERIC_PRECISION,NUMERIC_SCALE 
                from INFORMATION_SCHEMA.PARAMETERS
                INNER JOIN sys.objects AS SO
                ON SO.name = SPECIFIC_NAME
                where SO.type_desc = 'SQL_STORED_PROCEDURE'
                order by specific_name,ORDINAL_POSITION
			";
            Console.WriteLine("MssQuery.GetSPQuery : Done");
            return sql;
            
        }

        public string getSPOutput(String spname)
        {
               
             var sql = @"
			    SELECT *
                FROM sys.dm_exec_describe_first_result_set_for_object
                (
                  OBJECT_ID('" + spname + "'),\r\n" +
                  "NULL" + 
                ");" 
			;
            Console.WriteLine("MssQuery.GetSPOutput : Done");
            return sql;
        }

        public string GetSPName()
        {
            var sql = @"
			   SELECT SCHEMA_NAME(SCHEMA_ID) AS [Schema],
                SO.name AS [ObjectName] 
                FROM sys.objects AS SO
                WHERE SO.OBJECT_ID IN ( SELECT OBJECT_ID 
                FROM sys.objects
                WHERE TYPE IN ('P','FN') AND SO.type_desc = 'SQL_STORED_PROCEDURE')
                ORDER BY [Schema], SO.name
			";
            Console.WriteLine("MssQuery.GetSPCode : Done");
            return sql;
        }
    }
}
