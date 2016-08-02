using SQLMigration.Interface.Data;
using System.Collections.Generic;
using SQLMigration.Data.ResultInfo;
using SQLMigration.Data.SchemaInfo;

namespace SQLMigration.Interface.Interface.Manager
{
    public interface IIndexManager
    {
        List<IndexSchemaInfoData> GetSchema(ConfigData configData);
        List<IndexResultData> Convert(List<IndexSchemaInfoData> datasource);
    }


}
