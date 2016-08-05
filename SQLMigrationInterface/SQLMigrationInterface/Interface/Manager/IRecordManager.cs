using SQLMigration.Data.ResultInfo;
using SQLMigration.Data.SchemaInfo;
using SQLMigration.Interface.Data;
using System.Collections.Generic;

namespace SQLMigration.Interface.Interface.Manager
{
    public interface IRecordManager
    {
        List<RecordSchemaInfoData> GetSchema(ConfigData configData);
        List<RecordResultData> Convert(List<RecordSchemaInfoData> datasource);
    }
}
