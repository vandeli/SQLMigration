using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigration.Data
{
    public abstract class BaseData
    {
        public string rowKey { get; set; }
        public string name { get; set; }
        public DateTime updated { get; set; }
    }
}
