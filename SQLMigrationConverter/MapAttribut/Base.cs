using SQLMigrationConverter.mapper;
using System.Data;

namespace SQLMigrationConverter.MapAttribut
{
    public abstract class Base
    {
        private readonly IDataTypeMap dataTypeMap;
        public Base()
        {
            dataTypeMap = new DataTypeMap();
        }

        public abstract void GetValueFromDataRow(DataRow dataRow);
        public DataRow DataRow;
        public abstract TablesFieldDataType GetDataType();
        public string GetConvertedDataType()
        {
            return GetDataType().GetMapping(dataTypeMap);
        }
    }
}
