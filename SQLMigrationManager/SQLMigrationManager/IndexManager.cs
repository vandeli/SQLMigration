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
    public class IndexManager : IIndexManager
    {
        private readonly IDataAccess dataAccess;

        public IndexManager(IDataAccess dataAccess)
        {
            this.dataAccess = dataAccess;
        }

        public void GetSchema()
        {
            var dataconfig = dataAccess.ReadXML();
            var ds = new DataSet();
            var dt = dataAccess.GetDataTable(GetQuery());
            ds.Tables.Add(dt);
            ds.WriteXml(dataconfig.Path + "IndexSchema.xml");
            MessageBox.Show("Index sql Schema created " + dataconfig.Path + "IndexSchema.xml");
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
            MessageBox.Show("Index PGSCRIPT created " + configdata.Path + configdata.Destination);


            if (resultXML.Rows.Count != 0)
            {

                resultXML.WriteXml(configdata.Path + "Indexresult.xml", true);
                MessageBox.Show("Indexresult created " + configdata.Path + "Indexresult.xml");
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
               SELECT 
                     i.name as IndexName, 
                     o.name as TableName, 
                     ic.key_ordinal as ColumnOrder,
                     ic.is_included_column as IsIncluded, 
                     co.[name] as ColumnName
                FROM sys.indexes i 
                    join sys.objects o on i.object_id = o.object_id
                    join sys.index_columns ic on ic.object_id = i.object_id 
                    and ic.index_id = i.index_id
                    join sys.columns co on co.object_id = i.object_id 
                    and co.column_id = ic.column_id
                WHERE i.[type] = 2 
                and i.is_unique = 0 
                and i.is_primary_key = 0
                and o.[type] = 'U'
                order by o.[name], i.[name], ic.is_included_column, ic.key_ordinal
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
            var indexResult = "";
            int xs = 1;
            foreach (var data in GetAllIndex())
            {

                if (data.ColumnOrder == 1)
                {
                    indexResult = getTemplate(data, allcolumn[xs]);
                    result += indexResult;
                    xs += 1;
                }
            }
            return result;

        }

        public List<mIndex> GetAllIndex()
        {
            return GetDataQuery<mIndex>(GetQuery());

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
            foreach (var data in GetAllIndex())
            {
                if (data.ColumnOrder == 1)
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

            foreach (var totalraw in GetAllIndex())
            {
                if (totalraw.ColumnOrder == 1)
                {
                    xcount += 1;
                }
            }
            string[] allColumn = new string[xcount];

            foreach (var data in GetAllIndex())
            {
               
                if (data.ColumnOrder == 1)
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

     
        public string getTemplate(mIndex data, string allColumn)
        {
            var result = "";                  
            result = "CREATE INDEX " + data.IndexName + " ON " + data.TableName + " (" + allColumn + ");\r\n";
                     
            return result;
        }

    }
}
