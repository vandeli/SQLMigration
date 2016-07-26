using System;

namespace EasyTools.Data
{
    public class DBData : BaseData
    {
        public String serverName = "";
        public String userName = "";
        public String password = "";
        public String dbName = "";


        public override string ToString()
        {
            return string.Format("DBData => {0}, DbName: {1}, Password: {2}, ServerName: {3}, UserName: {4}", 
                base.ToString(), dbName, "*****", serverName, userName);
        }
    }


}
