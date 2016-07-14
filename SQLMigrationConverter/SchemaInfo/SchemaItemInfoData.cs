using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigrationConverter.SchemaInfo
{
    public class UDTSchemaItemInfoData
    {
        public string length1 { set; get; }
        public string length2 { set; get; }
        public string originType { set; get; }
        public string udtName { set; get; }

        public UDTSchemaItemInfoData()
        {
            length1 = "";
            length2 = "";
            originType = "";
            udtName = "";
        }
    }
}
