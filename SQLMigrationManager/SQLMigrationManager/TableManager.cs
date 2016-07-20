using SQLMigration.Data;
using SQLMigrationConverter.MapAttribut;
using SQLMigrationInterface;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Windows.Forms;
using System;

namespace SQLMigrationManager
{
    public class TableManager : ITableManager
    {
      
        private readonly IDataAccess dataAccess;

        public TableManager(IDataAccess dataAccess)
        {
            this.dataAccess = dataAccess;
            

        }

        public void GetSchema()
        {
            var dataconfig = dataAccess.ReadXML();
            var ds = new DataSet();         
            var dt = dataAccess.GetDataTable(GetQuery());
            ds.Tables.Add(dt);
            ds.WriteXml(dataconfig.Path + "TableSchema.xml");
            MessageBox.Show("Table sql Schema created " + dataconfig.Path + "TableSchema.xml");
        }

        public void Convert()
        {
           
            var configdata = dataAccess.ReadXML();
            var result = CreateScript();
            DataTable resultXML = CreateResultXml();
            var fileQuery = configdata.Path + configdata.Destination;


            if (Directory.Exists(Path.GetDirectoryName(fileQuery)))
            {
                File.Delete(fileQuery);
            }
            using (var sw = File.CreateText(fileQuery))
            {
                sw.Write(result);
            }
            MessageBox.Show("Table PGSCRIPT created " + configdata.Path + configdata.Destination);


            if (resultXML.Rows.Count != 0)
            {

                resultXML.WriteXml(configdata.Path + "Tableresult.xml", true);
                MessageBox.Show("Tableresult created " + configdata.Path + "Tableresult.xml");
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
            SELECT a.TABLE_NAME
	            ,a.COLUMN_NAME
	            ,a.ORDINAL_POSITION
	            ,a.COLUMN_DEFAULT
	            ,a.IS_NULLABLE
	            ,a.DOMAIN_NAME
	            ,a.DATA_TYPE
	            ,a.CHARACTER_MAXIMUM_LENGTH
	            ,a.NUMERIC_PRECISION
	            ,a.NUMERIC_SCALE
            FROM INFORMATION_SCHEMA.columns a
            JOIN INFORMATION_SCHEMA.Tables b ON a.TABLE_NAME = b.TABLE_NAME
            WHERE TABLE_TYPE = 'BASE TABLE'
            ORDER BY table_name
	            ,ORDINAL_POSITION
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
            
            string[] allcolumn = getAllcolumn();
            var result = "";
            var tableResult = "";
            int xs = 1;
            foreach (var data in GetAllTable())
            {

                if (data.OrdinalPosition == 1)
                {
                
                    tableResult = getTemplate(data,allcolumn[xs]);
                    result += tableResult;
                    xs += 1;
                }
            }
            return result;

        }

        public List<mTable> GetAllTable()
        {
            return GetDataQuery<mTable>(GetQuery());

        }

        public DataTable CreateResultXml()
        {
          
            DataTable DTresultItem = new DataTable("ResultInfo");

            DTresultItem.Columns.Add("SchemaId", typeof(int));
            DTresultItem.Columns.Add("name", typeof(string));
            DTresultItem.Columns.Add("sqlString", typeof(string));
            DTresultItem.Columns.Add("ResultID", typeof(string));
            string[] allcolumn = getAllcolumn();
             int xs = 1;

            var tableResult = "";
            foreach (var data in GetAllTable())
            {
                if (data.OrdinalPosition == 1)
                {                    
                    DataRow workRow = DTresultItem.NewRow();
                    tableResult = getTemplate(data, allcolumn[xs]);
                    workRow["SchemaId"] = data.SchemaID;
                    workRow["name"] = data.TableName;
                    workRow["sqlString"] = tableResult;
                    workRow["ResultID"] = tableResult.GetHashCode().ToString().Replace("-", "");
                    DTresultItem.Rows.Add(workRow);
                    xs += 1;
                }
                
            }

            return DTresultItem;
        }

        private string[] getAllcolumn()
        {
            int xs = 0;
            int xcount = 1;
            
            foreach (var totalraw in GetAllTable())
            {
                if (totalraw.OrdinalPosition == 1)
                {
                    xcount += 1;                    
                }
            }
            string[] allColumn = new string[xcount];

            foreach (var data in GetAllTable())
            {
               // var setData = data.GetConvertedDataType();

                if (data.OrdinalPosition == 1)
                {
                    xs += 1;
                  //  cekSuffix(data);
                    allColumn[xs] = data.ColumnName + " " + cekSuffix(data) ;
                    
                }
                else
                {
                    allColumn[xs] += ",\n " + data.ColumnName + "   " + cekSuffix(data);
                }

            }

            return allColumn;
        }

        private string cekSuffix(mTable data)
        {
            var cekResult = "";
            if (data.Domain != "")
            {
                cekResult = data.Domain;
            }
            else 
            {
                cekResult = data.GetConvertedDataType();
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

        public string getTemplate(mTable data, string allColumn)
        {
            var result = "";
            var infodata = data.GetConvertedDataType();

            //==========================================

            result = "CREATE TABLE " + data.TableName + "(\n" +
                      allColumn + "\n" +                        
                      ");\r\n";
            
            
            return result;
        }

    }
}
