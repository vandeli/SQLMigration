using SQLMigrationConverter.mapper;
using SQLMigrationConverter.SchemaInfo;
using System;
using System.Linq;

namespace SQLMigrationManager
{
    public class UDTScriptBuilder : IUDTScriptBuilder
    {
        readonly IDataTypeMapper dataTypeMapper;

        public UDTScriptBuilder(IDataTypeMapper dataTypeMapper)
        {
            this.dataTypeMapper = dataTypeMapper;
        }

        public string CreateScript(UDTSchemaInfoData schemaInfoData)
        {
            var result = "";
            var tableResult = "";

            tableResult = GetTemplateUDT(schemaInfoData);
            result += tableResult;

            return result;

        }

        TablesFieldDataType GetDataType(UDTSchemaInfoData schemaInfo)
        {
            var result = new TablesFieldDataType();
            result.DataType = schemaInfo.DataType;

            if (schemaInfo.Precision != 0)
                result.DataTypeSuffix = schemaInfo.DataType + "(" + schemaInfo.Precision + "," + schemaInfo.Scale + ")";
            else
                result.DataTypeSuffix = schemaInfo.DataType + "(" + schemaInfo.MaxLength + ")";

            return result;
        }

        string GetConvertedDataType(UDTSchemaInfoData schema)
        {
            var type = GetDataType(schema);
            return GetMappingDatatype(type);
        }

        string GetMappingDatatype(TablesFieldDataType dataType)
        {
            if (dataType == null)
            {
                throw new ArgumentNullException("dataType");
            }
            if (dataType.DomainName != null && dataType.DomainName.Length > 0)

                return dataType.DomainName;

            var findingResult = dataTypeMapper.GetDataTypeMap().Where(x => x.DataType == dataType.DataType.ToLower());
            TablesFieldDataType result = null;
            if (findingResult.Count() > 1)
                result = findingResult.SingleOrDefault(x => x.DataTypeSuffix == dataType.DataTypeSuffix.ToLower());
            else if (findingResult.Count() == 1)
                result = findingResult.First();

            return result == null ? "null" : result.ConvertedDataType;
        }

        string GetTemplateUDT(UDTSchemaInfoData schemaInfo)
        {
            var result = "CREATE DOMAIN " + schemaInfo.Name + " AS " + GetConvertedDataType(schemaInfo) + "(" + schemaInfo.Precision + "," + schemaInfo.Scale + ")" + (schemaInfo.IsNullable ? "" : " NOT NULL") + ";\r\n";
            return result;
        }
    }
}
