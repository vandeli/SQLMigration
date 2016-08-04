using EasyTools.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigration.Data.SchemaInfo
{
    public class SPSchemaInfoData : BaseData
    {
        public SPSchemaInfoData()
        {
            updated = DateTime.Now;
            id = Guid.NewGuid().ToString();
        }


        public string SPName { get; set; }
        public string SqlCode { get; set; }
        public List<UsedParameter> usedParameterList { get; set; }
        public List<SPOutputAttribute> SPOutputList { get; set; }

        public override string ToString()
        {
            return string.Format("TableSchemaInfoData => {0}, TableName: {1}, ColumnName: {2}",
                 base.ToString(), SPName, usedParameterList);
        }
    }
}
