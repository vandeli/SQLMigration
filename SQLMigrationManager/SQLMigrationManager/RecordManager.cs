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
using System.Diagnostics;
using System.Linq;
using System.Windows.Forms;

namespace SQLMigrationManager
{
    public class RecordManager : IRecordManager
    {
        private readonly IDataAccess dataAccess;
        readonly IScriptBuilder scriptBuilder;
        readonly ISourceQuery sourceQuery;

        public RecordManager(IDataAccess dataAccess, IScriptBuilder scriptBuilder, ISourceQuery sourceQuery)
        {
            this.dataAccess = dataAccess;
            this.scriptBuilder = scriptBuilder;
            this.sourceQuery = sourceQuery;
        }

        public List<RecordSchemaInfoData> GetSchema(ConfigData configData)
        {
            Console.WriteLine("RecordManager.GetSchema : " + configData.name + " , start...");
            var dt = dataAccess.GetDataTable(configData.Source, sourceQuery.GetTableRecord());
            
            var listSchema = GetSchemaDataFromDt(dt,configData);
            Console.WriteLine("RecordManager.GetSchema : listSchema => " + listSchema.Count + ", Done");
            return listSchema;
        }

        private List<RecordSchemaInfoData> GetSchemaDataFromDt(DataTable dt, ConfigData configData)
        {
                    
            var result = new List<RecordSchemaInfoData>();
            string[] tableName = new String[dt.Rows.Count];
            var nQuery = "";
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                var tableData = dt.Rows[i];
                tableName[i] = tableData["name"].ToString();
                nQuery += "SELECT * FROM "+ tableData["name"].ToString() +";\r\n";
            }
           
           dataAccess.GetDataSet(configData.Source, nQuery, tableName);
           
            //===========================================================


            for (var i = 0; i < dt.Rows.Count; i++)
            {
                try
                {

                    var schema = new RecordSchemaInfoData();
                    var data = dt.Rows[i];
                    schema.name = data["name"].ToString();
                    schema.TableName = data["name"].ToString();
                    schema.DataRow = System.Convert.ToInt32(data["row_count"]);

                    result.Add(schema);
                
                 
                }
                catch (OutOfMemoryException)
                {
                    
                    pesan("Error memory overload");
                }
            }
            return result;
        }

        private void pesan(string v)
        {
            MessageBox.Show(v);
        }

        public List<RecordResultData> Convert(List<RecordSchemaInfoData> datasource)
        {
            Console.WriteLine("RecordManager.Convert : listSchema =>" + datasource.Count + " , start...");
            var result = datasource.Select(schemaInfoData => new RecordResultData
            {
                name = schemaInfoData.name,
                sqlString = scriptBuilder.CreateScriptRecord(schemaInfoData),
                schemaId = schemaInfoData.id
            }).ToList();

            Console.WriteLine("RecordManager.Convert : " + result.Count + " , Done...");
            return result;
        }

       
    }
}
