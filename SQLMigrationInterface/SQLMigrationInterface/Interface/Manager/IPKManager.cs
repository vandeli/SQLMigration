using SQLMigration.Data.ResultInfo;
using SQLMigration.Data.SchemaInfo;
using SQLMigration.Interface.Data;
using System.Collections.Generic;

namespace SQLMigration.Interface.Interface.Manager
{
    public interface IPKManager
    {
        List<PKSchemaInfoData> GetSchema(ConfigData configData);
        List<PKResultData> Convert(List<PKSchemaInfoData> datasource);
    }
}
