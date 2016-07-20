using SQLMigration.Data;
using SQLMigrationInterface;
using SQLMigrationManager;

namespace SQLMigrationOF
{
    public  class OF
    {
      public IUDTManager GetInstanceUdtManager()
      {
        IDataAccess dataAccess = new DataAccess();
        return new UDTManager(dataAccess);
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
