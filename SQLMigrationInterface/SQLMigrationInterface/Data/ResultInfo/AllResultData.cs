using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigration.Data.ResultInfo
{
    public class AllResultData
    {
        public List<UDTResultData> listUDTResultInfo { get; set; }
        public List<TableResultData> listTableResultInfo { get; set; }

        public AllResultData()
        {
            listUDTResultInfo = new List<UDTResultData>();
            listTableResultInfo = new List<TableResultData>();
        }

        public override string ToString()
        {
            return string.Format("AllResultData => {0}, listUDTResultInfo: {1}, listTableResultInfo: {2}", base.ToString(), listUDTResultInfo, listTableResultInfo);
        }
    }
}
