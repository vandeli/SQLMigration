using SQLMigrationConverter.mapper;
using System;
using System.Data;

namespace SQLMigrationConverter.MapAttribut
{
    public class mUDT : Base
    {
        public mUDT() : base() { }

        public int SchemaID { get; set; }
        public string Name { get; set; }
        public string DataType { get; set; }
        public int MaxLength { get; set; }
        public byte Precision { get; set; }
        public int Scale { get; set; }
        public bool IsNullable { get; set; }

        public override TablesFieldDataType GetDataType()
        {
            var result = new TablesFieldDataType();
            result.DataType = this.DataType;

            //if (this.MaxLength != 0)
            //    result.DataTypeSuffix = this.DataType + "(" + this.MaxLength + ")";
            if (this.Precision != 0)
                result.DataTypeSuffix = this.DataType + "(" + this.Precision + "," + this.Scale + ")";
            else
                result.DataTypeSuffix = this.DataType + "(" + this.MaxLength + ")";

            return result;
        }

        public override void GetValueFromDataRow(DataRow dataRow)
        {  
            SchemaID = System.Convert.ToInt32(String.IsNullOrEmpty(
                dataRow["SchemaID"].ToString())
                ? 0
                : dataRow["SchemaID"]);
            Name = dataRow["name"].ToString();
            MaxLength = System.Convert.ToInt32(String.IsNullOrEmpty(
                dataRow["max_length"].ToString())
                ? 0
                : dataRow["max_length"]);
            IsNullable = (dataRow["is_nullable"].ToString() == "YES");
            DataType = (String.IsNullOrEmpty(
                dataRow["data_type"].ToString())
                ? ""
                : dataRow["data_type"]).ToString();
            Precision = System.Convert.ToByte(String.IsNullOrEmpty(
                dataRow["precision"].ToString())
                ? "0"
                : dataRow["precision"]);
            Scale = System.Convert.ToInt32(String.IsNullOrEmpty(
                dataRow["scale"].ToString())
                ? "0"
                : dataRow["scale"]);
        }
    }
}

