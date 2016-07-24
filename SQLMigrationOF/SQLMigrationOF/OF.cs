using SQLMigration.Data;
using SQLMigrationConverter.ScriptBuilder;
using SQLMigrationConverter.SourceQuery;
using SQLMigrationInterface;
using SQLMigrationManager;

namespace SQLMigrationOF
{
    public class OF
    {
        public IUDTManager GetInstanceUdtManager()
        {
            IDataAccess dataAccess = new DataAccess();
            IScriptBuilder scriptBuilder = new PstScriptBuilder();
            ISourceQuery schemaQuery = new MssQuery();

            return new UDTManager(dataAccess, scriptBuilder, schemaQuery);
        }


    }
}
