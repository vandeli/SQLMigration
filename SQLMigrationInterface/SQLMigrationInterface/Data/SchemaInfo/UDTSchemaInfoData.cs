using System;
using EasyTools.Interface.Data;

namespace SQLMigration.Interface.Data.SchemaInfo
{
    public class UDTSchemaInfoData : BaseData
    {
        public UDTSchemaInfoData()
        {
            updated = string.Format("{0:dd/MM/yyy HH:mm:ss}", DateTime.Now);
            id = Guid.NewGuid().ToString(); 

        }


        public string DataType { get; set; }
        public int MaxLength { get; set; }
        public byte Precision { get; set; }
        public int Scale { get; set; }
        public bool IsNullable { get; set; }


    }
}
