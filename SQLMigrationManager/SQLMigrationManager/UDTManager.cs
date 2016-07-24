using SQLMigration.Data;
using SQLMigrationConverter.ResultInfo;
using SQLMigrationConverter.SchemaInfo;
using SQLMigrationInterface;
using System.Collections.Generic;
using System.Data;
using System.DirectoryServices.ActiveDirectory;

namespace SQLMigrationManager
{

    public class UDTManager : IUDTManager
    {



        private readonly IDataAccess dataAccess;
        readonly IUDTScriptBuilder scriptBuilder;
        readonly IUDTSchemaQuery schemaQuery;

        public UDTManager(IDataAccess dataAccess1, IUDTScriptBuilder scriptBuilder, IUDTSchemaQuery schemaQuery)
        {
            this.dataAccess = dataAccess1;
            this.scriptBuilder = scriptBuilder;
            this.schemaQuery = schemaQuery;
        }

        public List<UDTSchemaInfoData> GetSchema(ConfigData configData)
        {
            var result = new List<UDTSchemaInfoData>();
            var dt = dataAccess.GetDataTable(configData, schemaQuery.GetUDTQuery());
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var schema = new UDTSchemaInfoData();
                DataRow data = dt.Rows[i];
                schema.name = data["NAME"].ToString();
                schema.DataType = data["data_type"].ToString();
                schema.MaxLength = System.Convert.ToInt16(data["max_length"]);
                schema.Precision = System.Convert.ToByte(data["precision"]);
                schema.Scale = System.Convert.ToInt16(data["scale"]);
                schema.IsNullable = System.Convert.ToBoolean(data["is_nullable"].ToString() == "1" ? true:false);
                result.Add(schema);
            }

            return result;
        }



        public List<UDTResultData> Convert(List<UDTSchemaInfoData> datasource)
        {

            var result = new List<UDTResultData>();
            foreach (var schemaInfoData in datasource)
            {
                var resultInfo = new UDTResultData
                {
                    name = schemaInfoData.name,
                    sqlString = scriptBuilder.CreateScript(schemaInfoData)
                };

                result.Add(resultInfo);
            }

            return result;
        }






    }
}
