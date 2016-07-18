using SQLMigration.Data;
using SQLMigrationInterface;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Windows.Forms;



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
            ds.WriteXml(dataconfig.Path + "PKSchema.xml");
            MessageBox.Show("PK sql Schema created " + dataconfig.Path + "PKSchema.xml");
        }

        public void Convert()
        {
            throw new System.NotImplementedException();
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
            var file = File.Create(configdata.Path + "Config.xml");

            writer.Serialize(file, configdata);
            MessageBox.Show("config Data created on " + configdata.Path + "Config.xml");

            file.Close();
        }

        private string GetQuery()
        {
            return @"
            SELECT a.table_name
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

       
    }
}
