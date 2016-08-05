using System;

namespace SQLMigrationInterface.Interface.SourceQuery
{
    public interface ISourceQuery
    {
        string GetUDTQuery();
        string GetTableQuery();
        string GetPKQuery();
        string GetIndexQuery();
        string GetSPQuery();
        string GetSPName();
        string getSPOutput(String spname);
        string GetTableRecord();
        string GetDataRecord(String tableName);
    }
}