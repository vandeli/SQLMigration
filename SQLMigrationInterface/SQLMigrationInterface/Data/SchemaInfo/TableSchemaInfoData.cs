using EasyTools.Data;
using System;

namespace SQLMigration.Data.SchemaInfo
{
    public class TableSchemaInfoData : BaseData
    {
        public TableSchemaInfoData()
        {
            updated = DateTime.Now;
            id = Guid.NewGuid().ToString();
        }


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

        public override string ToString()
        {
            return string.Format("TableSchemaInfoData => {0}, TableName: {1}, ColumnName: {2}, OrdinalPosition: {3}, ColumnDefault: {4}, isNullable: {5}, Domain: {6}, DataType: {7}, CharMaxLength: {8}, Precision: {9}, Scale: {10}",
                 base.ToString(), TableName, ColumnName, OrdinalPosition, ColumnDefault, isNullable, Domain, DataType, CharMaxLength, Precision, Scale);
        }
    }
}
