using SQLMigration.Data;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using SQLMigration.Interface.Manager;
using SQLMigration.Interface.ResultInfo;
using SQLMigration.Interface.SchemaInfo;
using SQLMigration.Interface.ScriptBuilder;
using SQLMigration.Interface.SourceQuery;

namespace SQLMigration.Manager
{

    public class UDTManager : IUDTManager
    {
        private readonly IDataAccess dataAccess;
        readonly IScriptBuilder scriptBuilder;
        readonly ISourceQuery sourceQuery;

        public UDTManager(IDataAccess dataAccess, IScriptBuilder scriptBuilder, ISourceQuery sourceQuery)
        {
            this.dataAccess = dataAccess;
            this.scriptBuilder = scriptBuilder;
            this.sourceQuery = sourceQuery;
        }

        public List<UDTSchemaInfoData> GetSchema(ConfigData configData)
        {
            var dt = dataAccess.GetDataTable(configData, sourceQuery.GetUDTQuery());
            return GetSchemaDataFromDt(dt);
        }

        private static List<UDTSchemaInfoData> GetSchemaDataFromDt(DataTable dt)
        {
            List<UDTSchemaInfoData> result = new List<UDTSchemaInfoData>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var schema = new UDTSchemaInfoData();
                var data = dt.Rows[i];
                schema.name = data["NAME"].ToString();
                schema.DataType = data["data_type"].ToString();
                schema.MaxLength = System.Convert.ToInt16(data["max_length"]);
                schema.Precision = System.Convert.ToByte(data["precision"]);
                schema.Scale = System.Convert.ToInt16(data["scale"]);
                schema.IsNullable = System.Convert.ToBoolean(data["is_nullable"].ToString() == "1");
                result.Add(schema);
            }

            return result;
        }



        public List<UDTResultData> Convert(List<UDTSchemaInfoData> datasource)
        {
            return datasource.Select(schemaInfoData => new UDTResultData
            {
                name = schemaInfoData.name,
                sqlString = scriptBuilder.CreateScriptUDT(schemaInfoData),
                schemaId = schemaInfoData.id

            }).ToList();
        }
    }
}
