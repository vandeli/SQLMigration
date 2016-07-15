using System;
using System.Data;

namespace SQLMigrationInterface
{
    public interface IBaseConvert
    {
        string CreateScript();
        DataTable CreateResultXml();
    }
}
