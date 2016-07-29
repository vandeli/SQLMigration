using EasyTools.Interface.DB;
using SQLMigration.Data.ResultInfo;
using SQLMigration.Data.SchemaInfo;
using SQLMigration.Interface.Data;
using SQLMigration.Interface.Interface.Manager;
using SQLMigrationInterface.Interface.ScriptBuilder;
using SQLMigrationInterface.Interface.SourceQuery;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace SQLMigrationManager
{
    public class IndexManager : IIndexManager
    {
        private readonly IDataAccess dataAccess;
        readonly IScriptBuilder scriptBuilder;
        readonly ISourceQuery sourceQuery;

        public IndexManager(IDataAccess dataAccess, IScriptBuilder scriptBuilder, ISourceQuery sourceQuery)
        {
            this.dataAccess = dataAccess;
            this.scriptBuilder = scriptBuilder;
            this.sourceQuery = sourceQuery;
        }

        public List<IndexSchemaInfoData> GetSchema(ConfigData configData)
        {
            Console.WriteLine("IndexManager.GetSchema : " + configData.name + " , start...");
            var dt = dataAccess.GetDataTable(configData.Source, sourceQuery.GetIndexQuery());
            var listSchema = GetSchemaDataFromDt(dt);
            Console.WriteLine("IndexManager.GetSchema : listSchema => " + listSchema.Count + ", Done");
            return listSchema;
        }

        private static List<IndexSchemaInfoData> GetSchemaDataFromDt(DataTable dt)
        {
            var result = new List<IndexSchemaInfoData>();
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                var schema = new IndexSchemaInfoData();
                var data = dt.Rows[i];

                schema.IndexName = data["IndexName"].ToString();
                schema.TableName = data["TableName"].ToString();
                schema.ColumnOrder = System.Convert.ToByte(data["ColumnOrder"]);
                schema.IsIncluded = System.Convert.ToByte(data["IsIncluded"]);
                schema.ColumnName = data["ColumnName"].ToString();
                result.Add(schema);
            }

            return result;
        }

        public List<IndexResultData> Convert(List<IndexSchemaInfoData> datasource)
        {
            Console.WriteLine("IndexManager.Convert : listSchema =>" + datasource.Count + " , start...");

            var UsedIndexName = datasource.GroupBy(x => x.IndexName).Select(y => y.First()).ToList();

            List<tempTableData> listTempData = new List<tempTableData>();

            foreach (var uIndexName in UsedIndexName)
            {
                tempTableData tempData = new tempTableData();
                tempData.AllTableName = uIndexName.TableName;
                tempData.AllColumnName = getAllcolumn(datasource.Where(x => x.IndexName == uIndexName.IndexName).ToList());
                tempData.name = uIndexName.IndexName;
                listTempData.Add(tempData);

            }


            var result = listTempData.Select(tempSchemaInfoData => new IndexResultData
            {
                name = tempSchemaInfoData.name,
                sqlString = scriptBuilder.CreateScriptIndex(tempSchemaInfoData),
                schemaId = tempSchemaInfoData.id
            }).ToList();

            Console.WriteLine("IndexManager.Convert : " + result.Count + " , Done...");
            return result;
        }

        private string getAllcolumn(List<IndexSchemaInfoData> datasource)
        {
            string allColumn = "";
            var n = 0;

            foreach (var getRaw in datasource)
            {
                n = datasource.IndexOf(getRaw);

                if ((n + 1) == datasource.Count)
                {
                    allColumn += getRaw.ColumnName;
                }
                else
                {
                    allColumn += getRaw.ColumnName + ",";
                }
            }

            return allColumn;
        }

    }
}
