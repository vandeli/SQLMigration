using SQLMigration.Data;
using SQLMigrationConverter.ResultInfo;
using SQLMigrationConverter.SchemaInfo;
using SQLMigrationInterface;
using System.Collections.Generic;
using System.Data;

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
                schema.name = data["szName"].ToString();
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
