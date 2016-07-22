using SQLMigration.Data;
using SQLMigration.DB;
using SQLMigration.IO;
using SQLMigrationConverter.ResultInfo;
using SQLMigrationConverter.SchemaInfo;
using SQLMigrationInterface;
using SQLMigrationManager;

namespace SQLMigrationOF
{
    public  class OF
    {
      public IUDTManager GetInstanceUdtManager(ConfigData configdata)
      {
        var file = new FileManager();
            string SchemaPath = configdata.Path;
            IFileManager fileManager = file;
            IFileReader fileReader = file;
            ICoreDB db = new DbXml(@"Config.xml");
            ICoreSchema Schema = new SchemaXML(SchemaPath + configdata.Id + @"_UDTSchemaInfo.xml");
            ICoreResult Result = new ResultXML(SchemaPath + configdata.Id + @"_UDTResult.xml");
            ICoreResult PgSQL = new ResultXML(SchemaPath + configdata.Destination);
            IDataAccess dataAccess = new DataAccess();
        return new UDTManager(configdata, fileManager, db, Schema, Result, PgSQL, dataAccess);
      }

      //public ITableManager GetInstanceTableManager(ConfigData configdata)
      //{
      //      var file = new FileManager();
      //      string SchemaPath = configdata.Path + configdata.Id;
      //      IFileManager fileManager = file;
      //      IFileReader fileReader = file;
      //      ICoreDB db = new DbXml(@"Config.xml");
      //      ICoreDB Schema = new DbXml(SchemaPath + @"_TableSchemaInfo.xml");
      //      ICoreDB Result = new DbXml(SchemaPath + @"_TableResult.xml");
      //      IDataAccess dataAccess = new DataAccess();
      //      return new TableManager(configdata, fileManager, db, Schema, Result, dataAccess);
      //  }

      //public IPKManager GetInstancePkManager()
      //{        
         
      //      IDataAccess dataAccess = new DataAccess();
      //      return new PKManager(dataAccess);
      //}

      //public IndexManager GetInstanceIndexManager()
      //{
      //  IDataAccess dataAccess = new DataAccess();
      //  return new IndexManager(dataAccess);
      //}


    }
}
