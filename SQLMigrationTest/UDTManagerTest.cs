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

namespace SQLMigration.Test
{
    [TestClass]
    public class UDTManagerTest
    {
        [TestMethod]
        public void GetSchemaTest()
        {
            var dataAccess = A.Fake<IDataAccess>();
            var scriptBuilder = A.Fake<IScriptBuilder>();
            var schemaQuery = A.Fake<ISourceQuery>();

            DataTable resultDataAccess = new DataTable("DataTable");
            resultDataAccess.Columns.Add("NAME");
            resultDataAccess.Columns.Add("data_type");
            resultDataAccess.Columns.Add("max_length");
            resultDataAccess.Columns.Add("precision");
            resultDataAccess.Columns.Add("scale");
            resultDataAccess.Columns.Add("is_nullable");

            DataRow dataRow = resultDataAccess.NewRow();
            dataRow["NAME"] = "customVar";
            dataRow["data_type"] = "varchar";
            dataRow["max_length"] = "50";
            dataRow["precision"] = "0";
            dataRow["scale"] = "0";
            dataRow["is_nullable"] = "1";

            resultDataAccess.Rows.Add(dataRow);


            var configData = new ConfigData { name = "Config1" };

            var resultQuery = "";

            A.CallTo(() => schemaQuery.GetUDTQuery()).Returns(resultQuery);
            A.CallTo(() => dataAccess.GetDataTable(configData.Source, resultQuery)).Returns(resultDataAccess);

            IUDTManager udtManager = new UDTManager(dataAccess, scriptBuilder, schemaQuery);

            var listSchema = udtManager.GetSchema(configData);

            var schemaExpectation = new UDTSchemaInfoData
            {
                name = "customVar",
                DataType = "varchar",
                MaxLength = 50,
                Precision = 0,
                Scale = 0,
                IsNullable = true
            };

            var schemaActual = listSchema[0];

            Assert.AreEqual(schemaExpectation.name, schemaActual.name);
            Assert.AreEqual(schemaExpectation.DataType, schemaActual.DataType);
            Assert.AreEqual(schemaExpectation.MaxLength, schemaActual.MaxLength);
            Assert.AreEqual(schemaExpectation.Precision, schemaActual.Precision);
            Assert.AreEqual(schemaExpectation.Scale, schemaActual.Scale);
            Assert.AreEqual(schemaExpectation.IsNullable, schemaActual.IsNullable);

        }

        [TestMethod]
        public void ConvertTest()
        {
            var dataAccess = A.Fake<IDataAccess>();
            var scriptBuilder = A.Fake<IScriptBuilder>();
            var schemaQuery = A.Fake<ISourceQuery>();

            IUDTManager udtManager = new UDTManager(dataAccess, scriptBuilder, schemaQuery);

            var schemaData = new UDTSchemaInfoData
            {
                name = "customVar",
                DataType = "varchar",
                MaxLength = 50,
                Precision = 0,
                Scale = 0,
                IsNullable = true
            };

            const string RESULT_QUERY = "Select * from master";
            A.CallTo(() => scriptBuilder.CreateScriptUDT(schemaData)).Returns(RESULT_QUERY);

            var listSchemaInfoData = new List<UDTSchemaInfoData> { schemaData };
            var result = udtManager.Convert(listSchemaInfoData);



            var resultActual = result[0];

            var resultExpectation = new UDTResultData
            {
                name = "customVar",
                sqlString = RESULT_QUERY,
                schemaId = schemaData.id
            };

            Assert.AreEqual(resultExpectation.name, resultActual.name);
            Assert.AreEqual(resultExpectation.sqlString, resultActual.sqlString);
            Assert.AreEqual(resultExpectation.schemaId, resultActual.schemaId);

        }
    }
}
