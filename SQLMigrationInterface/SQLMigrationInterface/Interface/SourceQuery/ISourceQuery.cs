namespace SQLMigrationInterface.Interface.SourceQuery
{
    public interface ISourceQuery
    {
        string GetUDTQuery();
        string GetTableQuery();
        string GetPKQuery();
        string GetIndexQuery();
        string GetSPQuery();
    }
}