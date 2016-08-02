using EasyTools.Data;
using System;

namespace SQLMigration.Data.ResultInfo
{
    public class PKResultData : BaseData
    {
        public string schemaId { get; set; }
        public string sqlString { set; get; }

        public PKResultData()
        {
            id = Guid.NewGuid().ToString();
            name = "";
            sqlString = "";
            schemaId = "";
            updated = DateTime.Now;
        }

        public override string ToString()
        {
            return string.Format("PKResultData => {0}, schemaId: {1}, sqlString: {2}", base.ToString(), schemaId, sqlString);
        }
    }
}
