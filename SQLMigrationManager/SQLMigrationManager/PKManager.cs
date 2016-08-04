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
    public class PKManager : IPKManager
    {
      
        private readonly IDataAccess dataAccess;
        readonly IScriptBuilder scriptBuilder;
        readonly ISourceQuery sourceQuery;

        public PKManager(IDataAccess dataAccess, IScriptBuilder scriptBuilder, ISourceQuery sourceQuery)
        {
            this.dataAccess = dataAccess;
            this.scriptBuilder = scriptBuilder;
            this.sourceQuery = sourceQuery;
        }

        public List<PKSchemaInfoData> GetSchema(ConfigData configData)
        {
            Console.WriteLine("PKManager.GetSchema : " + configData.name + " , start...");
            var dt = dataAccess.GetDataTable(configData.Source, sourceQuery.GetPKQuery());
            var listSchema = GetSchemaDataFromDt(dt);
            Console.WriteLine("PKManager.GetSchema : listSchema => " + listSchema.Count + ", Done");
            return listSchema;
        }

        private static List<PKSchemaInfoData> GetSchemaDataFromDt(DataTable dt)
        {
            var result = new List<PKSchemaInfoData>();
            var tempResult = new List<PKTempSource>();
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                var tempSchema = new PKTempSource();
                var data = dt.Rows[i];

                tempSchema.PkName = data["PK_Name"].ToString();
                tempSchema.TableName = data["TABLE_NAME"].ToString();
                tempSchema.ColumnName = data["COLUMN_NAME"].ToString();
                tempSchema.OrdinalPosition = System.Convert.ToByte(data["ORDINAL_POSITION"]);
               
                tempResult.Add(tempSchema);
            }

            var UsedTableName = tempResult.GroupBy(x => x.TableName).Select(y => y.First()).ToList();

            foreach (var uTableName in UsedTableName)
            {
                var listColumnUsed = new List<UsedColumn>();
                var schema = new PKSchemaInfoData();
                schema.TableName = uTableName.TableName;
                schema.PkName = uTableName.PkName;
                schema.name = uTableName.PkName;
                foreach (var uColumnName in tempResult.Where(x => x.TableName == uTableName.TableName).ToList())
                {
                    var tempData = new UsedColumn();

                    tempData.ColumnName = uColumnName.ColumnName;
                    tempData.OrdinalPosition = uColumnName.OrdinalPosition;

                    listColumnUsed.Add(tempData);
                }
                schema.usedColumnList = new List<UsedColumn>(listColumnUsed);
                result.Add(schema);
            }
            return result;
        }

        public List<PKResultData> Convert(List<PKSchemaInfoData> datasource)
        {
            Console.WriteLine("PKManager.Convert : listSchema =>" + datasource.Count + " , start...");

            var result = datasource.Select(schemaInfoData => new PKResultData
            {
                name = schemaInfoData.PkName,                
                sqlString = scriptBuilder.CreateScriptPK(schemaInfoData),
                schemaId = schemaInfoData.id
            }).ToList();

            Console.WriteLine("PKManager.Convert : " + result.Count + " , Done...");
            return result;
        }
        
    }
}
