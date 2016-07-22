using SQLMigration.Data;
using SQLMigrationConverter.MapAttribut;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigrationConverter.SchemaInfo
{
    public class UDTSchemaInfoData : BaseData
    {
        public UDTSchemaInfoData()
        {
            updated = DateTime.Now;
            rowKey = SchemaID.ToString();
        }
        public int SchemaID { get; set; }
        public string Name { get; set; }
        public string DataType { get; set; }
        public int MaxLength { get; set; }
        public byte Precision { get; set; }
        public int Scale { get; set; }
        public bool IsNullable { get; set; }

       
    }
}
