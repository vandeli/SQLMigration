
using SQLMigration.Data;

namespace SQLMigrationInterface
{
    public interface IManager
    {
        void GetSchema();
        void Convert();
        void SetConfig(SetData setData);
    }
}
