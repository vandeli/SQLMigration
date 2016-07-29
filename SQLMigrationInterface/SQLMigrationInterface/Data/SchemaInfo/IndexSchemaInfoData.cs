using System;
using EasyTools.Data;

namespace SQLMigration.Data.SchemaInfo
{
    public class IndexSchemaInfoData : BaseData
    {
        public IndexSchemaInfoData()
        {
            updated = DateTime.Now;
            id = Guid.NewGuid().ToString();
        }

        public string IndexName { get; set; }
        public string TableName { get; set; }
        public int ColumnOrder { get; set; }
        public int IsIncluded { get; set; }
        public string ColumnName { get; set; }

        public override string ToString()
        {
            return string.Format("IndexSchemaInfo => {0}, IndexName: {1}, TableName: {2}, ColumnOrder: {3}, IsIncluded: {4}, ColumnName: {5}",
                base.ToString(), IndexName, TableName, ColumnOrder, IsIncluded, ColumnName);
        }


    }
}
