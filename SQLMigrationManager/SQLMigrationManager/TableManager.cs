using System.IO;
using System.Windows.Forms;
using SQLMigration.Data;
using SQLMigrationInterface;

namespace SQLMigrationManager
{
    public class TableManager : IManager
    {
        public void GetSchema()
        {
            throw new System.NotImplementedException();
        }

        public void Convert()
        {
            throw new System.NotImplementedException();
        }

        public void SetConfig(SetData setData)
        {
            var configdata = new ConfigData();
            var param = new DBData()
            {
                dbName = setData.dbName,
                serverName = setData.serverName,
                password = setData.passSQL,
                userName = setData.usernameSQL,

            };
            configdata.Destination = setData.destination;
            configdata.Path = setData.path;
            configdata.Id = setData.id;
            configdata.Source = param;

            WriteConfig(configdata);
        }

        private static void WriteConfig(ConfigData configdata)
        {
            var getdata = new ConfigData
            {
                Destination = configdata.Destination,
                Id = configdata.Id,
                Source = configdata.Source,
                Path = configdata.Path
            };

            var writer = new System.Xml.Serialization.XmlSerializer(typeof(ConfigData));
            var file = File.Create(getdata.Path + "TableConfig.xml");

            writer.Serialize(file, getdata);
            MessageBox.Show("config Data created on " + getdata.Path + "TableConfig.xml");

            file.Close();
        }
    }
}
