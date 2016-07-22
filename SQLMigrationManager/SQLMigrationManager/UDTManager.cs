using SQLMigration.Data;
using SQLMigration.DB;
using SQLMigration.IO;
using SQLMigrationConverter.MapAttribut;
using SQLMigrationConverter.ResultInfo;
using SQLMigrationConverter.SchemaInfo;
using SQLMigrationInterface;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Windows.Forms;

namespace SQLMigrationManager
{

    public class UDTManager : IUDTManager
  {
        private readonly IFileManager fileManager;
        private readonly ConfigData configdata;
        private readonly ICoreDB db;
        private readonly ICoreSchema Schema;
        private readonly ICoreResult Result;
        private readonly ICoreResult PgSQL;
        private readonly IDataAccess dataAccess;

        public UDTManager(ConfigData configdata, IFileManager fileManager, ICoreDB db,ICoreSchema Schema, ICoreResult Result, ICoreResult PgSQL, IDataAccess dataAccess)
         {
            this.configdata = configdata;
            this.fileManager = fileManager;
            this.db = db;
            this.Schema = Schema;
            this.Result = Result;
            this.PgSQL = PgSQL;
            this.db.CreateConfig(configdata);         
            this.dataAccess = dataAccess;
            
         }
        public DataTable GetSchema() 
        {                        
            var dt = dataAccess.GetDataTable(configdata, GetQuery());
            Schema.CreateSchema(dt);         
            return dt;
           }
        public void Convert(DataTable datasource)
        {

            DataTable resultXML = CreateResultXml(datasource);
            var result = CreateScript(datasource);

            Result.CreateResult(resultXML);
            PgSQL.CreatePgSql(result);
        }        
           
    

      

        //private static void WriteConfig(ConfigData configdata)
        //{
        //    var writer = new System.Xml.Serialization.XmlSerializer(typeof(ConfigData));
        //    var file = File.Create("Config.xml");
        //    writer.Serialize(file, configdata);
        //    file.Close();
        //}

        private string GetQuery()
        {
            return @"
            SELECT st.NAME
	            ,bs.[name] AS data_type
	            ,st.max_length
	            ,st.precision
	            ,st.scale
	            ,st.is_nullable
            FROM sys.types st
            INNER JOIN sys.schemas ss ON st.[schema_id] = ss.[schema_id]
            INNER JOIN sys.types bs ON bs.[user_type_id] = st.[system_type_id]
            WHERE st.[is_user_defined] = 1 -- exclude system types
            ORDER BY st.[name]
	            ,ss.[name]
            ";
        }

        List<T> GetDataQuery<T>(DataTable datasource) where T : Base, new()
        {
            var list = new List<T>();
            if (list.Count == 0)
            {
                //var dataTable = datasource; //new DataAccess().GetDataTable(sql);
                foreach (DataRow data in datasource.Rows)
                {
                    var obj = new T();
                    obj.GetValueFromDataRow(data);
                    list.Add(obj);
                }
            }
            return list;
        }

        public string CreateScript(DataTable datasource)
        {            
            var result = "";
            var tableResult = "";
            foreach (var data in GetAllUdts(datasource))
            {
                tableResult = getTemplate(data); 
                result += tableResult;
            }
            return result;

        }

        public List<mUDT> GetAllUdts(DataTable datasource)
        {
            return GetDataQuery<mUDT>(datasource);

        }

        public DataTable CreateResultXml(DataTable datasource)
        {
           // ResultItemData resultItemdata = new ResultItemData();
            DataTable DTresultItem = new DataTable("ResultInfo");
            DTresultItem.Columns.Add("SchemaId", typeof(int));
            DTresultItem.Columns.Add("name", typeof(string));
            DTresultItem.Columns.Add("sqlString", typeof(string));
            DTresultItem.Columns.Add("ResultID", typeof(string));


            var tableResult = "";
            foreach (var data in GetAllUdts(datasource))
            {
                DataRow workRow = DTresultItem.NewRow();
                tableResult = getTemplate(data);
                workRow["SchemaId"] = data.SchemaID;
                workRow["name"] = data.Name;
                workRow["sqlString"] = tableResult;
                workRow["ResultID"] = tableResult.GetHashCode().ToString().Replace("-", "");
                DTresultItem.Rows.Add(workRow);

            }

            return DTresultItem;
        }

        public string getTemplate(mUDT data)
        {
            var result = "";
            var infodata = data.GetConvertedDataType();
            switch (infodata)
            {
                case "decimal":
                    result = "CREATE DOMAIN " + data.Name + " AS " + data.GetConvertedDataType() + "(" + data.Precision + "," + data.Scale + ")" + (data.IsNullable ? "" : " NOT NULL") + ";\r\n";

                    break;

                case "varchar":
                    result = "CREATE DOMAIN " + data.Name + " AS " + data.GetConvertedDataType() + "(" + data.MaxLength + ")" + (data.IsNullable ? "" : " NOT NULL") + ";\r\n";
                    break;

                default:
                    result = "CREATE DOMAIN " + data.Name + " AS " + data.GetConvertedDataType() + (data.IsNullable ? "" : " NOT NULL") + ";\r\n";
                    break;
            }
            return result;
        }

      
    }
}
