using SQLMigration.Data;
using System;

namespace SQLMigrationConverter.ResultInfo
{
    public class UDTResultData : BaseData
    {
        public string schemaId { get; set; }
        public string sqlString { set; get; }

        public UDTResultData()
        {
            id = DateTime.Now.GetHashCode().ToString();
            name = "";
            sqlString = "";
            schemaId = "";
            updated = DateTime.Now;
        }
    }
}
