using EasyTools.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigration.Data.SchemaInfo
{
    public class FunctionSchemaInfoData : BaseData
    {
        public FunctionSchemaInfoData()
        {
            updated = DateTime.Now;
            id = Guid.NewGuid().ToString();
        }
        public string FnName { get; set; }
        public string SqlCode { get; set; }
        public List<UsedParameter> usedParameterList { get; set; }

        public override string ToString()
        {
            return string.Format("FunctionSchemaInfoData => {0}, FunctionName: {1}, Parameter: {2}",
                 base.ToString(), FnName, usedParameterList);
        }
    }
    
    
}
