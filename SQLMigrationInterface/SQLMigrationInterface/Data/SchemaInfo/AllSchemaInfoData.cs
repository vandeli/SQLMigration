using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigration.Data.SchemaInfo
{
    public class AllSchemaInfoData
    {
        public AllSchemaInfoData()
        {
            listUDTSchemaInfo = new List<UDTSchemaInfoData>();           
            listTableSchemaInfo = new List<TableSchemaInfoData>();

        }

        public List<UDTSchemaInfoData> listUDTSchemaInfo { get; set; }  
        public List<TableSchemaInfoData> listTableSchemaInfo { get; set; }


        public override string ToString()
        {
            return string.Format("AllSchemaInfo => {0}, listUDTSchemaInfo: {1}, listTableSchemaInfo: {2}",
                base.ToString(), listUDTSchemaInfo, listTableSchemaInfo);
        }
    }
}
