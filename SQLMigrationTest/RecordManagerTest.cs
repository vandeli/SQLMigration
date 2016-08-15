using EasyTools.Interface.DB;
using FakeItEasy;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SQLMigration.Interface.Data;
using SQLMigration.Interface.Interface.Manager;
using SQLMigrationInterface.Interface.ScriptBuilder;
using SQLMigrationInterface.Interface.SourceQuery;
using SQLMigrationManager;
using System.Collections.Generic;
using System.Data;
using SQLMigration.Data.ResultInfo;
using SQLMigration.Data.SchemaInfo;
using System.Data.SqlClient;
using System.Data.Common;

namespace SQLMigration.Test
{
    [TestClass]
    public class RecordManagerTest
    {
        [TestMethod]
        public void RecordGetSchemaTest()
        {
            var dataAccess = A.Fake<IDataAccess>();
            var scriptBuilder = A.Fake<IScriptBuilder>();
            var schemaQuery = A.Fake<ISourceQuery>();

            DataSet RecordSet = new DataSet();
            

            DataTable resultDataAccess = new DataTable("DataTable");
            resultDataAccess.Columns.Add("TableName");
            resultDataAccess.Columns.Add("row_count");
            resultDataAccess.Columns.Add("name");

            DataTable RecordData = new DataTable("RecordData");
            RecordData.Columns.Add("SupID");
            RecordData.Columns.Add("CyID");
            RecordData.Columns.Add("Amount");

            DataRow dataRow = resultDataAccess.NewRow();
            dataRow["name"] = "customTableName";
            dataRow["TableName"] = "customTableName";
            dataRow["row_count"] = "10";

            DataRow recordRow = RecordData.NewRow();
            recordRow["SupID"] = "001";
            recordRow["CyID"] = "111";
            recordRow["Amount"] = "15000";

           
            
        

            resultDataAccess.Rows.Add(dataRow);
            RecordData.Rows.Add(recordRow);
            RecordSet.Tables.Add(RecordData);

            var configData = new ConfigData { name = "Config1" };
            var resultQuery ="";
            string[] TableList;
            TableList = new string[1];
          //  resultQuery[0] = "customTableName";
            var nQuery = "SELECT * FROM " + RecordData;

            A.CallTo(() => schemaQuery.GetTableRecord()).Returns(resultQuery);
            A.CallTo(() => dataAccess.GetDataSet(configData.Source, nQuery, TableList)).DoesNothing(); //.Returns(RecordSet);
            A.CallTo(() => dataAccess.GetDataTable(configData.Source, resultQuery)).Returns(resultDataAccess);
            IRecordManager recordManager = new RecordManager(dataAccess, scriptBuilder, schemaQuery);

            var listSchema = recordManager.GetSchema(configData);

            var schemaExpectation = new RecordSchemaInfoData
            {
                TableName = "customTableName",
                DataRow = 10,
               
            };

            var schemaActual = listSchema[0];

            Assert.AreEqual(schemaExpectation.TableName, schemaActual.TableName);
            Assert.AreEqual(schemaExpectation.DataRow, schemaActual.DataRow);
            
        }

        [TestMethod]
        public void DataRecordConvertTest()
        {
            var dataAccess = A.Fake<IDataAccess>();
            var scriptBuilder = A.Fake<IScriptBuilder>();
            var schemaQuery = A.Fake<ISourceQuery>();

            IRecordManager recordManager = new RecordManager(dataAccess, scriptBuilder, schemaQuery);

            var schemaData = new RecordSchemaInfoData
            {
                name = "customTableName",
                TableName = "customTableName",
                DataRow = 10,
             
            };

            const string RESULT_QUERY = "Select * from master";
            A.CallTo(() => scriptBuilder.CreateScriptRecord(schemaData)).Returns(RESULT_QUERY);

            var listSchemaInfoData = new List<RecordSchemaInfoData> { schemaData };
            var result = recordManager.Convert(listSchemaInfoData);



            var resultActual = result[0];

            var resultExpectation = new RecordResultData
            {
                name = "customTableName",
                sqlString = RESULT_QUERY,
                schemaId = schemaData.id
            };

            Assert.AreEqual(resultExpectation.name, resultActual.name);
            Assert.AreEqual(resultExpectation.sqlString, resultActual.sqlString);
            Assert.AreEqual(resultExpectation.schemaId, resultActual.schemaId);

        }
    }
}
