using System.Data;
using EasyTools.Data;

namespace EasyTools.Interface.DB
{
  public interface IDataAccess
  {
      DataTable GetDataTable(DBData dbData, string sql);
      void Execute(DBData dbData, string sql);

  }
}