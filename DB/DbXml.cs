using System;
using System.Collections.Generic;
using System.Linq;
using SQLMigration.Data;
using SQLMigration.IO;
using System.IO;

using System.Xml.Serialization;

namespace SQLMigration.DB
{
    public interface ICoreDB
    {
        void CreateTable<T>() where T : BaseData;
        void CreateConfig(ConfigData configdata);
        void Update<T>(T model) where T : BaseData, new();
        ConfigData GetConfig();
        List<T> GetList<T>() where T : BaseData, new();
    }

    public class DbXml : ICoreDB
    {
        private XmlSerializer xml;
        private readonly string filePath;
        private readonly IFileManager fileManager;
        public DbXml(string filePath, IFileManager fileManager)
        {
            Console.WriteLine("Initiate DBXml");
            this.filePath = filePath;
            this.fileManager = fileManager;
        }

        public void CreateConfig(ConfigData configdata)
        {
            Console.WriteLine("Create file xml : " + filePath);
            if (File.Exists(filePath)) return;
            xml = new XmlSerializer(typeof(ConfigData));
            TextWriter writer = new StreamWriter(filePath);
            xml.Serialize(writer, configdata);
            writer.Close();
        }

        public ConfigData GetConfig()
        {
            ConfigData overview = null;
            if (File.Exists(filePath))
            {
                var reader = new System.Xml.Serialization.XmlSerializer(typeof(ConfigData));
                var file = new System.IO.StreamReader(filePath);
                overview = (ConfigData)reader.Deserialize(file);
                file.Close();
            }
            return overview;
        }

        public void CreateTable<T>() where T : BaseData
        {
            Console.WriteLine("Create file xml : " + filePath);
            if (File.Exists(filePath)) return;
            var writer = GetWriter<T>();
            var list = Activator.CreateInstance<List<T>>();
            xml.Serialize(writer, list);
            writer.Close();
        }

        private TextWriter GetWriter<T>() where T : BaseData
        {

            xml = new XmlSerializer(typeof(List<T>));
            TextWriter writer = new StreamWriter(filePath);
            return writer;
        }

        public List<T> GetList<T>() where T : BaseData, new()
        {
            Console.WriteLine("Get list item xml : " + filePath);
            xml = new XmlSerializer(typeof(List<T>));
            var stream = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            if (stream.Length == 0)
                return new List<T>();
            var list = ((List<T>)xml.Deserialize(stream)).OrderByDescending(x => x.updated).ToList();
            stream.Close();
            return list;
        }

        public void Update<T>(T model) where T : BaseData, new()
        {
            Console.WriteLine("Update data : " + model.rowKey);
            var list = GetList<T>();
            if (list.Count > 0)
            {
                var data = list.Find(x => x.rowKey == model.rowKey);
                if (data != null)
                {
                    list.Remove(data);
                }
            }

        }
    }
}