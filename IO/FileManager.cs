using System.Collections.Generic;
using System.Linq;
using System;
using System.IO;


namespace SQLMigration.IO
{
    public interface IFileManager
    {
        void CreateFile(string value, string path);
        string ReadFile(string path);      
        void DeleteFile(string path);
        bool Exist(string path);       
    }

    public interface IFileReader
    {
        string ReadFile(string path);
    }

    public class FileManager : IFileManager, IFileReader
    {
        private static void RemoveAttributeReadOnly(string destpath)
        {
            var attributes = File.GetAttributes(destpath);

            if ((attributes & FileAttributes.ReadOnly) != FileAttributes.ReadOnly) return;
            attributes = RemoveAttribute(attributes, FileAttributes.ReadOnly);
            File.SetAttributes(destpath, attributes);
            Console.WriteLine("Removed attribute read-only : " + destpath);
        }

        public void CreateFile(string value, string path)
        {
            if (String.IsNullOrEmpty(value)) throw new ArgumentNullException("value");
            if (String.IsNullOrEmpty(path)) throw new ArgumentNullException("path");
            if (!Directory.Exists(Path.GetDirectoryName(path))) throw new DirectoryNotFoundException();

            Console.WriteLine("Text content : " + value);
            DeleteFile(path);
            File.WriteAllText(path, value);
            Console.WriteLine(path + " Created");
        }

        public bool Exist(string path)
        {
            return File.Exists(path);
        }
        public string ReadFile(string path)
        {
            if (String.IsNullOrEmpty(path)) throw new ArgumentNullException("path");
            if (!File.Exists(path))
                throw new FileNotFoundException(path);
            var content = File.ReadAllText(path);
            Console.WriteLine(@"Text : " + content);
            return content;
        }       

        public void DeleteFile(string path)
        {
            if (String.IsNullOrEmpty(path)) throw new ArgumentNullException("path");
            if (!File.Exists(path)) return;
            RemoveAttributeReadOnly(path);
            File.Delete(path);
            Console.WriteLine("File delete : " + path);
        }

        private static FileAttributes RemoveAttribute(FileAttributes attributes, FileAttributes attributesToRemove)
        {
            return attributes & ~attributesToRemove;
        }
    }
}
