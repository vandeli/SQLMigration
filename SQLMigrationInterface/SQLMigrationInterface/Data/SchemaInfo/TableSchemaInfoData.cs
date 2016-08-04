using EasyTools.Data;
using System;
using System.Collections.Generic;

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
        public List<UsedColumn> usedColumnList { get; set; }

        public override string ToString()
        {
            return string.Format("TableSchemaInfoData => {0}, TableName: {1}, ColumnName: {2}",
                 base.ToString(), TableName, usedColumnList);
        }
    }
}
