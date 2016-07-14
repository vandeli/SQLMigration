using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigrationConverter.ResultInfo
{
    public class ResultData
    {
        public string id { set; get; }
        public string tag { set; get; }

        public ResultData()
        {
            id = "";
            tag = "";
        }
    }
}
