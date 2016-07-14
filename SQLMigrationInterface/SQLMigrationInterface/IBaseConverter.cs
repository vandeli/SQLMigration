using System;
using System.Data;

namespace SQLMigrationInterface
{
    public interface IBaseConvert
    {
     //   event EventHandler onEndGenerate;
     //   event EventHandler onGenerate;
        string CreateScript();
        DataTable CreateResultXml();
    }
}
