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
            IDataTypeMapper mapper = new SqlServerTypeMapper();
            return new UDTManager(dataAccess, mapper);
        }


    }
}
