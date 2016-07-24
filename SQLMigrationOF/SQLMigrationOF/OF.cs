using SQLMigration.Data;
using SQLMigrationConverter.ScriptBuilder;
using SQLMigrationConverter.SourceQuery;
using SQLMigrationInterface;
using SQLMigrationManager;

namespace SQLMigrationOF
{
    public class OF
    {
        IUDTManager udtManager;
        public IUDTManager GetInstanceUdtManager()
        {
            if (udtManager != null) return udtManager;

            IDataAccess dataAccess = new DataAccess();
            IScriptBuilder scriptBuilder = new PstScriptBuilder();
            ISourceQuery schemaQuery = new MssQuery();
            udtManager = new UDTManager(dataAccess, scriptBuilder, schemaQuery);

            return udtManager;
        }


    }
}
