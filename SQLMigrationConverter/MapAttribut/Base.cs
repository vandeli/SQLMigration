using SQLMigrationConverter.mapper;
using System.Data;

namespace SQLMigrationConverter.MapAttribut
{
    public abstract class Base
    {
        private readonly IDataTypeMapper dataTypeMapper;
        public Base()
        {
            dataTypeMapper = new MssToPostgree();
        }

        public abstract void GetValueFromDataRow(DataRow dataRow);
        public DataRow DataRow;
        public abstract TablesFieldDataType GetDataType();
        public string GetConvertedDataType()
        {
            return GetDataType().GetMapping(dataTypeMapper);
        }
    }
}
