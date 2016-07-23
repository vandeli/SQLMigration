using SQLMigration.Data;
using System;

namespace SQLMigrationConverter.ResultInfo
{
    public class UDTResultData : BaseData
    {

        public string name { set; get; }
        public string sqlString { set; get; }

        public UDTResultData()
        {
            id = DateTime.Now.GetHashCode().ToString();
            name = "";
            sqlString = "";
        }
    }
}
