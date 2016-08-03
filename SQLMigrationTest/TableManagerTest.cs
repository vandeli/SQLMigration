using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using EasyTools.Interface.DB;
using SQLMigrationInterface.Interface.ScriptBuilder;
using SQLMigrationInterface.Interface.SourceQuery;
using FakeItEasy;
using System.Data;
using SQLMigration.Interface.Data;
using SQLMigration.Interface.Interface.Manager;
using SQLMigrationManager;
using SQLMigration.Data.SchemaInfo;
using System.Collections.Generic;
using SQLMigration.Data.ResultInfo;
using SQLMigration.Converter.ScriptBuilder;

namespace SQLMigration.Test
{
    [TestClass]
    public class TableManagerTest
    {
        [TestMethod]
        public void TABLEGetchemaTes()
        {
            var dataAccess = A.Fake<IDataAccess>();
            var scriptBuilder = A.Fake<IScriptBuilder>();
            var schemaQuery = A.Fake<ISourceQuery>();

            DataTable resultDataAccess = new DataTable("DataTable");         

            resultDataAccess.Columns.Add("TABLE_NAME");
            resultDataAccess.Columns.Add("COLUMN_NAME");
            resultDataAccess.Columns.Add("ORDINAL_POSITION");
            resultDataAccess.Columns.Add("COLUMN_DEFAULT");
            resultDataAccess.Columns.Add("IS_NULLABLE");
            resultDataAccess.Columns.Add("DOMAIN_NAME");
            resultDataAccess.Columns.Add("DATA_TYPE");
            resultDataAccess.Columns.Add("CHARACTER_MAXIMUM_LENGTH");
            resultDataAccess.Columns.Add("NUMERIC_PRECISION");
            resultDataAccess.Columns.Add("NUMERIC_SCALE");

            DataRow dataRow = resultDataAccess.NewRow();
           
            dataRow["TABLE_NAME"] = "customTableName";
            dataRow["COLUMN_NAME"] = "customColumnName";
            dataRow["ORDINAL_POSITION"] = "1";
            dataRow["COLUMN_DEFAULT"] = "";
            dataRow["IS_NULLABLE"] = "1";
            dataRow["DOMAIN_NAME"] = "customDomain";
            dataRow["DATA_TYPE"] = "numeric";
            dataRow["CHARACTER_MAXIMUM_LENGTH"] = "0";
            dataRow["NUMERIC_PRECISION"] = "8";
            dataRow["NUMERIC_SCALE"] = "2";

            resultDataAccess.Rows.Add(dataRow);

            var usedList = new UsedColumn()
            {
                ColumnName = "customColumnName",
                OrdinalPosition = 1,
                ColumnDefault = "",
                isNullable = true,
                Domain = "customDomain",
                DataType = "numeric",
                CharMaxLength = 0,
                Precision = 8,
                Scale = 2
            };

           

            var configData = new ConfigData { name = "Config1" };

            var resultQuery = "";

            A.CallTo(() => schemaQuery.GetSPQuery()).Returns(resultQuery);
            A.CallTo(() => dataAccess.GetDataTable(configData.Source, resultQuery)).Returns(resultDataAccess);

            ITableManager udtManager = new TableManager(dataAccess, scriptBuilder, schemaQuery);

            var listSchema = udtManager.GetSchema(configData);

            var schemaExpectation = new TableSchemaInfoData
            {
                TableName = "customTableName",
                usedColumnList = new List<UsedColumn> { usedList }
            };

            var schemaActual = listSchema[0];

            Assert.AreEqual(schemaExpectation.TableName, schemaActual.TableName);
            Assert.AreEqual(schemaExpectation.usedColumnList[0].ColumnName, schemaActual.usedColumnList[0].ColumnName);
            Assert.AreEqual(schemaExpectation.usedColumnList[0].OrdinalPosition, schemaActual.usedColumnList[0].OrdinalPosition);
            Assert.AreEqual(schemaExpectation.usedColumnList[0].ColumnDefault, schemaActual.usedColumnList[0].ColumnDefault);
            Assert.AreEqual(schemaExpectation.usedColumnList[0].isNullable, schemaActual.usedColumnList[0].isNullable);
            Assert.AreEqual(schemaExpectation.usedColumnList[0].Domain, schemaActual.usedColumnList[0].Domain);
            Assert.AreEqual(schemaExpectation.usedColumnList[0].DataType, schemaActual.usedColumnList[0].DataType);
            Assert.AreEqual(schemaExpectation.usedColumnList[0].CharMaxLength, schemaActual.usedColumnList[0].CharMaxLength);
            Assert.AreEqual(schemaExpectation.usedColumnList[0].Precision, schemaActual.usedColumnList[0].Precision);
            Assert.AreEqual(schemaExpectation.usedColumnList[0].Scale, schemaActual.usedColumnList[0].Scale);          

        }

        [TestMethod]
        public void TABLEConvertTest()
        {
            var dataAccess = A.Fake<IDataAccess>();
            var scriptBuilder = A.Fake<IScriptBuilder>();
            var schemaQuery = A.Fake<ISourceQuery>();

            ITableManager tableManager = new TableManager(dataAccess, scriptBuilder, schemaQuery);

            var usedList = new UsedColumn()
            {
                ColumnName = "customColumnName",
                OrdinalPosition = 1,
                ColumnDefault = "",
                isNullable = true,
                Domain = "customDomain",
                DataType = "numeric",
                CharMaxLength = 0,
                Precision = 8,
                Scale = 2
            };
            var schemaData = new TableSchemaInfoData
            {
                name = "customTableName",
                TableName = "customTableName",
                usedColumnList = new List<UsedColumn> { usedList }
                };

       
           const string RESULT_QUERY = "select * From Master";
           A.CallTo(() => scriptBuilder.CreateScriptTable(schemaData)).Returns(RESULT_QUERY);
          

            var listSchemaInfoData = new List<TableSchemaInfoData> { schemaData }; 
            var result =  tableManager.Convert(listSchemaInfoData);


            var resultActual = result[0];

           
            var resultExpectation = new TableResultData
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
