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
using SQLMigration.Converter.ScriptBuilder;

namespace SQLMigration.Test
{
    [TestClass]
    public class PKManagerTest
    {
        [TestMethod]
        public void PKGetSchemaTest()
        {
            var dataAccess = A.Fake<IDataAccess>();
            var scriptBuilder = A.Fake<IScriptBuilder>();
            var schemaQuery = A.Fake<ISourceQuery>();

            DataTable resultDataAccess = new DataTable("DataTable");
            resultDataAccess.Columns.Add("PK_Name");
            resultDataAccess.Columns.Add("TABLE_NAME");
            resultDataAccess.Columns.Add("COLUMN_NAME");
            resultDataAccess.Columns.Add("ORDINAL_POSITION");

            DataRow dataRow = resultDataAccess.NewRow();
            dataRow["PK_Name"] = "customPKName";
            dataRow["TABLE_NAME"] = "customTableName";
            dataRow["COLUMN_NAME"] = "customColumnName";
            dataRow["ORDINAL_POSITION"] = "1";

            resultDataAccess.Rows.Add(dataRow);

            var usedList = new UsedColumn()
            {
                ColumnName = "customColumnName",
                OrdinalPosition = 1,
               
            };

            var configData = new ConfigData { name = "Config1" };

            var resultQuery = "";

            A.CallTo(() => schemaQuery.GetPKQuery()).Returns(resultQuery);
            A.CallTo(() => dataAccess.GetDataTable(configData.Source, resultQuery)).Returns(resultDataAccess);

            IPKManager pkManager = new PKManager(dataAccess, scriptBuilder, schemaQuery);

            var listSchema = pkManager.GetSchema(configData);

            var schemaExpectation = new PKSchemaInfoData
            {
                PkName = "customPKName",
                TableName = "customTableName",
                usedColumnList = new List<UsedColumn> { usedList }
            };

            var schemaActual = listSchema[0];

            Assert.AreEqual(schemaExpectation.PkName, schemaActual.PkName);
            Assert.AreEqual(schemaExpectation.TableName, schemaActual.TableName);
            Assert.AreEqual(schemaExpectation.usedColumnList[0].ColumnName, schemaActual.usedColumnList[0].ColumnName);
            Assert.AreEqual(schemaExpectation.usedColumnList[0].OrdinalPosition, schemaActual.usedColumnList[0].OrdinalPosition);      


        }

        [TestMethod]
        public void PKConvertTest()
        {
            var dataAccess = A.Fake<IDataAccess>();
            var scriptBuilder = A.Fake<IScriptBuilder>();
            var schemaQuery = A.Fake<ISourceQuery>();
       
            IPKManager pkManager = new PKManager(dataAccess, scriptBuilder, schemaQuery);

            var usedList = new UsedColumn()
            {
                ColumnName = "customColumnName",
              
            };
            var schemaData = new PKSchemaInfoData
            {
                PkName = "customPKName",
                TableName = "customTableName",
                usedColumnList = new List<UsedColumn> { usedList }

            };


            const string RESULT_QUERY = "Select * from master";
            A.CallTo(() => scriptBuilder.CreateScriptPK(schemaData)).Returns(RESULT_QUERY);

            var listSchemaInfoData = new List<PKSchemaInfoData> { schemaData };
            var result = pkManager.Convert(listSchemaInfoData);



            var resultActual = result[0];

            var resultExpectation = new PKResultData
            {
                name = "customPKName",
                sqlString = RESULT_QUERY,
                schemaId = schemaData.id
            };

            Assert.AreEqual(resultExpectation.name, resultActual.name);
            Assert.AreEqual(resultExpectation.sqlString, resultActual.sqlString);
            Assert.AreEqual(resultExpectation.schemaId, resultActual.schemaId);

        }
    }
}
