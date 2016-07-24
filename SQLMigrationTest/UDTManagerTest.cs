using FakeItEasy;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SQLMigration.Data;
using SQLMigrationConverter.SchemaInfo;
using SQLMigrationInterface;
using SQLMigrationManager;
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
            IUDTScriptBuilder scriptBuilder = A.Fake<IUDTScriptBuilder>();
            IUDTSchemaQuery schemaQuery = A.Fake<IUDTSchemaQuery>();

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

            A.CallTo(() => dataAccess.GetDataTable(configData, "")).Returns(resultDataAccess);

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
    }
}
