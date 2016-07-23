using SQLMigration.Data;
using SQLMigration.DB;
using SQLMigrationConverter.mapper;
using SQLMigrationConverter.ResultInfo;
using SQLMigrationConverter.SchemaInfo;
using SQLMigrationInterface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace SQLMigrationManager
{

    public class UDTManager : IUDTManager
    {

        private readonly ICoreDB db;

        private readonly IDataAccess dataAccess;
        readonly IDataTypeMapper dataTypeMapper;

        public UDTManager(IDataAccess dataAccess1, IDataTypeMapper dataTypeMapper)
        {
            this.dataAccess = dataAccess1;
            this.dataTypeMapper = dataTypeMapper;
        }

        public List<UDTSchemaInfoData> GetSchema(ConfigData configData)
        {
            var result = new List<UDTSchemaInfoData>();
            var dt = dataAccess.GetDataTable(configData, GetQuery());
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var schema = new UDTSchemaInfoData();
                DataRow data = dt.Rows[i];
                schema.name = data["szName"].ToString();
                result.Add(schema);
            }

            return result;
        }



        public List<UDTResultData> Convert(List<UDTSchemaInfoData> datasource)
        {

            var result = new List<UDTResultData>();
            foreach (var schemaInfoData in datasource)
            {
                var resultInfo = new UDTResultData
                {
                    name = schemaInfoData.name,
                    sqlString = CreateScript(schemaInfoData)
                };

                result.Add(resultInfo);
            }

            return result;
        }

        string GetQuery()
        {
            return @"
			SELECT st.NAME
				,bs.[name] AS data_type
				,st.max_length
				,st.precision
				,st.scale
				,st.is_nullable
			FROM sys.types st
			INNER JOIN sys.schemas ss ON st.[schema_id] = ss.[schema_id]
			INNER JOIN sys.types bs ON bs.[user_type_id] = st.[system_type_id]
			WHERE st.[is_user_defined] = 1 -- exclude system types
			ORDER BY st.[name]
				,ss.[name]
			";
        }

        string CreateScript(UDTSchemaInfoData schemaInfoData)
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
