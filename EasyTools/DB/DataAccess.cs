using EasyTools.Data;
using EasyTools.Interface.DB;
using System;
using System.Data;


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
            Console.WriteLine("DataAccess.GetDataTable : " + dbData.name + ", Start");
            Validate(dbData);

            DataSet dataSet = new DataSet("DataQuery");

            string strConnection = @"Server=" + dbData.serverName + ";Database=" + dbData.dbName + ";User Id=" +
                                   dbData.userName + ";Password=" + dbData.password + ";";
            dbConnection.ConnectionString = strConnection;

            if (dbConnection.State != ConnectionState.Open)
                dbConnection.Open();

            dbCommand.Connection = dbConnection;
            dbCommand.CommandText = sql;


            dbDataAdapter.SelectCommand = dbCommand;
            dbDataAdapter.Fill(dataSet);

            dbConnection.Close();

            Console.WriteLine("DataAccess.GetDataTable : " + dataSet.Tables[0].Rows.Count + ", Done");
            return dataSet.Tables[0];
        }

        public void Execute(DBData dbData, string sql)
        {
            Console.WriteLine("DataAccess.Execute : " + dbData + sql);
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

