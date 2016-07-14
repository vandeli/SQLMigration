using System;

namespace SQLMigrationInterface
{
    public interface IBaseConvert
    {
     //   event EventHandler onEndGenerate;
     //   event EventHandler onGenerate;
        string CreateScript();
    }
}
