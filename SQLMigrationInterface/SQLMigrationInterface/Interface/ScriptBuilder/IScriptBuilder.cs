using SQLMigration.Data.SchemaInfo;
using System.Collections.Generic;

namespace SQLMigrationInterface.Interface.ScriptBuilder
{
    public interface IScriptBuilder
    {
        string CreateScriptUDT(UDTSchemaInfoData schemaInfoData);
        string CreateScriptTable(TableSchemaInfoData schemaInfoData, List<TableSchemaInfoData> datasource);
    }
}