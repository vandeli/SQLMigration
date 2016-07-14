using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigration.Data
{
    public  class SetData
    {
              
        public string dbName { get; set; }
        public string serverName { get; set; }
        public string usernameSQL { get; set; }
        public string passSQL { get; set; }
        public string id { get; set; }
        public string destination { get; set; }
        public string path { get; set; }
    }
}
