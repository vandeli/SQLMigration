using System;
using SQLMigration.Data;
using System.IO;
using System.Xml.Serialization;

namespace SQLMigration.DB
{
    public interface ICoreDB
    {
        void CreateConfig(ConfigData configdata);
                    
    }

    public class DbXml : ICoreDB
    {
        private XmlSerializer xml;
        private readonly string filePath;
      
        public DbXml(string filePath)
        {
            Console.WriteLine("Initiate DBXml");
            this.filePath = filePath;
        
        }

        public void CreateConfig(ConfigData configdata)
        {
            Console.WriteLine("Create config file xml : " + filePath);
            if (File.Exists(filePath)) return;
            xml = new XmlSerializer(typeof(ConfigData));
            TextWriter writer = new StreamWriter(filePath);
            xml.Serialize(writer, configdata);
            writer.Close();
        } 
         
      
    }
}