﻿using EasyTools.Interface.DB;
using SQLMigration.Data.ResultInfo;
using SQLMigration.Data.SchemaInfo;
using SQLMigration.Interface.Data;
using SQLMigration.Interface.Interface.Manager;
using SQLMigrationInterface.Interface.ScriptBuilder;
using SQLMigrationInterface.Interface.SourceQuery;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace SQLMigrationManager
{
    public class UDTManager : IUDTManager
    {
        private readonly IDataAccess dataAccess;
        readonly IScriptBuilder scriptBuilder;
        readonly ISourceQuery sourceQuery;

        public UDTManager(IDataAccess dataAccess, IScriptBuilder scriptBuilder, ISourceQuery sourceQuery)
        {
            this.dataAccess = dataAccess;
            this.scriptBuilder = scriptBuilder;
            this.sourceQuery = sourceQuery;
        }

        public List<UDTSchemaInfoData> GetSchema(ConfigData configData)
        {
            Console.WriteLine("UDTManager.GetSchema : " + configData.name + " , start...");
            var dt = dataAccess.GetDataTable(configData.Source, sourceQuery.GetUDTQuery());
            var listSchema = GetSchemaDataFromDt(dt);
            Console.WriteLine("UDTManager.GetSchema : listSchema => " + listSchema.Count + ", Done");
            return listSchema;
        }

        private static List<UDTSchemaInfoData> GetSchemaDataFromDt(DataTable dt)
        {
            var result = new List<UDTSchemaInfoData>();
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                var schema = new UDTSchemaInfoData();
                var data = dt.Rows[i];
                schema.name = data["NAME"].ToString();
                schema.DataType = data["data_type"].ToString();
                schema.MaxLength = System.Convert.ToInt16(data["max_length"]);
                schema.Precision = System.Convert.ToByte(data["precision"]);
                schema.Scale = System.Convert.ToInt16(data["scale"]);
                schema.IsNullable = System.Convert.ToBoolean(data["is_nullable"].ToString() == "1");
                result.Add(schema);
            }

            return result;
        }

        public List<UDTResultData> Convert(List<UDTSchemaInfoData> datasource)
        {
            Console.WriteLine("UDTManager.Convert : listSchema =>" + datasource.Count + " , start...");
            var result = datasource.Select(schemaInfoData => new UDTResultData
            {
                name = schemaInfoData.name,
                sqlString = scriptBuilder.CreateScriptUDT(schemaInfoData),
                schemaId = schemaInfoData.id
            }).ToList();

            Console.WriteLine("UDTManager.Convert : " + result.Count + " , Done...");
            return result;
        }
    }
}