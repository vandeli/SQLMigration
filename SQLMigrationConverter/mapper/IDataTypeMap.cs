using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigrationConverter.mapper
{
    public interface IDataTypeMap
    {
        List<TablesFieldDataType> GetDataTypeMap();
    }
}
