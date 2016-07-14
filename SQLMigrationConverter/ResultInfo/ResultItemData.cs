using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigrationConverter.ResultInfo
{
    public class ResultItemData
    {
        public string id { set; get; }
        public string name { set; get; }
        public string sqlString { set; get; }

        public ResultItemData()
        {
            id = "";
            name = "";
            sqlString = "";
        }
    }
}
