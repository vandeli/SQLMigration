using System;
using System.Data;
using System.Data.SqlClient;
using EasyTools.Interface.Interface.DB;
using EasyTools.Interface.Data;


namespace EasyTools.DB
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

            //var dataReader = sqlcmd.ExecuteReader();           

            //if (dataReader.HasRows)
            //{

            //    DataColumn column = new DataColumn("SchemaID", typeof(string));
            //    result.Load(dataReader);

            //    column.AllowDBNull = false;
            //    result.Columns.Add(column);

            //    string[] nColumn = new string[result.Columns.Count];
            //    int xs = 0;
            //    foreach (DataColumn col in result.Columns)
            //    {
            //        Console.WriteLine(col.ColumnName);
            //        nColumn[xs] = col.ColumnName;
            //        xs += 1;
            //    }

            //    foreach (DataRow row in result.Rows)
            //    {
            //        row["SchemaID"] = row[nColumn[0]].GetHashCode().ToString().Replace("-", "");
            //    }


            //}
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

