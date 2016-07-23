using System.Collections.Generic;

namespace SQLMigrationConverter.mapper
{
    public interface IDataTypeMapper
    {
        List<TablesFieldDataType> GetDataTypeMap();
    }
}
