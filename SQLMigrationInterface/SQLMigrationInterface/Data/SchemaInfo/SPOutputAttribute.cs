using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigration.Data.SchemaInfo
{
    public class SPOutputAttribute
    {
        public string ProcName { get; set; }
        public string Name { get; set; }
        public Int32 Sequence { get; set; }
        public bool IsNullable { get; set; }
        public string DomainName { get; set; }
        public string TypeName { get; set; }
        public Int32 MaxLength { get; set; }
        public Int32 Precision { get; set; }
        public Int32 Scale { get; set; }
        bool _isVoid;
        public bool IsVoid { get { return _isVoid; } }
        public void GetValueFromDataRow(DataRow dataRow)
        {
            _isVoid = !String.IsNullOrEmpty(dataRow["user_type_name"].ToString());
            if (!_isVoid)
            {
              //  ProcName = dataRow["proc_name"].ToString();
                Name = dataRow["name"].GetType() == typeof(DBNull) ? "" : dataRow["name"].ToString();
                Sequence = System.Convert.ToInt32(dataRow["column_ordinal"].GetType() == typeof(DBNull) ? 0 : dataRow["column_ordinal"]);
              //  IsNullable = System.Convert.ToBoolean(dataRow["is_nullable"]);
                DomainName = (String.IsNullOrEmpty(dataRow["user_type_name"].ToString()) ? "" : dataRow["user_type_name"]).ToString();
                TypeName = dataRow["system_type_name"].GetType() == typeof(DBNull) ? "" : dataRow["system_type_name"].ToString();
                MaxLength = System.Convert.ToInt32(dataRow["max_length"].GetType() == typeof(DBNull) ? 0 : dataRow["max_length"]);
                Precision = System.Convert.ToInt32(dataRow["precision"].GetType() == typeof(DBNull) ? 0 : dataRow["precision"]);
                Scale = System.Convert.ToInt32(dataRow["scale"].GetType() == typeof(DBNull) ? 0 : dataRow["scale"]);
                              
            }
        }
    }
}
