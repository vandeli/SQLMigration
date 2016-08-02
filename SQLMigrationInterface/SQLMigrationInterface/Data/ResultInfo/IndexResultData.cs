using System;
using EasyTools.Data;

namespace SQLMigration.Data.ResultInfo
{
    public class IndexResultData : BaseData
    {
        public string schemaId { get; set; }
        public string sqlString { set; get; }

        public IndexResultData()
        {
            id = Guid.NewGuid().ToString();
            name = "";
            sqlString = "";
            schemaId = "";
            updated = DateTime.Now;
        }

        public override string ToString()
        {
            return string.Format("IndexResultData => {0}, schemaId: {1}, sqlString: {2}", base.ToString(), schemaId, sqlString);
        }

    }
}
