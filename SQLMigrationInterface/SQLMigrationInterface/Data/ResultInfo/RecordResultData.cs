using System;
using EasyTools.Data;

namespace SQLMigration.Data.ResultInfo
{
    public class RecordResultData : BaseData
    {
        public string schemaId { get; set; }
        public string sqlString { set; get; }

        public RecordResultData()
        {
            id = Guid.NewGuid().ToString();
            name = "";
            sqlString = "";
            schemaId = "";
            updated = DateTime.Now;
        }

        public override string ToString()
        {
            return string.Format("RecordResultData => {0}, schemaId: {1}, sqlString: {2}", base.ToString(), schemaId, sqlString);
        }
    }
}
