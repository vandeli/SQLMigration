using SQLMigration.Interface.Data;
using System.Collections.Generic;
using SQLMigration.Data.ResultInfo;
using SQLMigration.Data.SchemaInfo;

namespace SQLMigration.Interface.Interface.Manager
{
    public interface IUDTManager
    {
        List<UDTSchemaInfoData> GetSchema(ConfigData configData);
        List<UDTResultData> Convert(List<UDTSchemaInfoData> datasource);
    }
}