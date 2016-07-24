using SQLMigrationConverter.mapper;
using SQLMigrationConverter.SchemaInfo;

namespace SQLMigrationManager
{
    public class UDTScriptBuilder : IUDTScriptBuilder
    {
        readonly IDataTypeMapper dataTypeMapper;

        public UDTScriptBuilder(IDataTypeMapper dataTypeMapper)
        {
            this.dataTypeMapper = dataTypeMapper;
        }

        public string CreateScript(UDTSchemaInfoData schemaInfo)
        {
            string result;
            var convertedDataType = dataTypeMapper.GetDataTypeMap(schemaInfo.DataType);
            switch (schemaInfo.DataType)
            {
                case "decimal":
                    result = string.Format("CREATE DOMAIN {0} AS {1}({2},{3}){4};\r\n",
                                schemaInfo.name, convertedDataType, schemaInfo.Precision,
                                schemaInfo.Scale, (schemaInfo.IsNullable ? "" : " NOT NULL"));
                    break;

                case "varchar":
                    result = string.Format("CREATE DOMAIN {0} AS {1}({2}){3};\r\n",
                        schemaInfo.name, convertedDataType, schemaInfo.MaxLength,
                        (schemaInfo.IsNullable ? "" : " NOT NULL"));
                    break;

                default:
                    result = string.Format("CREATE DOMAIN {0} AS {1}{2};\r\n",
                        schemaInfo.name, convertedDataType,
                        (schemaInfo.IsNullable ? "" : " NOT NULL"));
                    break;
            }


            return result;

        }

    }
}
