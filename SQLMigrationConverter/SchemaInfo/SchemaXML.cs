using System;
using System.IO;
using System.Xml.Serialization;
using System.Data;

namespace SQLMigrationConverter.SchemaInfo
{
    public interface ICoreSchema
    {
       void CreateSchema(DataTable configdata);
    }
    public class SchemaXML : ICoreSchema
    {
       
        private readonly string filePath;

        public SchemaXML(string filePath)
        {
            Console.WriteLine("Initiate SchemaXml");
            this.filePath = filePath;

        }

        public void CreateSchema(DataTable datasource)
        {
            var ds = new DataSet();
            Console.WriteLine("Create Schema file xml : " + filePath);
            if (File.Exists(filePath)) return;
            ds.Tables.Add(datasource);
            ds.WriteXml(filePath);
        }
    }
}
