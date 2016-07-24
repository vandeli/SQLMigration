using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq.Expressions;
using EasyTools.Data;
using EasyTools.Interface;
using EasyTools.Interface.DB;

namespace SQLMigration
{
    public class DataAccess : IDataAccess
    {
        public DataTable GetDataTable(DBData dbData, string sql)
        {
            Validate(dbData);
            DataTable result = new DataTable("DataTable");
            string strConnection = @"Server=" + dbData.serverName + ";Database=" + dbData.dbName + ";User Id=" +
                                   dbData.userName + ";Password=" + dbData.password + ";";
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

