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
        private IDbConnection dbConnection;
        private IDbCommand dbCommand;
        private IDbDataAdapter dbDataAdapter;

        public DataAccess(IDbConnection dbConnection, IDbCommand dbCommand, IDbDataAdapter dbDataAdapter)
        {
            this.dbConnection = dbConnection;
            this.dbCommand = dbCommand;
            this.dbDataAdapter = dbDataAdapter;
        }

        public DataTable GetDataTable(DBData dbData, string sql)
        {
            Validate(dbData);
            
            DataSet dataSet = new DataSet("DataQuery");

            string strConnection = @"Server=" + dbData.serverName + ";Database=" + dbData.dbName + ";User Id=" +
                                   dbData.userName + ";Password=" + dbData.password + ";";
            dbConnection.ConnectionString = strConnection;


            dbConnection.Open();

            dbCommand.Connection = dbConnection;
            dbCommand.CommandText = sql;


            dbDataAdapter.SelectCommand = dbCommand;
            dbDataAdapter.Fill(dataSet);

            return dataSet.Tables[0];
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

