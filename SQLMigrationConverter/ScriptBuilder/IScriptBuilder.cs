using SQLMigrationConverter.SchemaInfo;

namespace SQLMigrationConverter.ScriptBuilder
{
    public interface IScriptBuilder
    {
        string CreateScriptUDT(UDTSchemaInfoData schemaInfoData);
    }
}