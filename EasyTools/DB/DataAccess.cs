using System;
using System.Data;
using System.Data.SqlClient;
using EasyTools.Data;
using EasyTools.Interface.DB;
using EasyTools.Interface;


namespace EasyTools.DB
{
    public class DataAccess : IDataAccess
    {
        private readonly IDbConnection dbConnection;
        private readonly IDbCommand dbCommand;
        private readonly IDbDataAdapter dbDataAdapter;

        public DataAccess(IDbConnection dbConnection, IDbCommand dbCommand, IDbDataAdapter dbDataAdapter)
        {
            this.dbConnection = dbConnection;
            this.dbCommand = dbCommand;
            this.dbDataAdapter = dbDataAdapter;
        }

        public DataTable GetDataTable(DBData dbData, string sql)
        {
            Console.WriteLine("GetDataTable : " +
                              "\r\n {0} " +
                              "\r\n " +
                              "SQL : " +
                              "\r\n {1}", 
                              dbData, sql);
            Validate(dbData);

            DataSet dataSet = new DataSet("DataQuery");

            string strConnection = @"Server=" + dbData.serverName + ";Database=" + dbData.dbName + ";User Id=" +
                                   dbData.userName + ";Password=" + dbData.password + ";";
            dbConnection.ConnectionString = strConnection;

            if(dbConnection.State != ConnectionState.Open)
                dbConnection.Open();

            dbCommand.Connection = dbConnection;
            dbCommand.CommandText = sql;


            dbDataAdapter.SelectCommand = dbCommand;
            dbDataAdapter.Fill(dataSet);

            dbConnection.Close();

            Console.WriteLine("GetDataTable Result : " + dataSet.Tables[0].Rows.Count);
            return dataSet.Tables[0];
        }

        public void Execute(DBData dbData, string sql)
        {
            Console.WriteLine("Execute : " + dbData + sql);
            throw new NotImplementedException();
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

