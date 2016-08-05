using EasyTools.Interface.DB;
using SQLMigration.Data.ResultInfo;
using SQLMigration.Data.SchemaInfo;
using SQLMigration.Interface.Data;
using SQLMigration.Interface.Interface.Manager;
using SQLMigrationInterface.Interface.ScriptBuilder;
using SQLMigrationInterface.Interface.SourceQuery;
using SQLMigration.Converter.ScriptBuilder;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

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

             var result = datasource.Select(schemaInfoData => new TableResultData
            {                
                name = schemaInfoData.name,
                sqlString = scriptBuilder.CreateScriptTable(schemaInfoData),
                schemaId = schemaInfoData.id
            }).ToList();

            Console.WriteLine("TableManager.Convert : " + result.Count + " , Done...");
            return result;

        }

        private static List<TableSchemaInfoData> GetSchemaDataFromDt(DataTable dt)
        {
            var result = new List<TableSchemaInfoData>();
            var tempResult = new List<TableTempSource>();
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                var tempSchema = new TableTempSource();
                var data = dt.Rows[i];
                tempSchema.TableName = data["TABLE_NAME"].ToString();
                tempSchema.ColumnName = data["COLUMN_NAME"].ToString();
                tempSchema.OrdinalPosition = System.Convert.ToInt32(data["ORDINAL_POSITION"]);
                tempSchema.ColumnDefault = data["COLUMN_DEFAULT"].ToString();
                tempSchema.isNullable = System.Convert.ToBoolean(data["IS_NULLABLE"].ToString() == "1");
                tempSchema.Domain = data["DOMAIN_NAME"].ToString();
                tempSchema.DataType = data["DATA_TYPE"].ToString();
                tempSchema.CharMaxLength = System.Convert.ToInt32(data["CHARACTER_MAXIMUM_LENGTH"].GetType() == typeof(DBNull) ? 0: data["CHARACTER_MAXIMUM_LENGTH"]);
                tempSchema.Precision = System.Convert.ToInt32(data["NUMERIC_PRECISION"].GetType() == typeof(DBNull) ? 0 : data["NUMERIC_PRECISION"]);
                tempSchema.Scale = System.Convert.ToInt32(data["NUMERIC_SCALE"].GetType() == typeof(DBNull) ? 0 : data["NUMERIC_SCALE"]);
                
                tempResult.Add(tempSchema);
            }

            var UsedTableName = tempResult.GroupBy(x => x.TableName).Select(y => y.First()).ToList();           
           

            foreach (var uTableName in UsedTableName)
            {
                var listColumnUsed = new List<UsedColumn>();
                var schema = new TableSchemaInfoData();
                schema.TableName = uTableName.TableName;
                schema.name = uTableName.TableName; 
                foreach (var uColumnName in tempResult.Where(x => x.TableName == uTableName.TableName).ToList())
                {
                    var tempData = new UsedColumn();

                    tempData.ColumnName = uColumnName.ColumnName;
                    tempData.OrdinalPosition = uColumnName.OrdinalPosition;
                    tempData.ColumnDefault = uColumnName.ColumnDefault;
                    tempData.isNullable = uColumnName.isNullable;
                    tempData.Domain = uColumnName.Domain;
                    tempData.DataType = uColumnName.DataType;
                    tempData.CharMaxLength = uColumnName.CharMaxLength;
                    tempData.Precision = uColumnName.Precision;
                    tempData.Scale = uColumnName.Scale;

                    listColumnUsed.Add(tempData);
               
                }
                schema.usedColumnList = new List<UsedColumn>(listColumnUsed);
               
                result.Add(schema);
            }
            return result;
        }

       




    }
}
