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
            updated = string.Format("{0:dd/MM/yyy HH:mm:ss}", DateTime.Now);
        }

        public override string ToString()
        {
            return string.Format("{0}, schemaId: {1}, sqlString: {2}", base.ToString(), schemaId, sqlString);
        }
    }
}
