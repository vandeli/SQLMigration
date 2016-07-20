using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigrationConverter.MapAttribut
{
    public interface IInfoQuery
    {
        string GetColumns();
        string GetUdts();
        string GetTablesPKs();
        string GetIndex();
        string GetProcedures();
        string GetProcedureOutputs();
        string GetParameters();
    }

    public class InfoQuery : IInfoQuery
    {
        public string GetColumns()
        {
            return @"
            SELECT a.table_name
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
        }
        public string GetUdts()
        {
            return @"
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
        }
        public string GetTablesPKs()
        {
            return @"
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
        }
        public string GetIndex()
        {
            return @"
                select 
                     i.name as IndexName, 
                     o.name as TableName, 
                     ic.key_ordinal as ColumnOrder,
                     ic.is_included_column as IsIncluded, 
                     co.[name] as ColumnName
                from sys.indexes i 
                    join sys.objects o on i.object_id = o.object_id
                    join sys.index_columns ic on ic.object_id = i.object_id 
                    and ic.index_id = i.index_id
                    join sys.columns co on co.object_id = i.object_id 
                    and co.column_id = ic.column_id
                where i.[type] = 2 
                and i.is_unique = 0 
                and i.is_primary_key = 0
                and o.[type] = 'U'
                order by o.[name], i.[name], ic.is_included_column, ic.key_ordinal
                ";
        }
        public string GetProcedures()
        {
            return @"
            SELECT a.NAME
	            ,b.colid
	            ,b.TEXT
            FROM sysobjects a
            JOIN syscomments b ON a.id = b.id
            WHERE xtype = 'P'
            ORDER BY a.NAME
	            ,colid
            ";
        }
        public string GetProcedureOutputs()
        {
            return @"
            SELECT '{0}' AS proc_name
	            ,column_ordinal
	            ,NAME
	            ,is_nullable
	            ,user_type_name
	            ,system_type_name
	            ,precision
	            ,scale
	            ,max_length
            FROM sys.dm_exec_describe_first_result_set_for_object(OBJECT_ID('{0}'), NULL);
            ";
        }
        public string GetParameters()
        {
            return @"
            SELECT specific_name
	            ,parameter_name
	            ,ORDINAL_POSITION
	            ,PARAMETER_MODE
	            ,IS_RESULT
	            ,USER_DEFINED_TYPE_NAME
	            ,DATA_TYPE
	            ,CHARACTER_MAXIMUM_LENGTH
	            ,NUMERIC_PRECISION
	            ,NUMERIC_SCALE
            FROM INFORMATION_SCHEMA.PARAMETERS
            ORDER BY specific_name
	            ,ORDINAL_POSITION
            ";
        }
    }
}
