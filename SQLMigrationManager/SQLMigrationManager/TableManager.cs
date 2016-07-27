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
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                var schema = new TableSchemaInfoData();
                var data = dt.Rows[i];
                schema.TableName = data["TABLE_NAME"].ToString();
                schema.ColumnName = data["COLUMN_NAME"].ToString();
                schema.OrdinalPosition = System.Convert.ToInt16(data["ORDINAL_POSITION"]);
                schema.ColumnDefault = data["COLUMN_DEFAULT"].ToString();
                schema.isNullable = System.Convert.ToBoolean(data["IS_NULLABLE"].ToString() == "1");
                schema.Domain = data["DOMAIN_NAME"].ToString();
                schema.DataType = data["DATA_TYPE"].ToString();
                schema.CharMaxLength = System.Convert.ToInt16(data["CHARACTER_MAXIMUM_LENGTH"]);
                schema.Precision = System.Convert.ToByte(data["NUMERIC_PRECISION"]);
                schema.Scale = System.Convert.ToInt16(data["NUMERIC_SCALE"]);
                
                result.Add(schema);
            }

            return result;
        }

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
        //    SELECT a.TABLE_NAME
        //     ,a.COLUMN_NAME
        //     ,a.ORDINAL_POSITION
        //     ,a.COLUMN_DEFAULT
        //     ,a.IS_NULLABLE
        //     ,a.DOMAIN_NAME
        //     ,a.DATA_TYPE
        //     ,a.CHARACTER_MAXIMUM_LENGTH
        //     ,a.NUMERIC_PRECISION
        //     ,a.NUMERIC_SCALE
        //    FROM INFORMATION_SCHEMA.columns a
        //    JOIN INFORMATION_SCHEMA.Tables b ON a.TABLE_NAME = b.TABLE_NAME
        //    WHERE TABLE_TYPE = 'BASE TABLE'
        //    ORDER BY table_name
        //     ,ORDINAL_POSITION
        //    ";
        //}

        //List<T> GetDataQuery<T>(DataTable datasource) where T : Base, new()
        //{
        //    var list = new List<T>();
        //    if (list.Count == 0)
        //    {
        //      //  var dataTable = new DataAccess().GetDataTable(sql);
        //        foreach (DataRow data in datasource.Rows)
        //        {
        //            var obj = new T();
        //            obj.GetValueFromDataRow(data);
        //            list.Add(obj);

        //        }
        //    }
        //    return list;
        //}

        //public string CreateScript(DataTable datasource)
        //{

        //    string[] allcolumn = getAllcolumn();
        //    var result = "";
        //    var tableResult = "";
        //    int xs = 1;
        //    foreach (var data in GetAllTable(datasource))
        //    {

        //        if (data.OrdinalPosition == 1)
        //        {

        //            tableResult = getTemplate(data,allcolumn[xs]);
        //            result += tableResult;
        //            xs += 1;
        //        }
        //    }
        //    return result;

        //}

        //public List<mTable> GetAllTable(DataTable datasource)
        //{
        //    return GetDataQuery<mTable>(datasource);

        //}

        //public DataTable CreateResultXml(DataTable datasource)
        //{

        //    DataTable DTresultItem = new DataTable("ResultInfo");

        //    DTresultItem.Columns.Add("SchemaId", typeof(int));
        //    DTresultItem.Columns.Add("name", typeof(string));
        //    DTresultItem.Columns.Add("sqlString", typeof(string));
        //    DTresultItem.Columns.Add("ResultID", typeof(string));
        //    string[] allcolumn = getAllcolumn();
        //     int xs = 1;

        //    var tableResult = "";
        //    foreach (var data in GetAllTable(datasource))
        //    {
        //        if (data.OrdinalPosition == 1)
        //        {                    
        //            DataRow workRow = DTresultItem.NewRow();
        //            tableResult = getTemplate(data, allcolumn[xs]);
        //            workRow["SchemaId"] = data.SchemaID;
        //            workRow["name"] = data.TableName;
        //            workRow["sqlString"] = tableResult;
        //            workRow["ResultID"] = tableResult.GetHashCode().ToString().Replace("-", "");
        //            DTresultItem.Rows.Add(workRow);
        //            xs += 1;
        //        }

        //    }

        //    return DTresultItem;
        //}

        //private string[] getAllcolumn(DataTable datasource)
        //{
        //    int xs = 0;
        //    int xcount = 1;

        //    foreach (var totalraw in GetAllTable(datasource))
        //    {
        //        if (totalraw.OrdinalPosition == 1)
        //        {
        //            xcount += 1;                    
        //        }
        //    }
        //    string[] allColumn = new string[xcount];

        //    foreach (var data in GetAllTable(datasource))
        //    {
        //       // var setData = data.GetConvertedDataType();

        //        if (data.OrdinalPosition == 1)
        //        {
        //            xs += 1;
        //          //  cekSuffix(data);
        //            allColumn[xs] = data.ColumnName + " " + cekSuffix(data) ;

        //        }
        //        else
        //        {
        //            allColumn[xs] += ",\n " + data.ColumnName + "   " + cekSuffix(data);
        //        }

        //    }

        //    return allColumn;
        //}

        //private string cekSuffix(mTable data)
        //{
        //    var cekResult = "";
        //    if (data.Domain != "")
        //    {
        //        cekResult = data.Domain;
        //    }
        //    else 
        //    {
        //        cekResult = data.GetConvertedDataType();
        //    }

        //    if (data.CharMaxLength != 0)
        //    {
        //        cekResult += " (" + data.CharMaxLength + ")";
        //    }
        //    else if (data.Precision != 0)
        //    {
        //        cekResult += " (" + data.Precision + "," + data.Scale + ")";
        //    }

        //    if (data.isNullable == false)
        //    {
        //        cekResult += "  NOT NULL";
        //    }
        //    return cekResult;

        //}

        //public string getTemplate(mTable data, string allColumn)
        //{
        //    var result = "";
        //    var infodata = data.GetConvertedDataType();

        //    result = "CREATE TABLE " + data.TableName + "(\n" +
        //              allColumn + "\n" +                        
        //              ");\r\n";


        //    return result;
        //}

    }
}
