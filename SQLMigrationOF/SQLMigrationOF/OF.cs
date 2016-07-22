using SQLMigration.Data;
using SQLMigration.DB;
using SQLMigration.IO;
using SQLMigrationInterface;
using SQLMigrationManager;

namespace SQLMigrationOF
{
    public  class OF
    {
      public IUDTManager GetInstanceUdtManager(string SchemaPath)
      {
        var file = new FileManager();
            IFileManager fileManager = file;
            IFileReader fileReader = file;
            ICoreDB db = new DbXml(@"Config.xml", fileManager);
            ICoreDB udtSchema = new DbXml(SchemaPath, fileManager);
            IDataAccess dataAccess = new DataAccess();
        return new UDTManager(fileManager, db, udtSchema, dataAccess);
      }

      public ITableManager GetInstanceTableManager()
      {        
          
            IDataAccess dataAccess = new DataAccess();
            return new TableManager(dataAccess);
        }

      public IPKManager GetInstancePkManager()
      {        
         
            IDataAccess dataAccess = new DataAccess();
            return new PKManager(dataAccess);
      }

      public IndexManager GetInstanceIndexManager()
      {
        IDataAccess dataAccess = new DataAccess();
        return new IndexManager(dataAccess);
      }


    }
}
