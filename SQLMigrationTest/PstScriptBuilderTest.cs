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
                schemaInfo.name, "numeric", schemaInfo.Precision, schemaInfo.Scale,"");

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
                schemaInfo.name, "bit(" + schemaInfo.MaxLength +")", "");

            var scriptActual = scriptBuilder.CreateScriptUDT(schemaInfo);

            Assert.AreEqual(scriptExpectation, scriptActual);
        }

        [TestMethod]
        public void CreatePKScript_Ordinal1Test()
        {
            var scriptBuilder = new PstScriptBuilder();
            var schemaInfo = new PKSchemaInfoData
            {
                PkName = "customPKName",
                TableName = "customTableName",
                ColumnName = "customColumnName",
                OrdinalPosition = 1
            };

            var scriptExpectation = string.Format("ALTER TABLE {0} ADD CONSTRAINT {1} PRIMARY KEY ({2});\r\n",
                             "customTableName", "customPKName", "customColumnName");



            var scriptActual = scriptBuilder.CreateScriptPK(schemaInfo);

            Assert.AreEqual(scriptExpectation, scriptActual);
        }

        [TestMethod]
        public void CreatePKScript_Ordinal2Test()
        {
            var scriptBuilder = new PstScriptBuilder();
            var schemaInfo = new PKSchemaInfoData
            {
                PkName = "customPKName",
                TableName = "customTableName",
                ColumnName = "customColumnName",
                OrdinalPosition = 2
            };

            var scriptExpectation = string.Format("");


            var scriptActual = scriptBuilder.CreateScriptPK(schemaInfo);

            Assert.AreEqual(scriptExpectation, scriptActual);
        }


    }
}
