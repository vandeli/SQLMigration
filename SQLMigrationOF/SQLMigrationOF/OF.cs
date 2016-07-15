using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLMigration.Data;
using SQLMigrationConverter.MapAttribut;
using SQLMigrationConverter.Template;
using SQLMigrationInterface;
using SQLMigrationManager;

namespace SQLMigrationOF
{
    public  class OF
    {
      public IUDTManager GetInstanceUdtManager()
      {
        IInfoQuery infoQuery = new InfoQuery();
        IInfo info = new Info(infoQuery);
        IcUDT cudt = new cUDT(info, infoQuery);
        IDataAccess dataAccess = new DataAccess();
        return new UDTManager(dataAccess,cudt);
      }

      public ITableManager GetInstanceTableManager()
      {
        return new TableManager();
      }

      public IPKManager GetInstancePkManager()
      {
            IInfoQuery infoQuery = new InfoQuery();
            IInfo info = new Info(infoQuery);
            IcPK cpk = new cPK(info, infoQuery);
            IDataAccess dataAccess = new DataAccess();
            return new PKManager(dataAccess,cpk);
      }

    }
}
