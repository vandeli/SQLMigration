using System.Data;
using EasyTools.Data;
using System;

namespace EasyTools.Interface.DB
{
  public interface IDataAccess
  {
      DataTable GetDataTable(DBData dbData, string sql);
      void GetDataSet(DBData dbData, string sql, String[] tableName);
      
        void Execute(DBData dbData, string sql);

  }
}