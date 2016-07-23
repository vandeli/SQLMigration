using System;
using System.Data;
using System.Data.SqlClient;

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

            string strConnection = @"Server=" + param.serverName + ";Database=" + param.dbName + ";User Id=" + param.userName + ";Password=" + param.password + ";";
            SqlConnection con = new SqlConnection(strConnection);
            con.Open();

            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.Connection = con;
            sqlcmd.CommandText = sql;

            var dataReader = sqlcmd.ExecuteReader();
            var dataTable = new DataTable();
            if (dataReader.HasRows)
            {

                DataColumn column = new DataColumn("SchemaID", typeof(string));
                dataTable.Load(dataReader);

                column.AllowDBNull = false;
                dataTable.Columns.Add(column);

                string[] nColumn = new string[dataTable.Columns.Count];
                int xs = 0;
                foreach (DataColumn col in dataTable.Columns)
                {
                    Console.WriteLine(col.ColumnName);
                    nColumn[xs] = col.ColumnName;
                    xs += 1;
                }

                foreach (DataRow row in dataTable.Rows)
                {
                    row["SchemaID"] = row[nColumn[0]].GetHashCode().ToString().Replace("-", "");
                }


            }
            return dataTable;
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

