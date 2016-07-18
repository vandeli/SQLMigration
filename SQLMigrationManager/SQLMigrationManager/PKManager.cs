using SQLMigration.Data;
using SQLMigrationConverter.MapAttribut;
using SQLMigrationInterface;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Windows.Forms;

namespace SQLMigrationManager
{
    public class PKManager : IPKManager
    {
      
        private readonly IDataAccess dataAccess;

        public PKManager(IDataAccess dataAccess)
        {
            this.dataAccess = dataAccess;
           

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
            MessageBox.Show("PK PGSCRIPT created " + configdata.Path + configdata.Destination);


            if (resultXML.Rows.Count != 0)
            {
                resultXML.WriteXml(configdata.Path + "PKresult.xml", true);
                MessageBox.Show("PKresult created " + configdata.Path + "PKresult.xml");
            }
        }

        public void GetSchema()
        {
            var dataconfig= dataAccess.ReadXML();
            var ds = new DataSet();
            var dt = dataAccess.GetDataTable(GetQuery());
            ds.Tables.Add(dt);
            ds.WriteXml(dataconfig.Path + "PKSchema.xml");
            MessageBox.Show("PK sql Schema created " + dataconfig.Path + "PKSchema.xml");
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
            SELECT CONSTRAINT_NAME AS PK_Name
	            ,TABLE_NAME
	            ,COLUMN_NAME
	            ,ORDINAL_POSITION
            FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE b
            JOIN (
	            SELECT NAME
	            FROM sysobjects a
	            WHERE xtype = 'pk'
		            AND parent_obj IN (
			            SELECT id
			            FROM sysobjects
			            WHERE xtype = 'U'
			            )
	            ) a ON a.NAME = b.CONSTRAINT_NAME
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
            string[] allcolumn = new string[1000];
            var result = "";
            var tableResult = "";
            allcolumn = getAllcolumn();
            int xs = 0;
            foreach (var data in GetAllPk())
            {
                if (data.OrdinalPosition == 1)
                {
                    xs += 1;
                    tableResult = getTemplate(data, allcolumn[xs]);
                    result += tableResult;
                }
            }
            return result;
        }

        public List<mPK> GetAllPk()
        {
            return GetDataQuery<mPK>(GetQuery());

        }

        private string[] getAllcolumn()
        {

            string[] allColumn = new string[1000];
            int xs = 0;

            foreach (var data in GetAllPk())
            {
                if (data.OrdinalPosition == 1)
                {
                    xs += 1;
                    allColumn[xs] = data.ColumnName;
                }
                else
                {
                    allColumn[xs] += "," + data.ColumnName;
                }

            }
            return allColumn;
        }

        public DataTable CreateResultXml()
        {
          //  ResultItemData resultItemdata = new ResultItemData();
            DataTable DTresultItem = new DataTable("ResultInfo");
            DTresultItem.Columns.Add("SchemaId", typeof(int));
            DTresultItem.Columns.Add("name", typeof(string));
            DTresultItem.Columns.Add("sqlString", typeof(string));
            DTresultItem.Columns.Add("ResultID", typeof(string));

            string[] allcolumn = getAllcolumn();
            int xs = 1;

            var tableResult = "";
            foreach (var data in GetAllPk())
            {
                if (data.OrdinalPosition == 1)
                {
                    DataRow workRow = DTresultItem.NewRow();
                    tableResult = getTemplate(data, allcolumn[xs]);
                    workRow["SchemaId"] = data.SchemaID;
                    workRow["name"] = data.PkName;
                    workRow["sqlString"] = tableResult;
                    workRow["ResultID"] = tableResult.GetHashCode().ToString().Replace("-", "");
                    DTresultItem.Rows.Add(workRow);
                    xs = xs++;
                }
            }
            return DTresultItem;
        }

        public string getTemplate(mPK data, string allcolumn)
        {
            var result = "";
            result = "ALTER TABLE " + data.TableName + " ADD CONSTRAINT " + data.PkName + " PRIMARY KEY" + "(" + allcolumn + ")" + ";\r\n";
            return result;
        }
    }
}
