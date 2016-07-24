using FakeItEasy;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SQLMigration.Data;
using SQLMigrationConverter.ResultInfo;
using SQLMigrationConverter.SchemaInfo;
using SQLMigrationConverter.ScriptBuilder;
using SQLMigrationConverter.SourceQuery;
using SQLMigrationInterface;
using SQLMigrationManager;
using System.Collections.Generic;
using System.Data;

namespace SQLMigrationTest
{
    [TestClass]
    public class UDTManagerTest
    {
        [TestMethod]
        public void GetSchemaTest()
        {
            IDataAccess dataAccess = A.Fake<IDataAccess>();
            IScriptBuilder scriptBuilder = A.Fake<IScriptBuilder>();
            ISourceQuery schemaQuery = A.Fake<ISourceQuery>();

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
            A.CallTo(() => dataAccess.GetDataTable(configData, resultQuery)).Returns(resultDataAccess);

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
            IDataAccess dataAccess = A.Fake<IDataAccess>();
            IScriptBuilder scriptBuilder = A.Fake<IScriptBuilder>();
            ISourceQuery schemaQuery = A.Fake<ISourceQuery>();

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


            A.CallTo(() => scriptBuilder.CreateScriptUDT(schemaData)).Returns("Halo");

            List<UDTSchemaInfoData> listSchemaInfoData = new List<UDTSchemaInfoData>();
            listSchemaInfoData.Add(schemaData);
            var result = udtManager.Convert(listSchemaInfoData);



            var resultActual = result[0];

            var resultExpectation = new UDTResultData
            {
                name = "customVar",
                sqlString = "Halo",
                schemaId = schemaData.id
            };


            Assert.AreEqual(resultExpectation.name, resultActual.name);
            Assert.AreEqual(resultExpectation.sqlString, resultActual.sqlString);
            Assert.AreEqual(resultExpectation.schemaId, resultActual.schemaId);

        }
    }
}
