using SQLMigration.Data;
using SQLMigrationConverter.ResultInfo;
using SQLMigrationConverter.SchemaInfo;
using System.Collections.Generic;

namespace SQLMigrationInterface
{
    public interface IUDTManager
    {
        List<UDTSchemaInfoData> GetSchema(ConfigData configData);
        List<UDTResultData> Convert(List<UDTSchemaInfoData> datasource);
    }
}