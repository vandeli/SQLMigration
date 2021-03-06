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
using System.Text;
using System.Threading.Tasks;

namespace SQLMigrationManager
{
    public class SPManager  : ISPManager
    {
        private readonly IDataAccess dataAccess;
        readonly IScriptBuilder scriptBuilder;
        readonly ISourceQuery sourceQuery;

        public SPManager(IDataAccess dataAccess, IScriptBuilder scriptBuilder, ISourceQuery sourceQuery)
        {
            this.dataAccess = dataAccess;
            this.scriptBuilder = scriptBuilder;
            this.sourceQuery = sourceQuery;
        }

        public List<SPSchemaInfoData> GetSchema(ConfigData configData)
        {
            Console.WriteLine("SPManager.GetSchema : " + configData.name + " , start...");
            var dt = dataAccess.GetDataTable(configData.Source, sourceQuery.GetSPQuery());
         //   var dtSP = dataAccess.GetDataTable(configData.Source, sourceQuery.GetSPName());
            var listSchema = GetSchemaDataFromDt(dt);
            Console.WriteLine("SPManager.GetSchema : listSchema => " + listSchema.Count + ", Done");
            return listSchema;
        }

        public List<SPResultData> Convert(List<SPSchemaInfoData> datasource)
        {
            Console.WriteLine("SPManager.Convert : listSchema =>" + datasource.Count + " , start...");

            var result = datasource.Select(schemaInfoData => new SPResultData
            {
                name = schemaInfoData.SPName,
                sqlString = scriptBuilder.CreateScriptSP(schemaInfoData),
                schemaId = schemaInfoData.id
            }).ToList();

            Console.WriteLine("SPManager.Convert : " + result.Count + " , Done...");
            return result;

        }

        private List<SPSchemaInfoData> xxGetSchemaDataFromDt(DataTable dt, DataTable dtSP, ConfigData configData)
        {
            var result = new List<SPSchemaInfoData>();
            var tempResult = new List<SPTempSource>();
            var SPname = new List<SPNameInfo>();
            var SPOutputList = new List<SPOutputAttribute>();

           

            for (var i = 0; i < dt.Rows.Count; i++)
            {
                var tempSchema = new SPTempSource();
                var data = dt.Rows[i];
              
                tempSchema.SPName = data["specific_name"].ToString();
                tempSchema.SqlCode = data["SqlCode"].ToString();
                tempSchema.ParameterNumber = System.Convert.ToInt32(data["ORDINAL_POSITION"]);
                tempSchema.ParameterName = data["parameter_name"].ToString();
                tempSchema.DataType = data["DATA_TYPE"].ToString();
                tempSchema.DomainType = data["USER_DEFINED_TYPE_NAME"].ToString();
                tempSchema.ParameterMaxBytes = System.Convert.ToInt32(data["CHARACTER_MAXIMUM_LENGTH"].GetType() == typeof(DBNull) ? 0 : data["CHARACTER_MAXIMUM_LENGTH"]);
                tempSchema.NumericPrecision = System.Convert.ToInt32(data["NUMERIC_PRECISION"].GetType() == typeof(DBNull) ? 0 : data["NUMERIC_PRECISION"]);
                tempSchema.NumericScale = System.Convert.ToInt32(data["NUMERIC_SCALE"].GetType() == typeof(DBNull) ? 0 : data["NUMERIC_SCALE"]);
                tempResult.Add(tempSchema);
            }

            var UsedParameterName = tempResult.GroupBy(x => x.SPName).Select(y => y.First()).ToList();


            foreach (var uSPName in UsedParameterName)
            {
                var listParameterUsed = new List<UsedParameter>();
                var listSPOutput = new List<SPOutputAttribute>();
                var schema = new SPSchemaInfoData();
                schema.SPName = uSPName.SPName;
                schema.SqlCode = uSPName.SqlCode;
                schema.name = uSPName.SPName;
                foreach (var uParameterName in tempResult.Where(x => x.SPName == uSPName.SPName).ToList())
                {
                    var tempData = new UsedParameter();

                    tempData.ParameterName = uParameterName.ParameterName;
                    tempData.ParameterNumber = uParameterName.ParameterNumber;
                    tempData.DataType = uParameterName.DataType;
                    tempData.DomainType = uParameterName.DomainType;
                    tempData.ParameterMaxBytes = uParameterName.ParameterMaxBytes;
                    tempData.NumericPrecision = uParameterName.NumericPrecision;
                    tempData.NumericScale = uParameterName.NumericScale;                   

                    listParameterUsed.Add(tempData);

                }

                var dtOutput = dataAccess.GetDataTable(configData.Source, sourceQuery.getSPOutput(uSPName.SPName));
                for (var i = 0; i < dtOutput.Rows.Count; i++)
                {
                    var tempSPOutput = new SPOutputAttribute();
                    var data = dtOutput.Rows[i];

                    tempSPOutput.GetValueFromDataRow(data);
                    tempSPOutput.ProcName = uSPName.SPName;
                    if (!tempSPOutput.IsVoid)
                        SPOutputList.Add(tempSPOutput);
                }

                schema.usedParameterList = new List<UsedParameter>(listParameterUsed);
                schema.SPOutputList = new List<SPOutputAttribute>(SPOutputList);
                result.Add(schema);
            }
            return result;
        }

