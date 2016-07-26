using System;
using EasyTools.Data;

namespace SQLMigration.Data.ResultInfo
{
    public class UDTResultData : BaseData
    {
        public string schemaId { get; set; }
        public string sqlString { set; get; }

        public UDTResultData()
        {
            id = Guid.NewGuid().ToString(); 
            name = "";
            sqlString = "";
            schemaId = "";
            updated =DateTime.Now;
        }

        public override string ToString()
        {
            return string.Format("UDTResultData => {0}, schemaId: {1}, sqlString: {2}", base.ToString(), schemaId, sqlString);
        }
    }
}
