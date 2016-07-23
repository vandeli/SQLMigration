﻿using SQLMigrationConverter.mapper;
using System;
using System.Linq;

namespace SQLMigrationConverter.MapAttribut
{
    public static class DataTypeExtensions
    {
        public static string GetMapping(this TablesFieldDataType dataType, IDataTypeMapper dataTypeMapper)
        {
            if (dataType == null)
            {
                throw new ArgumentNullException("dataType is null, please check your database");
            }
            if (dataType.DomainName != null && dataType.DomainName.Length > 0)

                return dataType.DomainName;

            var findingResult = dataTypeMapper.GetDataTypeMap().Where(x => x.DataType == dataType.DataType.ToLower());
            TablesFieldDataType result = null;
            if (findingResult.Count() > 1)
                result = findingResult.SingleOrDefault(x => x.DataTypeSuffix == dataType.DataTypeSuffix.ToLower());
            else if (findingResult.Count() == 1)
                result = findingResult.First();

            if (result == null)
            {
                return "null";
            }
            //throw new NullReferenceException("sql server data type mapping doesn't exist.");

            return result.ConvertedDataType; // + " " + result.ConvertedDataTypeSuffix;

        }
    }
}