        private List<SPSchemaInfoData> GetSchemaDataFromDt(DataTable dt)
        {
            var result = new List<SPSchemaInfoData>();
            var tempResult = new List<SPTempSource>();
          
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                var tempSchema = new SPTempSource();
                var data = dt.Rows[i];
                if (data["parameter_name"].ToString() != "none")
                {
                    tempSchema.SPName = data["name"].ToString();
                    tempSchema.SqlCode = data["SqlCode"].ToString();
                    tempSchema.ParameterNumber = System.Convert.ToInt32(data["ORDINAL_POSITION"]);
                    tempSchema.ParameterName = data["parameter_name"].ToString();
                    tempSchema.DataType = data["DATA_TYPE"].ToString();
                    tempSchema.DomainType = data["USER_DEFINED_TYPE_NAME"].ToString();
                    tempSchema.ParameterMaxBytes = System.Convert.ToInt32(data["CHARACTER_MAXIMUM_LENGTH"].GetType() == typeof(DBNull) ? 0 : data["CHARACTER_MAXIMUM_LENGTH"]);
                    tempSchema.NumericPrecision = System.Convert.ToInt32(data["NUMERIC_PRECISION"].GetType() == typeof(DBNull) ? 0 : data["NUMERIC_PRECISION"]);
                    tempSchema.NumericScale = System.Convert.ToInt32(data["NUMERIC_SCALE"].GetType() == typeof(DBNull) ? 0 : data["NUMERIC_SCALE"]);
                    tempResult.Add(tempSchema);
                }
                else
                {
                    tempSchema.SPName = data["name"].ToString();
                    tempSchema.SqlCode = data["SqlCode"].ToString();
                    tempSchema.ParameterNumber = 0;
                    tempSchema.ParameterName = "";
                    tempSchema.DataType = "";
                    tempSchema.DomainType = "";
                    tempSchema.ParameterMaxBytes = 0;
                    tempSchema.NumericPrecision = 0;
                    tempSchema.NumericScale = 0;
                    tempResult.Add(tempSchema);
                }
            }

            var UsedParameterName = tempResult.GroupBy(x => x.SPName).Select(y => y.First()).ToList();


            foreach (var uSPName in UsedParameterName)
            {
                var listParameterUsed = new List<UsedParameter>();
                //    var listSPOutput = new List<SPOutputAttribute>();
                var schema = new SPSchemaInfoData();
                schema.SPName = uSPName.SPName;
                schema.SqlCode = uSPName.SqlCode;
                schema.name = uSPName.SPName;
                foreach (var uParameterName in tempResult.Where(x => x.SPName == uSPName.SPName).ToList())
                {
                    var tempData = new UsedParameter();

                    tempData.ParameterName = uParameterName.ParameterName;
                    tempData.ParameterNumber = uParameterName.ParameterNumber;
                    tempData.DataType = uParameterName.DataType;
                    tempData.DomainType = uParameterName.DomainType;
                    tempData.ParameterMaxBytes = uParameterName.ParameterMaxBytes;
                    tempData.NumericPrecision = uParameterName.NumericPrecision;
                    tempData.NumericScale = uParameterName.NumericScale;

                    listParameterUsed.Add(tempData);

                }


                schema.usedParameterList = new List<UsedParameter>(listParameterUsed);
              
                result.Add(schema);
            }
            return result;
        }

    }
}
