using SQLMigrationConverter.mapper;
using System;
using System.Data;

namespace SQLMigrationConverter.MapAttribut
{
    public class mIndex : Base
    {
        public mIndex() : base() { }
        public int SchemaID { get; set; }
        public string IndexName { get; set; } 
        public string TableName { get; set; }   
        public int ColumnOrder { get; set; } 
        public int IsIncluded { get; set; } 
        public string ColumnName { get; set; }

        public override TablesFieldDataType GetDataType()
        {
           // var result = new TablesFieldDataType();
            //result.DataType = this.DataType;

            //if (this.CharMaxLength != 0)
            //    result.DataTypeSuffix = this.DataType + "(" + this.CharMaxLength + ")";
            //if (this.Precision != 0)
            //    result.DataTypeSuffix = this.DataType + "(" + this.Precision + "," + this.Scale + ")";
            //else
            //    result.DataTypeSuffix = this.DataType + "(" + this.CharMaxLength + ")";

            return null;
        }

        public override void GetValueFromDataRow(DataRow dataRow)
        {
            SchemaID = System.Convert.ToInt32(String.IsNullOrEmpty(
              dataRow["SchemaID"].ToString())
              ? 0
              : dataRow["SchemaID"]);
            IndexName = dataRow["IndexName"].ToString();
            TableName = dataRow["TableName"].ToString();
            ColumnName = dataRow["ColumnName"].ToString();
            ColumnOrder = System.Convert.ToInt32(String.IsNullOrEmpty(
                dataRow["ColumnOrder"].ToString())
                ? 0
                : dataRow["ColumnOrder"]);

            IsIncluded = System.Convert.ToInt32(String.IsNullOrEmpty(
                dataRow["IsIncluded"].ToString())
                ? 0
                : dataRow["IsIncluded"]);
          
        }
    }
}
