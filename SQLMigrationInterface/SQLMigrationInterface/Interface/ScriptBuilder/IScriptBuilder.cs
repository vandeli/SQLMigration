using SQLMigration.Data.SchemaInfo;

namespace SQLMigrationInterface.Interface.ScriptBuilder
{
    public interface IScriptBuilder
    {
        string CreateScriptUDT(UDTSchemaInfoData schemaInfoData);
    }
}