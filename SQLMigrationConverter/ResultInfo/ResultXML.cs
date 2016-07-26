using System;
using System.IO;
using System.Xml.Serialization;
using System.Data;
using System.Windows.Forms;
using System.Collections.Generic;


namespace SQLMigrationConverter.ResultInfo
{
    public interface ICoreResult
    {
        void CreateResult(DataTable configdata);
        void CreatePgSql(String PgQuery);
    }
    public class ResultXML : ICoreResult
    {
      
        private readonly string filePath;

        public ResultXML(string filePath)
        {
            Console.WriteLine("Initiate SchemaXml");
            this.filePath = filePath;

        }        

        public void CreateResult(DataTable datasource)
        {          

            if (datasource.Rows.Count != 0)
            {
                if (Directory.Exists(Path.GetDirectoryName(filePath)))
                {
                    File.Delete(filePath);
                }

                datasource.WriteXml(filePath, true);
                MessageBox.Show("Result created " + filePath);
            }
        }

        public void CreatePgSql(String PgQuery)
        {
            if (Directory.Exists(Path.GetDirectoryName(filePath)))
            {
                File.Delete(filePath);
            }
            using (var sw = File.CreateText(filePath))
            {
                sw.Write(PgQuery);
            }
            MessageBox.Show("UDT PGSCRIPT created " + filePath);
        }

     
    }
}
