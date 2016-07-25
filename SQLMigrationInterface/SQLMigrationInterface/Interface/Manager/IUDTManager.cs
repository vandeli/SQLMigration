using SQLMigration.Interface.Data;
using SQLMigration.Interface.Data.ResultInfo;
using SQLMigration.Interface.Data.SchemaInfo;
using System.Collections.Generic;

namespace SQLMigration.Interface.Interface.Manager
{
    public interface IUDTManager
    {
        List<UDTSchemaInfoData> GetSchema(ConfigData configData);
        List<UDTResultData> Convert(List<UDTSchemaInfoData> datasource);
    }
}