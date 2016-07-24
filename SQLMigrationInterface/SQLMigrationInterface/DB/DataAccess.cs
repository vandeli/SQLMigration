using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq.Expressions;

namespace SQLMigration.Data
{
    public interface IDataAccess
    {
        DataTable GetDataTable(ConfigData configdata, string sql);

    }

    public class DataAccess : IDataAccess
    {
        public DataTable GetDataTable(ConfigData configdata, string sql)
        {

            DBData param = new DBData();
            param = configdata.Source;
            Validate(param);
            DataTable result = new DataTable("DataTable");
            string strConnection = @"Server=" + param.serverName + ";Database=" + param.dbName + ";User Id=" + param.userName + ";Password=" + param.password + ";";
            SqlConnection con = new SqlConnection(strConnection);


            con.Open();
            var sqlcmd = new SqlCommand
            {
                Connection = con,
                CommandText = sql
            };

            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlcmd);

            dataAdapter.Fill(result);

            return result;
        }


        private static void Validate(DBData param)
        {
            if (param == null)
                throw new ArgumentNullException("param");

            if (String.IsNullOrWhiteSpace(param.dbName))
                throw new ArgumentNullException("param.dbName");

            if (String.IsNullOrWhiteSpace(param.password))
                throw new ArgumentNullException("param.password");

            if (String.IsNullOrWhiteSpace(param.serverName))
                throw new ArgumentNullException("param.serverName");

            if (String.IsNullOrWhiteSpace(param.userName))
                throw new ArgumentNullException("param.userName");
        }

    }


}

