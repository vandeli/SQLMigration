using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigrationConverter.ResultInfo
{
    public class ResultItemData
    {
        public int SourceId { set; get; }
        public int ResultID { set; get; }
        public string name { set; get; }
        public string sqlString { set; get; }

        public ResultItemData()
        {
            SourceId = 0;
            ResultID = 0;
            name = "";
            sqlString = "";
        }
    }
}
