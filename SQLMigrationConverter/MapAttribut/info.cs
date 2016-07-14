using System.Data;
using System.Collections.Generic;
using SQLMigration.Data;

namespace SQLMigrationConverter.MapAttribut
{
    public interface IInfo
    {
      //  List<Column> GetAllColumns();
        List<mUDT> GetAllUdts();
      //  List<mPK> GetAllPk();
    }

    public class Info : IInfo
    {
        private readonly IInfoQuery infoQuery;
        public Info(IInfoQuery infoQuery)
        {
            this.infoQuery = infoQuery;
        }

        List<T> GetDataQuery<T>(string sql) where T : Base, new()
        {
            var list = new List<T>();
            if (list.Count == 0)
            {
                var dataTable = new DataAccess().GetDataTable(sql);
                foreach (DataRow data in dataTable.Rows)
                {
                    var obj = new T();
                    obj.GetValueFromDataRow(data);
                    list.Add(obj);
                }
            }
            return list;
        }


        //public List<Column> GetAllColumns()
        //{
        //    return GetDataQuery<Column>(infoQuery.GetColumns());
        //}
        //public List<mPK> GetAllPk()
        //{
        //    return GetDataQuery<mPK>(infoQuery.GetTablesPKs());
        //}

        public List<mUDT> GetAllUdts()
        {
            return GetDataQuery<mUDT>(infoQuery.GetUdts());
        }

    }
}
