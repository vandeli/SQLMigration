using EasyTools.Interface.DB;
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
    public class FunctionManager : IFunctionManager
    {
        private readonly IDataAccess dataAccess;
        readonly IScriptBuilder scriptBuilder;
        readonly ISourceQuery sourceQuery;

        public FunctionManager(IDataAccess dataAccess, IScriptBuilder scriptBuilder, ISourceQuery sourceQuery)
        {
            this.dataAccess = dataAccess;
            this.scriptBuilder = scriptBuilder;
            this.sourceQuery = sourceQuery;
        }

        public List<FunctionSchemaInfoData> GetSchema(ConfigData configData)
        {
            Console.WriteLine("FunctionManager.GetSchema : " + configData.name + " , start...");
            var dt = dataAccess.GetDataTable(configData.Source, sourceQuery.GetFunction());
            var listSchema = GetSchemaDataFromDt(dt);
            Console.WriteLine("FunctionManager.GetSchema : listSchema => " + listSchema.Count + ", Done");
            return listSchema;
        }

        public List<FunctionResultData> Convert(List<FunctionSchemaInfoData> datasource)
        {
            Console.WriteLine("FunctionManager.Convert : listSchema =>" + datasource.Count + " , start...");

            var result = datasource.Select(schemaInfoData => new FunctionResultData
            {
                name = schemaInfoData.FnName,
                sqlString = scriptBuilder.CreateScriptFunction(schemaInfoData),
                schemaId = schemaInfoData.id
            }).ToList();

            Console.WriteLine("FunctionManager.Convert : " + result.Count + " , Done...");
            return result;

        }

        private List<FunctionSchemaInfoData> GetSchemaDataFromDt(DataTable dt)
        {
            var result = new List<FunctionSchemaInfoData>();
            var tempResult = new List<FunctionTempSource>();
           // var SPname = new List<SPNameInfo>();
           // var SPOutputList = new List<SPOutputAttribute>();



            for (var i = 0; i < dt.Rows.Count; i++)
            {
                var tempSchema = new FunctionTempSource();
                var data = dt.Rows[i];

                tempSchema.FnName = data["specific_name"].ToString();
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

            var UsedParameterName = tempResult.GroupBy(x => x.FnName).Select(y => y.First()).ToList();


            foreach (var uSPName in UsedParameterName)
            {
                var listParameterUsed = new List<UsedParameter>();
            //    var listSPOutput = new List<SPOutputAttribute>();
                var schema = new FunctionSchemaInfoData();
                schema.FnName = uSPName.FnName;
                schema.SqlCode = uSPName.SqlCode;
                schema.name = uSPName.FnName;
                foreach (var uParameterName in tempResult.Where(x => x.FnName == uSPName.FnName).ToList())
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

                //var dtOutput = dataAccess.GetDataTable(configData.Source, sourceQuery.getSPOutput(uSPName.SPName));
                //for (var i = 0; i < dtOutput.Rows.Count; i++)
                //{
                //    var tempSPOutput = new SPOutputAttribute();
                //    var data = dtOutput.Rows[i];

                //    tempSPOutput.GetValueFromDataRow(data);
                //    tempSPOutput.ProcName = uSPName.SPName;
                //    if (!tempSPOutput.IsVoid)
                //        SPOutputList.Add(tempSPOutput);
                //}

                schema.usedParameterList = new List<UsedParameter>(listParameterUsed);
              //  schema.SPOutputList = new List<SPOutputAttribute>(SPOutputList);
                result.Add(schema);
            }
            return result;
        }


    }
}
