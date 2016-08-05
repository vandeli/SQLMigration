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
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                try
                {
                    var schema = new RecordSchemaInfoData();
                    var data = dt.Rows[i];
                    schema.name = data["name"].ToString();
                    schema.DataRow = System.Convert.ToInt32(data["row_count"]);

                    var dtRow = dataAccess.GetDataTable(configData.Source, sourceQuery.GetDataRecord(schema.name));
                    var sumColumn = dtRow.Columns.Count;
                    List<Object[]> tempRow = new List<Object[]>();

                    for (var n = 0; n < dtRow.Rows.Count; n++)
                    {
                        var tempColumn = new Object[sumColumn];
                        var nRow = dtRow.Rows[n];
                        for (int a = 0; a < sumColumn; a++)
                        {
                            tempColumn[a] = nRow[a]; //.ToString(); 
                        }

                        tempRow.Add(tempColumn);
                        //   GC.Collect();
                        //   Array.Clear(tempColumn, 0, tempColumn.Length);
                    }

                    schema.listRow = new List<object[]>(tempRow);
                    result.Add(schema);
                    dtRow.Dispose();
                 
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
