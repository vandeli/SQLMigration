using SQLMigration.Data;
using SQLMigration.Interface.ResultInfo;
using SQLMigration.Interface.SchemaInfo;
using System.Collections.Generic;

namespace SQLMigration.Interface.Manager
{
    public interface IUDTManager
    {
        List<UDTSchemaInfoData> GetSchema(ConfigData configData);
        List<UDTResultData> Convert(List<UDTSchemaInfoData> datasource);
    }
}