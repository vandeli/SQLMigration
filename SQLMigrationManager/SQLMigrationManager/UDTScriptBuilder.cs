using SQLMigrationConverter.mapper;
using SQLMigrationConverter.SchemaInfo;
using System;
using System.Collections.Generic;
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
            if (!string.IsNullOrEmpty(dataType.DomainName))
                return dataType.DomainName;

            var findingResult = dataTypeMapper.GetDataTypeMap().Where(x => x.DataType == dataType.DataType.ToLower());
            TablesFieldDataType result = null;
            var tablesFieldDataTypes = findingResult as IList<TablesFieldDataType> ?? findingResult.ToList();
            if (tablesFieldDataTypes.Count > 1)
                result = tablesFieldDataTypes.SingleOrDefault(x => x.DataTypeSuffix == dataType.DataTypeSuffix.ToLower());
            else if (tablesFieldDataTypes.Count == 1)
                result = tablesFieldDataTypes.First();

            return result == null ? "null" : result.ConvertedDataType;
        }

        string GetTemplateUDT(UDTSchemaInfoData schemaInfo)
        {
            var convertedDataType = GetConvertedDataType(schemaInfo);
            var result = string.Format("CREATE DOMAIN {0} AS {1}({2},{3}){4};\r\n", 
                schemaInfo.name, convertedDataType, schemaInfo.Precision, 
                schemaInfo.Scale, (schemaInfo.IsNullable ? "" : " NOT NULL"));
            return result;
        }
    }
}
