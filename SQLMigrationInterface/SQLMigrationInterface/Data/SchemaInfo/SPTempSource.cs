using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigration.Data.SchemaInfo
{
    public class SPTempSource
    {
        public string SPName { get; set; }
        public Int32 ParameterNumber { get; set; }
        public string ParameterName { get; set; }
        public string DataType { get; set; }
        public string DomainType { get; set; }
        public Int32 ParameterMaxBytes { get; set; }      

    }
}
