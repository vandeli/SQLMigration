using System;

namespace SQLMigration.Data.SchemaInfo
{
    public class UsedColumn
    {
        public string TableName { get; set; }
        public string ColumnName { get; set; }
        public Int32 OrdinalPosition { get; set; }
        public string ColumnDefault { get; set; }
        public bool isNullable { get; set; }
        public string Domain { get; set; }
        public string DataType { get; set; }
        public Int32 CharMaxLength { get; set; }
        public Int32 Precision { get; set; }
        public Int32 Scale { get; set; }
    }
}
