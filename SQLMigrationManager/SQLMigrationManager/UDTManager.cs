using SQLMigration.Data;
using SQLMigrationConverter.MapAttribut;
using SQLMigrationConverter.Template;
using SQLMigrationConstants;
using SQLMigrationInterface;
using System.Data;
using System.IO;
using System.Windows.Forms;

namespace SQLMigrationManager
{

  public class UDTManager : IUDTManager
  {
    private readonly IcUDT cudt;
    private readonly IDataAccess dataAccess;

    public UDTManager(IDataAccess dataAccess, IcUDT cudt)
    {
      this.dataAccess = dataAccess;
      this.cudt = cudt;

    }
        public void GetSchema() 
        {
            var ds = new DataSet();
            var infoQuery = new InfoQuery();          
            var dt = dataAccess.GetDataTable(infoQuery.GetUdts());
            ds.Tables.Add(dt);
            ds.WriteXml(GlobalConstant.configPath + "UDTSchema.xml");

            MessageBox.Show("UDT sql Schema created " + GlobalConstant.configPath + "UDTSchema.xml");
           }     

        public void Convert()
        {
            DataTable resultXML = cudt.CreateResultXml();
            var configdata = dataAccess.ReadXML();
            var result = cudt.CreateScript();
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
            var file = File.Create(configdata.Path + "Config.xml");

            writer.Serialize(file, configdata);
            MessageBox.Show("config Data created on " + configdata.Path + "Config.xml");

            file.Close();
        }
    }
}
