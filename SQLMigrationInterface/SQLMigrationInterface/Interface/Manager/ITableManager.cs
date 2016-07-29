using SQLMigration.Data.ResultInfo;
using SQLMigration.Data.SchemaInfo;
using SQLMigration.Interface.Data;
using System.Collections.Generic;

namespace SQLMigration.Interface.Interface.Manager
{
    public interface ITableManager
    {
        List<TableSchemaInfoData> GetSchema(ConfigData configData);
        List<TableResultData> Convert(List<TableSchemaInfoData> datasource);

    }
}
