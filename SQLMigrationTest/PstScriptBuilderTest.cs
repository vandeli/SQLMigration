using System.Collections.Generic;
using System.Diagnostics;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SQLMigration.Converter.ScriptBuilder;
using SQLMigration.Data.SchemaInfo;

namespace SQLMigration.Test
{
    [TestClass]
    public class PstScriptBuilderTest
    {
        [TestMethod]
        public void CreateUdtScript_VarcharTest()
        {
            var scriptBuilder = new PstScriptBuilder();
            var schemaInfo = new UDTSchemaInfoData
            {
                name = "customVar",
                DataType = "varchar",
                MaxLength = 50,
                Precision = 0,
                Scale = 0,
                IsNullable = true
            };

            var scriptExpectation = string.Format("CREATE DOMAIN {0} AS {1}({2}){3};\r\n",
                schemaInfo.name, "varchar", schemaInfo.MaxLength, "");

            var scriptActual = scriptBuilder.CreateScriptUDT(schemaInfo);

            Assert.AreEqual(scriptExpectation, scriptActual);
        }

        [TestMethod]
        public void CreateUdtScript_DecimalTest()
        {
            var scriptBuilder = new PstScriptBuilder();
            var schemaInfo = new UDTSchemaInfoData
            {
                name = "customVar",
                DataType = "decimal",
                MaxLength = 50,
                Precision = 18,
                Scale = 2,
                IsNullable = true
            };

            var scriptExpectation = string.Format("CREATE DOMAIN {0} AS {1}({2},{3}){4};\r\n",
                schemaInfo.name, "numeric", schemaInfo.Precision, schemaInfo.Scale, "");

            var scriptActual = scriptBuilder.CreateScriptUDT(schemaInfo);

            Assert.AreEqual(scriptExpectation, scriptActual);
        }

        [TestMethod]
        public void CreateUdtScript_DefaultTest()
        {
            var scriptBuilder = new PstScriptBuilder();
            var schemaInfo = new UDTSchemaInfoData
            {
                name = "customVar",
                DataType = "bit",
                MaxLength = 50,
                Precision = 0,
                Scale = 0,
                IsNullable = true
            };

            var scriptExpectation = string.Format("CREATE DOMAIN {0} AS {1}{2};\r\n",
                schemaInfo.name, "bit(" + schemaInfo.MaxLength + ")", "");

            var scriptActual = scriptBuilder.CreateScriptUDT(schemaInfo);

            Assert.AreEqual(scriptExpectation, scriptActual);
        }

        [TestMethod]
        public void CreateTableScript()
        {
            var scriptBuilder = new PstScriptBuilder();

            var schemaData = new TableSchemaInfoData
            {
                TableName = "BOS_SD_FDO",
                ColumnName = "szId",
                OrdinalPosition = 1,
                ColumnDefault = "",
                isNullable = true,
                Domain = "BOS_DT_SZID",
                DataType = "decimal",
                CharMaxLength = 0,
                Precision = 8,
                Scale = 2,
            };

            var tempSchemaData = new tempTableData
            {
                AllTableName = "BOS_SD_FDO",
                AllColumnName = "BOS_DT_SZID (8,2) NOT NULL",
            };

      //      var scriptExpectation = string.Format("ALTER TABLE {0} ADD CONSTRAINT {1} PRIMARY KEY ({2});\r\n",
       //         "BOS_SD_FDO", "customPKName", "customColumnName");
            var scriptExpectation = string.Format("CREATE TABLE {0} (\r\n {1} );\r\n",
                               tempSchemaData.AllTableName, tempSchemaData.AllColumnName);


            var scriptActual = scriptBuilder.CreateScriptTable(tempSchemaData);

            Assert.AreEqual(scriptExpectation, scriptActual);
        }

        [TestMethod]
        public void CreatePKScript()
        {
            var scriptBuilder = new PstScriptBuilder();

            var tempSchemaData = new tempTableData
            {
                name = "customPKname",
                AllTableName = "customTableName",
                AllColumnName = "customColumnName",
            };

            var scriptExpectation = string.Format("ALTER TABLE {0} ADD CONSTRAINT {1} PRIMARY KEY ({2});\r\n",
                                   tempSchemaData.AllTableName, tempSchemaData.name, tempSchemaData.AllColumnName);

  
            var scriptActual = scriptBuilder.CreateScriptPK(tempSchemaData);

            Assert.AreEqual(scriptExpectation, scriptActual);
        }

        [TestMethod]
        public void CreateIndexScript()
        {
            var scriptBuilder = new PstScriptBuilder();

            var tempSchemaData = new tempTableData
            {
                name = "customINDEXname",
                AllTableName = "customTableName",
                AllColumnName = "customColumnName",
            };

            var scriptExpectation = string.Format("CREATE INDEX {0} ON {1} ({2});\r\n",
                         tempSchemaData.name, tempSchemaData.AllTableName, tempSchemaData.AllColumnName);

            
            var scriptActual = scriptBuilder.CreateScriptIndex(tempSchemaData);

            Assert.AreEqual(scriptExpectation, scriptActual);
        }
    }
}