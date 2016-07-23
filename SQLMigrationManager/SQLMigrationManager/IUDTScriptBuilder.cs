using SQLMigrationConverter.SchemaInfo;

namespace SQLMigrationManager
{
    public interface IUDTScriptBuilder
    {
        string CreateScript(UDTSchemaInfoData schemaInfoData);
    }
}