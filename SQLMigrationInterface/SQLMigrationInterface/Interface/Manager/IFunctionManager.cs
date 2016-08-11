using SQLMigration.Data.ResultInfo;
using SQLMigration.Data.SchemaInfo;
using SQLMigration.Interface.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigration.Interface.Interface.Manager
{
    public interface IFunctionManager
    {
        List<FunctionSchemaInfoData> GetSchema(ConfigData configData);
        List<FunctionResultData> Convert(List<FunctionSchemaInfoData> datasource);

    }
}
