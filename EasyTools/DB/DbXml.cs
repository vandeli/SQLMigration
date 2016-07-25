using EasyTools.Data;
using EasyTools.Interface.DB;
using EasyTools.Interface.IO;
using System;
using System.Collections.Generic;
using System.IO;
using System.Xml.Serialization;

namespace EasyTools.DB
{
    public class DbXml : ICoreDB
    {
        private XmlSerializer xml;
        private readonly string filePath;
        private readonly IFileManager fileManager;

        public DbXml(string filePath, IFileManager fileManager)
        {
            this.filePath = filePath;
            this.fileManager = fileManager;
        }

        public void DropTable<T>() where T : BaseData => fileManager.DeleteFile(filePath);

      public void CreateTable<T>() where T : BaseData
        {
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


        public T Find<T>(string rowKey) where T : BaseData, new()
        {
            var list = GetList<T>();
            return list?.Find(x => x.id == rowKey);
        }

        public List<T> GetList<T>() where T : BaseData, new()
        {
            xml = new XmlSerializer(typeof(List<T>));
            var stream = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            var list = (List<T>)xml.Deserialize(stream);
            stream.Close();
            return list;
        }

        public void Update<T>(T model) where T : BaseData, new()
        {
            var list = GetList<T>();
            var data = list.Find(x => x.id == model.id);
            list.Remove(data);
            list.Add(model);
            var writer = GetWriter<T>();
            xml.Serialize(writer, list);
            writer.Close();
        }

        public void Delete<T>(T model) where T : BaseData, new()
        {
            var list = GetList<T>();
            var data = list.Find(x => x.id == model.id);
            list.Remove(data);
            var writer = GetWriter<T>();
            xml.Serialize(writer, list);
            writer.Close();
        }

        public void Insert<T>(T model) where T : BaseData, new()
        {
            var list = GetList<T>();
            if (list.Exists(x => x.id == model.id))
            {
                Update(model);
                return;
            }

            list.Add(model);
            var writer = GetWriter<T>();
            xml.Serialize(writer, list);
            writer.Close();
        }

    }

}
