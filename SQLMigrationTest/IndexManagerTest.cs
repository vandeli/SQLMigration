using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using EasyTools.Interface.DB;
using SQLMigrationInterface.Interface.SourceQuery;
using SQLMigrationInterface.Interface.ScriptBuilder;
using System.Data;
using SQLMigration.Interface.Data;
using FakeItEasy;
using SQLMigration.Interface.Interface.Manager;
using SQLMigration.Data.SchemaInfo;
using SQLMigrationManager;
using System.Collections.Generic;
using SQLMigration.Data.ResultInfo;

namespace SQLMigration.Test
{
    [TestClass]
    public class IndexManagerTest
    {
        [TestMethod]
        public void INDEXGetSchemaTest()
        {
            var dataAccess = A.Fake<IDataAccess>();
            var scriptBuilder = A.Fake<IScriptBuilder>();
            var schemaQuery = A.Fake<ISourceQuery>();

            DataTable resultDataAccess = new DataTable("DataTable");

           
            resultDataAccess.Columns.Add("IndexName");
            resultDataAccess.Columns.Add("TableName");
            resultDataAccess.Columns.Add("ColumnOrder");
            resultDataAccess.Columns.Add("IsIncluded");
            resultDataAccess.Columns.Add("ColumnName");

            DataRow dataRow = resultDataAccess.NewRow();
            dataRow["IndexName"] = "customIndexName";
            dataRow["TableName"] = "customTableName";
            dataRow["ColumnOrder"] = "1";
            dataRow["IsIncluded"] = "1";
            dataRow["ColumnName"] = "customColumnName";

            resultDataAccess.Rows.Add(dataRow);

            var configData = new ConfigData { name = "Config1" };

            var resultQuery = "";

            A.CallTo(() => schemaQuery.GetIndexQuery()).Returns(resultQuery);
            A.CallTo(() => dataAccess.GetDataTable(configData.Source, resultQuery)).Returns(resultDataAccess);

            IIndexManager indexManager = new IndexManager(dataAccess, scriptBuilder, schemaQuery);

            var listSchema = indexManager.GetSchema(configData);

            var schemaExpectation = new IndexSchemaInfoData
            {
               IndexName = "customIndexName",
                TableName = "customTableName",
                ColumnOrder = 1,
                IsIncluded = 1,
                ColumnName = "customColumnName",
             };

            var schemaActual = listSchema[0];

            Assert.AreEqual(schemaExpectation.IndexName, schemaActual.IndexName);
            Assert.AreEqual(schemaExpectation.TableName, schemaActual.TableName);
            Assert.AreEqual(schemaExpectation.ColumnName, schemaActual.ColumnName);
            Assert.AreEqual(schemaExpectation.ColumnOrder, schemaActual.ColumnOrder);
            Assert.AreEqual(schemaExpectation.IsIncluded, schemaActual.IsIncluded);

        }

        [TestMethod]
        public void INDEXConvertTest()
        {
            var dataAccess = A.Fake<IDataAccess>();
            var scriptBuilder = A.Fake<IScriptBuilder>();
            var schemaQuery = A.Fake<ISourceQuery>();

            IIndexManager indexManager = new IndexManager(dataAccess, scriptBuilder, schemaQuery);

            var schemaData = new IndexSchemaInfoData
            {
                IndexName = "customIndexName",
                TableName = "customTableName",
                ColumnOrder = 1,
                IsIncluded = 1,
                ColumnName = "customColumnName",

            };

            var tempSchemaData = new tempTableData
            {
                AllTableName = "customIndexName",
                AllColumnName = "customColumnName",
            };


            const string RESULT_QUERY = "Select * from master";
            A.CallTo(() => scriptBuilder.CreateScriptIndex(tempSchemaData)).Returns(RESULT_QUERY);

            var listSchemaInfoData = new List<IndexSchemaInfoData> { schemaData };
            var result = indexManager.Convert(listSchemaInfoData);



            var resultActual = result[0];

            var resultExpectation = new IndexResultData
            {
                name = "customIndexName",
                sqlString = RESULT_QUERY,
                schemaId = schemaData.id
            };

            Assert.AreEqual(resultExpectation.name, resultActual.name);
            Assert.AreEqual(resultExpectation.sqlString, resultActual.sqlString);
            Assert.AreEqual(resultExpectation.schemaId, resultActual.schemaId);

        }
    }
}
