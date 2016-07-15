using SQLMigration.Data;
using SQLMigrationConstants;
using SQLMigrationConverter.MapAttribut;
using SQLMigrationConverter.Template;
using SQLMigrationInterface;
using System.Data;
using System.IO;
using System.Windows.Forms;

namespace SQLMigrationManager
{
    public class PKManager : IPKManager
    {
        private readonly IcPK cpk;
        private readonly IDataAccess dataAccess;

        public PKManager(IDataAccess dataAccess, IcPK cpk)
        {
            this.dataAccess = dataAccess;
            this.cpk = cpk;

        }
        public void Convert()
        {
            var configdata = dataAccess.ReadXML();
            var result = cpk.CreateScript();
            DataTable resultXML = cpk.CreateResultXml();
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
            var ds = new DataSet();
            var infoQuery = new InfoQuery();
            var dt = dataAccess.GetDataTable(infoQuery.GetTablesPKs());
            ds.Tables.Add(dt);
            ds.WriteXml(GlobalConstant.configPath + "PKSchema.xml");

            MessageBox.Show("PK sql Schema created " + GlobalConstant.configPath + "PKSchema.xml");
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
    }
}
