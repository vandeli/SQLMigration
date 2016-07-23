using SQLMigration.Data;
using SQLMigrationConverter.mapper;
using SQLMigrationInterface;
using SQLMigrationManager;

namespace SQLMigrationOF
{
    public class OF
    {
        public IUDTManager GetInstanceUdtManager()
        {
            IDataAccess dataAccess = new DataAccess();
            IDataTypeMapper mapper = new MssToPostgree();
            IUDTScriptBuilder scriptBuilder = new UDTScriptBuilder(mapper);
            IUDTSchemaQuery schemaQuery = new UDTSchemaQuery();

            return new UDTManager(dataAccess, scriptBuilder, schemaQuery);
        }


    }
}
