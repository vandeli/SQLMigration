//using System;
//using Microsoft.VisualStudio.TestTools.UnitTesting;
//using SQLMigrationInterface;
//using SQLMigrationManager;
//using SQLMigration.Data;

//namespace SQLMigrationTest
//{
//    [TestClass]
//    public class UDTManagerTest
//    {
//        private readonly IManager udtManager;


//        public UDTManagerTest()
//        {
//            udtManager = new UDTManager();
//        }

//        [TestMethod]
//        public void GetSource()
//        {
//            var param = new DBData
//            {
//                dbName = "Padma_Live",
//                password = "12345",
//                serverName = @"KEA-IBNU\SQLSERVER2012",
//                userName = "sa"

//            };
//            udtManager.GetSchema(param);
//            Assert.IsFalse(true);
//        }

//        [TestMethod]
//        public void Restore_null()
//        {
//            try
//            {
//                udtManager.GetSchema(null);
//                Assert.IsFalse(true);
//            }
//            catch (Exception ex)
//            {
//                Assert.AreEqual(new ArgumentNullException("param").Message, ex.Message);
//            }

//        }

//        [TestMethod]
//        public void Restore_DbnameEmpty()
//        {
//            try
//            {
//                var param = new DBData
//                {
//                    dbName = "",
//                    password = "123456",
//                    serverName = @"localhost\sqlserver2012",
//                    userName = "sa"

//                };
//                udtManager.GetSchema(param);
//                Assert.IsFalse(true);
//            }
//            catch (Exception ex)
//            {
//                Assert.AreEqual(new ArgumentNullException("param.dbName").Message, ex.Message);
//            }

//        }

//        [TestMethod]
//        public void Restore_PasswordEmpty()
//        {
//            try
//            {
//                var param = new DBData
//                {
//                    dbName = "TestRestore",
//                    password = "",
//                    serverName = @"localhost\sqlserver2012",
//                    userName = "sa"

//                };
//                udtManager.GetSchema(param);
//                Assert.IsFalse(true);
//            }
//            catch (Exception ex)
//            {
//                Assert.AreEqual(new ArgumentNullException("param.password").Message, ex.Message);
//            }

//        }

//        [TestMethod]
//        public void Restore_ServerNameEmpty()
//        {
//            try
//            {
//                var param = new DBData
//                {
//                    dbName = "TestRestore",
//                    password = "123456",
//                    serverName = @"",
//                    userName = "sa"

//                };
//                udtManager.GetSchema(param);
//                Assert.IsFalse(true);
//            }
//            catch (Exception ex)
//            {
//                Assert.AreEqual(new ArgumentNullException("param.serverName").Message, ex.Message);
//            }
//        }



//        [TestMethod]
//        public void Restore_UsernameEmpty()
//        {
//            try
//            {
//                var param = new DBData
//                {
//                    dbName = "TestRestore",
//                    password = "123456",
//                    serverName = @"localhost\sqlserver2012",
//                    userName = ""

//                };
//                udtManager.GetSchema(param);
//                Assert.IsFalse(true);
//            }
//            catch (Exception ex)
//            {
//                Assert.AreEqual(new ArgumentNullException("param.userName").Message, ex.Message);
//            }
//        }
//    }
//}
