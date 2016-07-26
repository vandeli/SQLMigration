using System;
using System.Collections.Generic;

namespace EasyTools.Data
{
    public class DBData : BaseData
    {
        public String serverName = "";
        public String userName = "";
        public String password = "";
        public String dbName = "";

        public static implicit operator List<object>(DBData v)
        {
            throw new NotImplementedException();
        }
    }


}
