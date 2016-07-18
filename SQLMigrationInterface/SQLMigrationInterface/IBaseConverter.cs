using System;
using System.Data;

namespace SQLMigrationInterface
{
    public interface IBaseConvert
    {       
        DataTable CreateResultXml();
    }
}
