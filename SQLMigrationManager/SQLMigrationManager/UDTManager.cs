using SQLMigration.Data;
using SQLMigrationConverter.MapAttribut;
using SQLMigrationInterface;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Windows.Forms;

namespace SQLMigrationManager
{

    public class UDTManager : IUDTManager
  {
        
       
        private readonly IDataAccess dataAccess;

        public UDTManager(IDataAccess dataAccess)
    {
      this.dataAccess = dataAccess;
   

    }
        public void GetSchema() 
        {
            var dataconfig = dataAccess.ReadXML();
            var ds = new DataSet();
            var infoQuery = new InfoQuery();          
            var dt = dataAccess.GetDataTable(infoQuery.GetUdts());
            ds.Tables.Add(dt);
            ds.WriteXml(dataconfig.Path + "UDTSchema.xml");

            MessageBox.Show("UDT sql Schema created " + dataconfig.Path + "UDTSchema.xml");
           }     

        public void Convert()
        {
            DataTable resultXML = CreateResultXml();
            var configdata = dataAccess.ReadXML();
            var result = CreateScript();
            var fileQuery = configdata.Path + configdata.Destination;
           
           
            if (Directory.Exists(Path.GetDirectoryName(fileQuery)))
            {
                File.Delete(fileQuery);
            }
            using (var sw = File.CreateText(fileQuery))
            {
                sw.Write(result);
            }
            MessageBox.Show("UDT PGSCRIPT created " + configdata.Path + configdata.Destination);


            if (resultXML.Rows.Count != 0)
            {
                               
                resultXML.WriteXml(configdata.Path + "UDTresult.xml", true);
                MessageBox.Show("UDTresult created " + configdata.Path + "UDTresult.xml");
            }

        }

        public void SetConfig(ConfigData configdata)
        {

            var param = new DBData();
                param = configdata.Source;
                      
            configdata.Source = param;
            WriteConfig(configdata);
        }

        private static void WriteConfig(ConfigData configdata)
        {
            var writer = new System.Xml.Serialization.XmlSerializer(typeof(ConfigData));
            var file = File.Create("Config.xml");

            writer.Serialize(file, configdata);
            file.Close();
        }

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

        List<T> GetDataQuery<T>(string sql) where T : Base, new()
        {
            var list = new List<T>();
            if (list.Count == 0)
            {
                var dataTable = new DataAccess().GetDataTable(sql);
                foreach (DataRow data in dataTable.Rows)
                {
                    var obj = new T();
                    obj.GetValueFromDataRow(data);
                    list.Add(obj);
                }
            }
            return list;
        }

        public string CreateScript()
        {
            
            var result = "";
            var tableResult = "";
            foreach (var data in GetAllUdts())
            {
                tableResult = getTemplate(data); 
                result += tableResult;
            }
            return result;

        }

        public List<mUDT> GetAllUdts()
        {
            return GetDataQuery<mUDT>(GetQuery());

        }

        public DataTable CreateResultXml()
        {
           // ResultItemData resultItemdata = new ResultItemData();
            DataTable DTresultItem = new DataTable("ResultInfo");

            DTresultItem.Columns.Add("SchemaId", typeof(int));
            DTresultItem.Columns.Add("name", typeof(string));
            DTresultItem.Columns.Add("sqlString", typeof(string));
            DTresultItem.Columns.Add("ResultID", typeof(string));


            var tableResult = "";
            foreach (var data in GetAllUdts())
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
