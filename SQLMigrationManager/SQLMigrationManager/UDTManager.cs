using SQLMigration.Data;
using SQLMigrationConverter.MapAttribut;
using SQLMigrationConverter.Template;
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
            var configdata = dataAccess.ReadXML();

            var dt = dataAccess.GetDataTable(infoQuery.GetUdts());
            ds.Tables.Add(dt);
            ds.WriteXml(configdata.Path + "UDTSchema.xml");

            MessageBox.Show("UDT sql Schema created " + configdata.Path + "UDTSchema.xml");
           }     

        public void Convert()
        {
            var configdata = dataAccess.ReadXML();

            var result = cudt.CreateScript();

            var file = configdata.Path + configdata.Destination;
           
            if (Directory.Exists(Path.GetDirectoryName(file)))
            {
                File.Delete(file);
            }
            using (var sw = File.CreateText(file))
            {
                sw.Write(result);
            }
            MessageBox.Show("UDT_pgSQL created " + configdata.Path + configdata.Destination);

        }

        public void SetConfig(SetData setdata)
        {
            var configdata = new ConfigData();
            var param = new DBData()
            {
                dbName = setdata.dbName,
                serverName = setdata.serverName,
                password = setdata.passSQL,
                userName = setdata.usernameSQL,

            };
            configdata.Destination = setdata.destination;
            configdata.Path = setdata.path;
            configdata.Id = setdata.id;
            configdata.Source = param;

            WriteConfig(configdata);
        }

        private static void WriteConfig(ConfigData configdata)
        {
            var writer = new System.Xml.Serialization.XmlSerializer(typeof(ConfigData));
            var file = File.Create(configdata.Path + "UDTConfig.xml");

            writer.Serialize(file, configdata);
            MessageBox.Show("config Data created on " + configdata.Path + "UDTConfig.xml");

            file.Close();
        }
    }
}
