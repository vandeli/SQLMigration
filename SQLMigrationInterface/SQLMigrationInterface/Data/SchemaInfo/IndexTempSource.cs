using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigration.Data.SchemaInfo
{
    public class IndexTempSource
    {
        public string IndexName { get; set; }
        public string TableName { get; set; }
        public int ColumnOrder { get; set; }
        public int IsIncluded { get; set; }
        public string ColumnName { get; set; }
    }
}
