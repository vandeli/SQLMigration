using EasyTools.Data;
using EasyTools.Interface.DB;
using EasyTools.Interface.IO;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
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
            Console.WriteLine("DbXml.CreateTable : " + filePath);
        }

        private TextWriter GetWriter<T>() where T : BaseData
        {
            xml = new XmlSerializer(typeof(List<T>));
            TextWriter writer = new StreamWriter(filePath);
            return writer;
        }


        public T Find<T>(string rowKey) where T : BaseData, new()
        {
            var list = JustGetList<T>();
            var data = list?.Find(x => x.id == rowKey);
            Console.WriteLine("CreateTable.Find : " + data.name + " found");
            return data;
        }

        public List<T> GetList<T>() where T : BaseData, new()
        {
            var list = JustGetList<T>();

            Console.WriteLine("DbXml.GetList : " + list.Count);
            return list;
        }

        private List<T> JustGetList<T>() where T : BaseData, new()
        {
            xml = new XmlSerializer(typeof(List<T>));
            var stream = new FileStream(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            var list = (List<T>)xml.Deserialize(stream);
            list = list.OrderByDescending(x => x.updated).ToList();
            stream.Close();
            return list;
        }

        public void Update<T>(T model) where T : BaseData, new()
        {
            var list = JustGetList<T>();
            var data = list.Find(x => x.id == model.id);
            if (data == null)
                throw new Exception("data not found");
            list.Remove(data);
            model.updated = DateTime.Now;
            list.Add(model);
            var writer = GetWriter<T>();
            xml.Serialize(writer, list);
            writer.Close();
            Console.WriteLine("DbXml.Update : " + model.name);
        }

        public void Delete<T>(T model) where T : BaseData, new()
        {
            var list = JustGetList<T>();
            var data = list.Find(x => x.id == model.id);
            list.Remove(data);
            var writer = GetWriter<T>();
            xml.Serialize(writer, list);
            writer.Close();
            Console.WriteLine("DbXml.Delete : " + model.name);
        }

        public void Insert<T>(T model) where T : BaseData, new()
        {
            var list = JustGetList<T>();
            if (list.Exists(x => x.id == model.id))
            {
                Update(model);
                return;
            }

            list.Add(model);
            var writer = GetWriter<T>();
            xml.Serialize(writer, list);
            writer.Close();
            Console.WriteLine("DbXml.Insert : " + model.name);
        }

    }

}
