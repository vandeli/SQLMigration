
using SQLMigration.Data;
using System.Data;

namespace SQLMigrationInterface
{
    public interface IManager
    {
        DataTable GetSchema();
        void Convert(DataTable datasource);
     //   void SetConfig(ConfigData configdata);
    }
}
