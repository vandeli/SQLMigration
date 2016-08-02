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
            var usedList = new UsedColumn()
            {
                ColumnName = "CustomColumnName",
                OrdinalPosition = 1,
                ColumnDefault = "",
                isNullable = false,
                Domain = "",
                DataType = "numeric",
                CharMaxLength = 0,
                Precision = 8,
                Scale = 2
            };

            var schemaData = new TableSchemaInfoData
            {
                TableName = "BOS_SD_FDO",
                usedColumnList = new List<UsedColumn> { usedList}
            };
                
            var scriptExpectation = string.Format("CREATE TABLE {0} (\r\n {1} );\r\n",
                               schemaData.TableName, "CustomColumnName numeric (8,2)  NOT NULL\r\n");

            var scriptActual = scriptBuilder.CreateScriptTable(schemaData);

            Assert.AreEqual(scriptExpectation, scriptActual);
        }

        [TestMethod]
        public void CreatePKScript()
        {
            var scriptBuilder = new PstScriptBuilder();
            var usedList = new UsedColumn()
            {
                ColumnName = "CustomColumnName",
             };

            var schemaData = new PKSchemaInfoData
            {
                TableName = "BOS_SD_FDO",
                PkName = "customPKname",
                usedColumnList = new List<UsedColumn> { usedList }
            };

            var scriptExpectation = string.Format("ALTER TABLE {0} ADD CONSTRAINT {1} PRIMARY KEY ({2});\r\n",
                                   schemaData.TableName, schemaData.PkName, "CustomColumnName");

  
            var scriptActual = scriptBuilder.CreateScriptPK(schemaData);

            Assert.AreEqual(scriptExpectation, scriptActual);
        }

        [TestMethod]
        public void CreateIndexScript()
        {
            var scriptBuilder = new PstScriptBuilder();

            var usedList = new UsedColumn()
            {
                ColumnName = "CustomColumnName",
            };

            var schemaData = new IndexSchemaInfoData
            {
                TableName = "BOS_SD_FDO",
                IndexName = "customIndexName",
                usedColumnList = new List<UsedColumn> { usedList }
            };

          
            var scriptExpectation = string.Format("CREATE INDEX {0} ON {1} ({2});\r\n",
                         schemaData.IndexName, schemaData.TableName, "CustomColumnName");

            
            var scriptActual = scriptBuilder.CreateScriptIndex(schemaData);

            Assert.AreEqual(scriptExpectation, scriptActual);
        }
    }
}