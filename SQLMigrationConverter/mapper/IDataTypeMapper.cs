using System;
using System.Collections.Generic;

namespace SQLMigrationConverter.mapper
{
    public interface IDataTypeMapper
    {
        string GetDataTypeMap(String dataType);
    }
}
