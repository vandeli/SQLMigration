using System;
using EasyTools.Data;
using System.Collections.Generic;

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
        public List<UsedColumn> usedColumnList { get; set; }

        public override string ToString()
        {
            return string.Format("IndexSchemaInfo => {0}, IndexName: {1}, TableName: {2}, ColumnName: {3}",
                base.ToString(), IndexName, TableName, usedColumnList);
        }


    }
}
