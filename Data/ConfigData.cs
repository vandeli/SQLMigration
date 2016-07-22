using System;

namespace SQLMigration.Data
{

    public class ConfigData : BaseData
    {
        public ConfigData()
        {
            updated = DateTime.Now;
        }
        public string Destination { get; set; }
        public string Path { get; set; }
        public string Id { get; set; }
        public DBData Source { get; set; }  
              
    }
}
