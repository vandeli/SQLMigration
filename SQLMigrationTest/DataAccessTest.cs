using EasyTools.Data;
using EasyTools.Interface;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using SQLMigration;
using SQLMigration.Data;

namespace SQLMigrationTest
{
    [TestClass]
    public class DataAccessTest
    {
        [TestMethod]
        public void GetDataTableTest()
        {
            var dataAccess = new DataAccess();
            var configData = new ConfigData()
            {
                name = "Test",
                Source = new DBData
                {
                    name = "SQLSERVER",
                    dbName = "master",
                    serverName = "localhost",
                    userName = "sa",
                    password = "123456"
                }
            };
            var datatable = dataAccess.GetDataTable(configData.Source, @"SELECT st.NAME
				,bs.[name] AS data_type
				,st.max_length
				,st.precision
				,st.scale
				,st.is_nullable
			FROM sys.types st
			INNER JOIN sys.schemas ss ON st.[schema_id] = ss.[schema_id]
			INNER JOIN sys.types bs ON bs.[user_type_id] = st.[system_type_id]
			ORDER BY st.[name]
				,ss.[name]");

            Assert.IsNotNull(datatable);
            Assert.IsTrue(datatable.Columns.Count > 0);
            Assert.IsTrue(datatable.Rows.Count > 0);
        }
    }
}
