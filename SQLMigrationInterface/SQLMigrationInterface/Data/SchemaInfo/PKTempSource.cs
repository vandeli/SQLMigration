using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigration.Data.SchemaInfo
{
    public class PKTempSource
    {
        public string PkName { get; set; }
        public string TableName { get; set; }
        public string ColumnName { get; set; }
        public int OrdinalPosition { get; set; }
    }
}
