using SQLMigration.Data.SchemaInfo;
using System.Collections.Generic;

namespace SQLMigrationInterface.Interface.ScriptBuilder
{
    public interface IScriptBuilder
    {
        string CreateScriptUDT(UDTSchemaInfoData schemaInfoData);
        string CreateScriptTable(TableSchemaInfoData schemaInfoData);
        string CreateScriptPK(PKSchemaInfoData schemaInfoData);
        string CreateScriptIndex(IndexSchemaInfoData schemaInfoData);
        string CreateScriptSP(SPSchemaInfoData schemaInfoData);
        string CreateScriptRecord(RecordSchemaInfoData schemaInfoData);
        string CreateScriptFunction(FunctionSchemaInfoData schemaInfo);
        string GetDataTypeMap(string dataType);
    }
}