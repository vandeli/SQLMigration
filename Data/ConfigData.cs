using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigration.Data
{
   
    public class ConfigData
    {
        public string Destination { get; set; }
        public string Path { get; set; }
        public string Id { get; set; }
        public DBData Source { get; set; }
        
    }
}
