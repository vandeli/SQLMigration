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
    public class TableManager : ITableManager
    {
        private readonly IDataAccess dataAccess;
        readonly IScriptBuilder scriptBuilder;
        readonly ISourceQuery sourceQuery;

       

        public TableManager(IDataAccess dataAccess, IScriptBuilder scriptBuilder, ISourceQuery sourceQuery)
        {
            this.dataAccess = dataAccess;
            this.scriptBuilder = scriptBuilder;
            this.sourceQuery = sourceQuery;
        }

        public List<TableSchemaInfoData> GetSchema(ConfigData configData)
        {
            Console.WriteLine("TableManager.GetSchema : " + configData.name + " , start...");
            var dt = dataAccess.GetDataTable(configData.Source, sourceQuery.GetTableQuery());
            var listSchema = GetSchemaDataFromDt(dt);
            Console.WriteLine("TableManager.GetSchema : listSchema => " + listSchema.Count + ", Done");
            return listSchema;
        }

        public List<TableResultData> Convert(List<TableSchemaInfoData> datasource)
        {
            Console.WriteLine("TableManager.Convert : listSchema =>" + datasource.Count + " , start...");
            //var UsedTableName = datasource.GroupBy(d => new { d.TableName })
            //                      .Select(d => d.First())
            //                      .ToList();
         

            var result = datasource.Select(schemaInfoData => new TableResultData
            {                
                name = schemaInfoData.TableName,
                sqlString = "Select * from Master", // scriptBuilder.CreateScriptTable(schemaInfoData, datasource.Where(x => x.TableName == schemaInfoData.TableName).ToList()),
                schemaId = schemaInfoData.id
            }).ToList();

            Console.WriteLine("TableManager.Convert : " + result.Count + " , Done...");
            return result;

        }

        private static List<TableSchemaInfoData> GetSchemaDataFromDt(DataTable dt)
        {
            var result = new List<TableSchemaInfoData>();
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                var schema = new TableSchemaInfoData();
                var data = dt.Rows[i];
                schema.TableName = data["TABLE_NAME"].ToString();
                schema.ColumnName = data["COLUMN_NAME"].ToString();
                schema.OrdinalPosition = System.Convert.ToInt32(data["ORDINAL_POSITION"]);
                schema.ColumnDefault = data["COLUMN_DEFAULT"].ToString();
                schema.isNullable = System.Convert.ToBoolean(data["IS_NULLABLE"].ToString() == "1");
                schema.Domain = data["DOMAIN_NAME"].ToString();
                schema.DataType = data["DATA_TYPE"].ToString();
                schema.CharMaxLength = System.Convert.ToInt32(data["CHARACTER_MAXIMUM_LENGTH"].GetType() == typeof(DBNull) ? 0: data["CHARACTER_MAXIMUM_LENGTH"]);
                schema.Precision = System.Convert.ToInt32(data["NUMERIC_PRECISION"].GetType() == typeof(DBNull) ? 0 : data["NUMERIC_PRECISION"]);
                schema.Scale = System.Convert.ToInt32(data["NUMERIC_SCALE"].GetType() == typeof(DBNull) ? 0 : data["NUMERIC_SCALE"]);
                
                result.Add(schema);
            }

            return result;
        }

      
          

    }
}
