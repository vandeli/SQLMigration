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
            Console.WriteLine("MssQuery.GetUDTQuery : Done");
            return sql;
        }
    }
}
