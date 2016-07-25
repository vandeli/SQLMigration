using System.Data;
using EasyTools.Interface.Data;

namespace EasyTools.Interface.Interface.DB
{
  public interface IDataAccess
  {
    DataTable GetDataTable(DBData dbData, string sql);

  }
}