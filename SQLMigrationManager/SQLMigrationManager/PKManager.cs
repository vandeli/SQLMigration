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
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                var schema = new PKSchemaInfoData();
                var data = dt.Rows[i];
               
                schema.PkName = data["PK_Name"].ToString();
                schema.TableName = data["TABLE_NAME"].ToString();
                schema.ColumnName = data["COLUMN_NAME"].ToString();
                schema.OrdinalPosition = System.Convert.ToByte(data["ORDINAL_POSITION"]);
               
                result.Add(schema);
            }

            return result;
        }

        public List<PKResultData> Convert(List<PKSchemaInfoData> datasource)
        {
            Console.WriteLine("PKManager.Convert : listSchema =>" + datasource.Count + " , start...");

            var UsedTableName = datasource.GroupBy(x => x.TableName).Select(y => y.First()).ToList();

            List<tempTableData> listTempData = new List<tempTableData>();

            foreach (var uTableName in UsedTableName)
            {
                tempTableData tempData = new tempTableData();
                tempData.AllTableName = uTableName.TableName;
                tempData.AllColumnName = getAllcolumn(datasource.Where(x => x.TableName == uTableName.TableName).ToList());
                tempData.name = uTableName.PkName;
                listTempData.Add(tempData);

            }

            var result = listTempData.Select(tempSchemaInfoData => new PKResultData
            {
                name = tempSchemaInfoData.name,
                sqlString = scriptBuilder.CreateScriptPK(tempSchemaInfoData),
                schemaId = tempSchemaInfoData.id
            }).ToList();

            Console.WriteLine("PKManager.Convert : " + result.Count + " , Done...");
            return result;
        }


        private string getAllcolumn(List<PKSchemaInfoData> datasource)
        {
            string allColumn = "";
            var n = 0;

            foreach (var getRaw in datasource)
            {
                n = datasource.IndexOf(getRaw);

                if ((n + 1) == datasource.Count)
                {
                    allColumn += getRaw.ColumnName ;
                }
                else
                {
                    allColumn += getRaw.ColumnName +  ",";
                }
            }

            return allColumn;
        }
    }
}
