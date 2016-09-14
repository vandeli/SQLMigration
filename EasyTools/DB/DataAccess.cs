using EasyTools.Data;
using EasyTools.Interface.DB;
using System;
using System.Data;

using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Forms;

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

        public void GetDataSet(DBData dbData, string sql, String[] tableName)
        {
            Console.WriteLine("DataAccess.GetDataTable : " + dbData.name + ", Start");
            Validate(dbData);

            //DataSet dataSet = new DataSet("DataQuery");

            string strConnection = @"Server=" + dbData.serverName + ";Database=" + dbData.dbName + ";User Id=" +
                                   dbData.userName + ";Password=" + dbData.password + ";";
            dbConnection.ConnectionString = strConnection;

            if (dbConnection.State != ConnectionState.Open)
                dbConnection.Open();

            dbCommand.Connection = dbConnection;
            string[] SqlLines = Regex.Split(sql, "\r\n");
            var n = 0;
            foreach (string sqlCommand in SqlLines)
            {
               if (sqlCommand == "")
                {
                    dbConnection.Close();
                    return;
                }
                DataSet dataSet = new DataSet("DataQuery");
                
                dbCommand.CommandText = sqlCommand;
                dbDataAdapter.SelectCommand = dbCommand;
              
                dbDataAdapter.Fill(dataSet);
                if (dataSet == null)
                {
                    return;
                }
                addEmptyElementsToXML(dataSet);
                dataSet.WriteXmlSchema("D:\\tempMigration\\" + tableName[n] + ".xsd");
                dataSet.WriteXml("D:\\tempMigration\\" + tableName[n] + ".xml");//, XmlWriteMode.WriteSchema);
                dbCommand.Dispose();
                dataSet.Clear();
                n += 1;
                
            }
            
            dbConnection.Close();
            //dbCommand.CommandText = SqlLines;
            //dbDataAdapter.SelectCommand = dbCommand;

            //for (var i = 0; i < tableName.Length; i++)
            //{
            //    if (i == 0 )
            //        dbDataAdapter.TableMappings.Add("Table", tableName[i]);
            //    else
            //        dbDataAdapter.TableMappings.Add("Table"+ i.ToString(), tableName[i]);

            //}
            //  dbCommand.Dispose();
            //dbDataAdapter.Fill(dataSet);

            //dbConnection.Close();

      //      Console.WriteLine("DataAccess.GetDataTable : " + dataSet.Tables.Count + ", Done");
     //       return dataSet;

        }

        //public string GetDataSet(DBData dbData, string sql, String[] tableName)
        //{
        //    var result = "";
        //    Console.WriteLine("DataAccess.GetDataTable : " + dbData.name + ", Start");
        //    Validate(dbData);

        //    //DataSet dataSet = new DataSet("DataQuery");

        //    string strConnection = @"Server=" + dbData.serverName + ";Database=" + dbData.dbName + ";User Id=" +
        //                           dbData.userName + ";Password=" + dbData.password + ";";

        //    var nquery = sql + tableName[0];

        //    SqlConnection SqlCon = new SqlConnection(strConnection);

        //    SqlDataReader SqlDr;

        //    SqlCon.Open();
        //    SqlCommand SqlCmd = SqlCon.CreateCommand();

        //    SqlCmd.CommandText = sql;

        //    SqlDr = SqlCmd.ExecuteReader();
        //    SqlDr.Read();
        //    //string sampleText = "ini deli";

        //    //byte[] byteData = Encoding.UTF8.GetBytes(sampleText);
        //    //SqlCommand insertCommand = new SqlCommand(sql, SqlCon);
        //    //SqlParameter sqlParam = insertCommand.Parameters.AddWithValue("@BinData", byteData);
        //    //sqlParam.DbType = DbType.Binary;
        //    //insertCommand.ExecuteNonQuery();

        //    // int i = 0;
        //    //  var bnColumn = "";
        //    //while (i < SqlDr.FieldCount)
        //    //{
        //    //    if (SqlDr.GetDataTypeName(i) == "binary")
        //    //    {
        //    //        bnColumn = SqlDr.GetName(i).ToString();
        //    //    }
        //    //    i++;
        //    //}
        //    //if (SqlDr.Read())
        //    //{
        //    //byte[] byteData = (byte[])SqlDr[0];
        //    //string strData = Encoding.UTF8.GetString(byteData);
        //    //  MessageBox.Show(strData);
        //    //   }
        //    //byte[] myBytes = new byte[50];
        //    //long bytesRead = SqlDr.GetBytes(SqlDr.GetOrdinal("binar"), 0, myBytes, 0, 50);
        //    //byte[] byteData = (byte[])SqlDr[0];
        //    //string strData = Encoding.UTF8.GetString(byteData);
        //    //MessageBox.Show(strData);
        //    //   FileStream fs = new FileStream("D:\\tempMigration\\1textVersion.txt", FileMode.Create);
        //    //  fs.Write(myBytes, 0, (int)bytesRead);
        //    //{ System.Windows.Forms.MessageBox.Show(SqlDr.GetName(i) + " " + SqlDr.GetDataTypeName(i)); i++; }



        //    using (SqlDr)
        //    {

        //        DataTable dtTesting = new DataTable("DTBinary");
        //        dtTesting.Load(SqlDr);

        //        dtTesting.WriteXml("D:\\tempMigration\\" + "1testing" + ".xml");
        //    }


        //    //if (SqlDr.FieldCount != 0)
        //    //    result = "ada";
        //    //else
        //    //    result = "kosong";

        //    SqlCon.Close();

        //    return result;
        //}



        private void addEmptyElementsToXML(DataSet dataSet)
        {
            foreach (DataTable dataTable in dataSet.Tables)
            {
                foreach (DataRow dataRow in dataTable.Rows)
                {
                    for (int j = 0; j < dataRow.ItemArray.Length; j++)
                    {
                        if (dataRow.ItemArray[j] == DBNull.Value)
                        
                            dataRow.SetField(j,0);
                    }
                }
            }
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

