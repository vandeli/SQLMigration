using SQLMigration.Data.ResultInfo;
using SQLMigration.Data.SchemaInfo;
using SQLMigration.Interface.Data;
using System.Collections.Generic;

namespace SQLMigration.Interface.Interface.Manager
{
    public interface ISPManager
    {
        List<SPSchemaInfoData> GetSchema(ConfigData configData);
        List<SPResultData> Convert(List<SPSchemaInfoData> datasource);

    }
}
