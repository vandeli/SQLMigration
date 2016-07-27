using EasyTools.Data;
using System;

namespace SQLMigration.Data.ResultInfo
{
    public class TableResultData : BaseData
    {
        public string schemaId { get; set; }
        public string sqlString { get; set; }

        public TableResultData()
        {
            id = Guid.NewGuid().ToString();
            name = "";
            sqlString = "";
            schemaId = "";
            updated = DateTime.Now;
        }

        public override string ToString()
        {
            return string.Format("TableResultData => {0}, schemaId: {1}, sqlString: {2}", base.ToString(), schemaId, sqlString);
        }
    }
}
