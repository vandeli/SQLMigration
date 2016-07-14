using SQLMigrationConverter.mapper;
using System;
using System.Data;

namespace SQLMigrationConverter.MapAttribut
{
    public class mPK : Base
    {
        public mPK() : base() { }

        public string PkName { get; set; }
        public string TableName { get; set; }
        public string ColumnName { get; set; }
        public int OrdinalPosition { get; set; }

        public override TablesFieldDataType GetDataType() {
           // var result = new TablesFieldDataType();
            return null;
        }

        public override void GetValueFromDataRow(DataRow dataRow)
        {
            PkName = dataRow["PK_Name"].ToString();
            TableName = dataRow["TABLE_NAME"].ToString();
            ColumnName = dataRow["COLUMN_NAME"].ToString();
            OrdinalPosition = System.Convert.ToInt32(String.IsNullOrEmpty(
                dataRow["ORDINAL_POSITION"].ToString())
                ? 0
                : dataRow["ORDINAL_POSITION"]);

        }
    }
}
