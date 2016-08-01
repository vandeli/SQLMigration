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

            var UsedTableName = datasource.GroupBy(x => x.TableName).Select(y => y.First()).ToList();
       


            List<tempTableData> listTempData = new List<tempTableData>();
            
            foreach (var uTableName in UsedTableName)
            {
                tempTableData tempData = new tempTableData();
                tempData.AllTableName = uTableName.TableName;
                tempData.AllColumnName = getAllcolumn(datasource.Where(x => x.TableName == uTableName.TableName).ToList());
                tempData.name = uTableName.TableName;
                listTempData.Add(tempData);
               

            }

       //     var sqlString = scriptBuilder.CreateScriptTable(tempData);
             var result = listTempData.Select(tempSchemaInfoData => new TableResultData
            {                
                name = tempSchemaInfoData.name,
                sqlString = scriptBuilder.CreateScriptTable(tempSchemaInfoData),
                schemaId = tempSchemaInfoData.id
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

        private string getAllcolumn(List<TableSchemaInfoData> datasource)
        {
            string allColumn = "";
            var n = 0;

            foreach (var getRaw in datasource)
            {
                n = datasource.IndexOf(getRaw);
           
                if ((n+1)  == datasource.Count)
                     {
                        allColumn += getRaw.ColumnName + " " + cekSuffix(getRaw) + "\r\n ";
                     }
                else
                     {
                         allColumn += getRaw.ColumnName + " " + cekSuffix(getRaw) + ",\r\n";
                     }            
            }

            return allColumn;
        }

        private string cekSuffix(TableSchemaInfoData data)
        {
            var cekResult = "";
            if (data.Domain != "")
            {
                cekResult = data.Domain;
            }
            else
            {
                cekResult = scriptBuilder.GetDataTypeMap(data.DataType);
            }

            if (data.CharMaxLength != 0)
            {
                cekResult += " (" + data.CharMaxLength + ")";
            }
            else if (data.Precision != 0)
            {
                cekResult += " (" + data.Precision + "," + data.Scale + ")";
            }

            if (data.isNullable == false)
            {
                cekResult += "  NOT NULL";
            }
            return cekResult;

        }




    }
}
