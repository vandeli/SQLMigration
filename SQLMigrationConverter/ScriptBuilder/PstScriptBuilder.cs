
using SQLMigrationInterface.Interface.ScriptBuilder;
using System;
using System.Collections.Generic;
using System.Linq;
using SQLMigration.Data.SchemaInfo;

namespace SQLMigration.Converter.ScriptBuilder
{
    public class PstScriptBuilder : IScriptBuilder
    {

        class TablesFieldDataType
        {
            public string DataType { get; set; }
            public string ConvertedDataType { get; set; }
        }

        public string CreateScriptUDT(UDTSchemaInfoData schemaInfo)
        {
            Console.WriteLine("CreateScriptUDT : " + schemaInfo);
            string result;
          
            var convertedDataType = GetDataTypeMap(schemaInfo.DataType);
            if (schemaInfo.Scale > 0)
            {
                result = string.Format("CREATE DOMAIN {0} AS {1}({2},{3}){4};\r\n",
                                schemaInfo.name, convertedDataType, schemaInfo.Precision,
                                schemaInfo.Scale, (schemaInfo.IsNullable ? "" : " NOT NULL"));

            }
            else if (schemaInfo.Precision == 0)
            {
                result = string.Format("CREATE DOMAIN {0} AS {1}({2}){3};\r\n",
                        schemaInfo.name, convertedDataType, schemaInfo.MaxLength,
                        (schemaInfo.IsNullable ? "" : " NOT NULL"));

            }
            else
            {
                result = string.Format("CREATE DOMAIN {0} AS {1}{2};\r\n",
                        schemaInfo.name, convertedDataType,
                        (schemaInfo.IsNullable ? "" : " NOT NULL"));
            }


            Console.WriteLine("CreateScriptUDT Result : " + result);

            return result;

        }

        private readonly List<TablesFieldDataType> mapDataTypes = new List<TablesFieldDataType>
        {
            new TablesFieldDataType { DataType="datetime", ConvertedDataType="timestamp" },
            new TablesFieldDataType { DataType="bigint", ConvertedDataType="bigint" },
            new TablesFieldDataType { DataType="binary", ConvertedDataType="bytea" },
            new TablesFieldDataType { DataType="boolean", ConvertedDataType="boolean" },
            new TablesFieldDataType { DataType="char", ConvertedDataType="char" },
            new TablesFieldDataType { DataType="currency", ConvertedDataType="money" },
            new TablesFieldDataType { DataType="dbdate", ConvertedDataType="date" },
            new TablesFieldDataType { DataType="dbtime", ConvertedDataType="time" },
            new TablesFieldDataType { DataType="dbtimestamp", ConvertedDataType="timestamp" },
            new TablesFieldDataType { DataType="date", ConvertedDataType="date" },
            new TablesFieldDataType { DataType="decimal", ConvertedDataType="numeric" },
            new TablesFieldDataType { DataType="double", ConvertedDataType="double" },
            new TablesFieldDataType { DataType="filetime", ConvertedDataType="timestamp" },
            new TablesFieldDataType { DataType="guid", ConvertedDataType="uuid" },
            new TablesFieldDataType { DataType="idispatch", ConvertedDataType="oid" },
            new TablesFieldDataType { DataType="iunknown", ConvertedDataType="oid" },
            new TablesFieldDataType { DataType="integer", ConvertedDataType="integer" },
            new TablesFieldDataType { DataType="int", ConvertedDataType="integer" },
            new TablesFieldDataType { DataType="longvarbinary", ConvertedDataType="bytea" },
            new TablesFieldDataType { DataType="longvarchar", ConvertedDataType="text" },
            new TablesFieldDataType { DataType="longvarwchar", ConvertedDataType="text" },
            new TablesFieldDataType { DataType="numeric", ConvertedDataType="numeric" },
            new TablesFieldDataType { DataType="bit", ConvertedDataType="bit" },
            new TablesFieldDataType { DataType="propvariant", ConvertedDataType="text" },
            new TablesFieldDataType { DataType="single", ConvertedDataType="real" },
            new TablesFieldDataType { DataType="smallint", ConvertedDataType="smallint" },
            new TablesFieldDataType { DataType="tinyint", ConvertedDataType="smallint" },
            new TablesFieldDataType { DataType="unsignedtinyint", ConvertedDataType="tinyint" },
            new TablesFieldDataType { DataType="nvarchar", ConvertedDataType="varchar" },
            new TablesFieldDataType { DataType="nchar", ConvertedDataType="varchar" },
            new TablesFieldDataType { DataType="varchar", ConvertedDataType="varchar" },
            new TablesFieldDataType { DataType="varbinary", ConvertedDataType="bytea" },
            new TablesFieldDataType { DataType="varnumeric", ConvertedDataType="numeric" },
            new TablesFieldDataType { DataType="varwchar", ConvertedDataType="varchar" },
            new TablesFieldDataType { DataType="variant", ConvertedDataType="oid" },
            new TablesFieldDataType { DataType="wchar", ConvertedDataType="char" },
            new TablesFieldDataType { DataType="image", ConvertedDataType="bytea" },
            new TablesFieldDataType { DataType="bstr", ConvertedDataType="--" },
            new TablesFieldDataType { DataType="empty", ConvertedDataType="--" },
            new TablesFieldDataType { DataType="error", ConvertedDataType="--" },
            new TablesFieldDataType { DataType="unsignedbigint", ConvertedDataType="--" },
            new TablesFieldDataType { DataType="unsignedint", ConvertedDataType="--" },
            new TablesFieldDataType { DataType="unsignedsmallint", ConvertedDataType="--" },
        };

        string GetDataTypeMap(String dataType)
        {
            if (dataType == null)
            {
                throw new ArgumentNullException("dataType");
            }


            var findingResult = mapDataTypes.SingleOrDefault(x => string.Equals(x.DataType, dataType, StringComparison.CurrentCultureIgnoreCase));

            return findingResult == null ? "" : findingResult.ConvertedDataType;
        }

    }
}
