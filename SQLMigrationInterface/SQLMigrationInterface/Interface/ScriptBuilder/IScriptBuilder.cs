using SQLMigration.Data.SchemaInfo;


namespace SQLMigration.Interface.ScriptBuilder
{
    public interface IScriptBuilder
    {
        string CreateScriptUDT(UDTSchemaInfoData schemaInfoData);
    }
}