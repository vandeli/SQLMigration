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
            var result = datasource.Select(schemaInfoData => new PKResultData
            {
                name = schemaInfoData.PkName,
                sqlString = scriptBuilder.CreateScriptPK(schemaInfoData),
                schemaId = schemaInfoData.id
            }).ToList();

            Console.WriteLine("PKManager.Convert : " + result.Count + " , Done...");
            return result;
        }

       

        //public void SetConfig(ConfigData configdata)
        //{
        //    var param = new DBData();
        //    param = configdata.Source;           
        //    configdata.Source = param;
        //    WriteConfig(configdata);
        //}

        //private static void WriteConfig(ConfigData configdata)
        //{
        //    var writer = new System.Xml.Serialization.XmlSerializer(typeof(ConfigData));
        //    var file = File.Create("Config.xml");

        //    writer.Serialize(file, configdata);
           
        //    file.Close();
        //}

        //private string GetQuery()
        //{
        //    return @"
        //    SELECT CONSTRAINT_NAME AS PK_Name
	       //     ,TABLE_NAME
	       //     ,COLUMN_NAME
	       //     ,ORDINAL_POSITION
        //    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE b
        //    JOIN (
	       //     SELECT NAME
	       //     FROM sysobjects a
	       //     WHERE xtype = 'pk'
		      //      AND parent_obj IN (
			     //       SELECT id
			     //       FROM sysobjects
			     //       WHERE xtype = 'U'
			     //       )
	       //     ) a ON a.NAME = b.CONSTRAINT_NAME
        //    ORDER BY table_name
	       //     ,ORDINAL_POSITION
        //    ";
        //}

        //List<T> GetDataQuery<T>(string sql) where T : Base, new()
        //{
        //    var list = new List<T>();
        //    if (list.Count == 0)
        //    {
        //        var dataTable = new DataAccess().GetDataTable(sql);
        //        foreach (DataRow data in dataTable.Rows)
        //        {
        //            var obj = new T();
        //            obj.GetValueFromDataRow(data);
        //            list.Add(obj);
        //        }
        //    }
        //    return list;
        //}

        //public string CreateScript()
        //{
        //    string[] allcolumn = new string[1000];
        //    var result = "";
        //    var tableResult = "";
        //    allcolumn = getAllcolumn();
        //    int xs = 0;
        //    foreach (var data in GetAllPk())
        //    {
        //        if (data.OrdinalPosition == 1)
        //        {
        //            xs += 1;
        //            tableResult = getTemplate(data, allcolumn[xs]);
        //            result += tableResult;
        //        }
        //    }
        //    return result;
        //}

        //public List<mPK> GetAllPk()
        //{
        //    return GetDataQuery<mPK>(GetQuery());

        //}

        //private string[] getAllcolumn()
        //{

        //    string[] allColumn = new string[1000];
        //    int xs = 0;

        //    foreach (var data in GetAllPk())
        //    {
        //        if (data.OrdinalPosition == 1)
        //        {
        //            xs += 1;
        //            allColumn[xs] = data.ColumnName;
        //        }
        //        else
        //        {
        //            allColumn[xs] += "," + data.ColumnName;
        //        }

        //    }
        //    return allColumn;
        //}

        //public DataTable CreateResultXml()
        //{
        //  //  ResultItemData resultItemdata = new ResultItemData();
        //    DataTable DTresultItem = new DataTable("ResultInfo");
        //    DTresultItem.Columns.Add("SchemaId", typeof(int));
        //    DTresultItem.Columns.Add("name", typeof(string));
        //    DTresultItem.Columns.Add("sqlString", typeof(string));
        //    DTresultItem.Columns.Add("ResultID", typeof(string));

        //    string[] allcolumn = getAllcolumn();
        //    int xs = 1;

        //    var tableResult = "";
        //    foreach (var data in GetAllPk())
        //    {
        //        if (data.OrdinalPosition == 1)
        //        {
        //            DataRow workRow = DTresultItem.NewRow();
        //            tableResult = getTemplate(data, allcolumn[xs]);
        //            workRow["SchemaId"] = data.SchemaID;
        //            workRow["name"] = data.PkName;
        //            workRow["sqlString"] = tableResult;
        //            workRow["ResultID"] = tableResult.GetHashCode().ToString().Replace("-", "");
        //            DTresultItem.Rows.Add(workRow);
        //            xs = xs++;
        //        }
        //    }
        //    return DTresultItem;
        //}

        //public string getTemplate(mPK data, string allcolumn)
        //{
        //    var result = "";
        //    result = "ALTER TABLE " + data.TableName + " ADD CONSTRAINT " + data.PkName + " PRIMARY KEY" + "(" + allcolumn + ")" + ";\r\n";
        //    return result;
        //}
    }
}
