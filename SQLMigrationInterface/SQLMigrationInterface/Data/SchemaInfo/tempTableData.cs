using EasyTools.Data;
using System;


namespace SQLMigration.Data.SchemaInfo
{
    public class tempTableData : BaseData
    {
        public tempTableData()
        {
            updated = DateTime.Now;
            id = Guid.NewGuid().ToString();
            
        }

        public string AllTableName { get; set; }
        public string AllColumnName { get; set; }
      

    }
}
