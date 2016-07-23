using SQLMigration.Data;
using System;

namespace SQLMigrationConverter.SchemaInfo
{
    public class UDTSchemaInfoData : BaseData
    {
        public UDTSchemaInfoData()
        {
            updated = DateTime.Now;
            id = DateTime.Now.GetHashCode().ToString();

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
