using SQLMigration.Data.SchemaInfo;
using System.Collections.Generic;

namespace SQLMigrationInterface.Interface.ScriptBuilder
{
    public interface IScriptBuilder
    {
        string CreateScriptUDT(UDTSchemaInfoData schemaInfoData);
        string CreateScriptTable(tempTableData schemaInfoData);
        string CreateScriptPK(tempTableData schemaInfoData);
        string CreateScriptIndex(tempTableData schemaInfoData);
        string GetDataTypeMap(string dataType);
    }
}