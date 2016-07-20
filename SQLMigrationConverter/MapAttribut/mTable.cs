using SQLMigrationConverter.mapper;
using System;
using System.Data;

namespace SQLMigrationConverter.MapAttribut
{
    public class mTable : Base
    {
        public mTable() : base() { }

        public int SchemaID { get; set; }
        public string TableName { get; set; }
        public string ColumnName { get; set; }
        public int OrdinalPosition { get; set; }
	    public string ColumnDefault { get; set; }
	    public bool isNullable { get; set; }
        public string Domain { get; set; }
	    public string DataType { get; set; }
	    public int CharMaxLength { get; set; }
	    public int Precision { get; set; }
	    public int Scale { get; set; }
        

        public override TablesFieldDataType GetDataType()
        {
            var result = new TablesFieldDataType();
            result.DataType = this.DataType;

            if (this.CharMaxLength != 0)
                result.DataTypeSuffix = this.DataType + "(" + this.CharMaxLength + ")";
            if (this.Precision != 0)
                result.DataTypeSuffix = this.DataType + "(" + this.Precision + "," + this.Scale + ")";
            else
                result.DataTypeSuffix = this.DataType + "(" + this.CharMaxLength + ")";

            return result;
        }

        public override void GetValueFromDataRow(DataRow dataRow)
        {
            SchemaID = System.Convert.ToInt32(String.IsNullOrEmpty(
              dataRow["SchemaID"].ToString())
              ? 0
              : dataRow["SchemaID"]);
       
            TableName = dataRow["TABLE_NAME"].ToString();
            ColumnName = dataRow["COLUMN_NAME"].ToString();
            OrdinalPosition = System.Convert.ToInt32(String.IsNullOrEmpty(
                dataRow["ORDINAL_POSITION"].ToString())
                ? 0
                : dataRow["ORDINAL_POSITION"]);
            ColumnDefault = dataRow["COLUMN_DEFAULT"].ToString();
            isNullable = (dataRow["IS_NULLABLE"].ToString() == "YES");
          //  (dataRow["is_nullable"].ToString() == "YES");
            Domain = dataRow["DOMAIN_NAME"].ToString();
            DataType = dataRow["DATA_TYPE"].ToString();
            CharMaxLength = System.Convert.ToInt32(String.IsNullOrEmpty(
                dataRow["CHARACTER_MAXIMUM_LENGTH"].ToString())
                ? 0
                : dataRow["CHARACTER_MAXIMUM_LENGTH"]);
            Precision = System.Convert.ToInt32(String.IsNullOrEmpty(
                dataRow["NUMERIC_PRECISION"].ToString())
                ? 0
                : dataRow["NUMERIC_PRECISION"]);
            Scale = System.Convert.ToInt32(String.IsNullOrEmpty(
                dataRow["NUMERIC_SCALE"].ToString())
                ? 0
                : dataRow["NUMERIC_SCALE"]);


        }
    }
}
