using System;
using EasyTools.Data;
using System.Collections.Generic;
using System.Data;

namespace SQLMigration.Data.SchemaInfo
{
    public class RecordSchemaInfoData : BaseData
    {
        public RecordSchemaInfoData()
        {
            updated = DateTime.Now;
            id = Guid.NewGuid().ToString();
        }
       
        public string TableName { get; set; }
        public Int32 DataRow { get; set; }
      //  public DataTable listRow { get; set; }

        public override string ToString()
        {
            return string.Format("RecordSchemaInfo => {0}, TableName: {1}, DataRow: {2}",
            base.ToString(), TableName, DataRow);
        }

    }
}
