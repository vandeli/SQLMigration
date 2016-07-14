using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigrationConverter.mapper
{
    public class TablesFieldDataType
    {
        public string DataType { get; set; }
        public string DataTypeSuffix { get; set; }
        public string ConvertedDataType { get; set; }
        public string ConvertedDataTypeSuffix { get; set; }
        public string DomainName { get; set; }
    }
}
