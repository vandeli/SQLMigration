using System;
using System.Collections.Generic;

namespace EasyTools.Data
{
    public class DBData : BaseData
    {
        public String serverName { get; set; }
        public String userName { get; set; }
        public String password { get; set; }
        public String dbName { get; set; }


        public static implicit operator List<object>(DBData v)
        {
            throw new NotImplementedException();

        }
        public override string ToString()
        {
            return string.Format("DBData => {0}, DbName: {1}, Password: {2}, ServerName: {3}, UserName: {4}",
                base.ToString(), dbName, "*****", serverName, userName);

        }
    }


}
