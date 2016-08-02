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
            var tempResult = new List<IndexTempSource>();
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                var tempSchema = new IndexTempSource();
                var data = dt.Rows[i];

                tempSchema.IndexName = data["IndexName"].ToString();
                tempSchema.TableName = data["TableName"].ToString();
                tempSchema.ColumnOrder = System.Convert.ToByte(data["ColumnOrder"]);
                tempSchema.IsIncluded = System.Convert.ToByte(data["IsIncluded"]);
                tempSchema.ColumnName = data["ColumnName"].ToString();
                tempResult.Add(tempSchema);
            }
            var UsedTableName = tempResult.GroupBy(x => x.IndexName).Select(y => y.First()).ToList();

            foreach (var uTableName in UsedTableName)
            {
                var listColumnUsed = new List<UsedColumn>();
                var schema = new IndexSchemaInfoData();
                schema.TableName = uTableName.TableName;
                schema.IndexName = uTableName.IndexName;
                schema.name = uTableName.IndexName;
                foreach (var uColumnName in tempResult.Where(x => x.IndexName == uTableName.IndexName).ToList())
                {
                    var tempData = new UsedColumn();

                    tempData.ColumnName = uColumnName.ColumnName;
                   
                    listColumnUsed.Add(tempData);
                }
                schema.usedColumnList = new List<UsedColumn>(listColumnUsed);
                result.Add(schema);
            }

            return result;
        }

        public List<IndexResultData> Convert(List<IndexSchemaInfoData> datasource)
        {
            Console.WriteLine("IndexManager.Convert : listSchema =>" + datasource.Count + " , start...");

            var result = datasource.Select(schemaInfoData => new IndexResultData
            {
                name = schemaInfoData.IndexName,
                sqlString = scriptBuilder.CreateScriptIndex(schemaInfoData),
                schemaId = schemaInfoData.id
            }).ToList();

            Console.WriteLine("IndexManager.Convert : " + result.Count + " , Done...");
            return result;
        }


    }
}
