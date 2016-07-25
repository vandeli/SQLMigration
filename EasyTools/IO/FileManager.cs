using EasyTools.Interface.IO;
using System;
using System.IO;


namespace EasyTools.IO
{
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
            if (string.IsNullOrEmpty(value)) throw new ArgumentNullException(nameof(value));
            if (string.IsNullOrEmpty(path)) throw new ArgumentNullException(nameof(path));
            if (!Directory.Exists(Path.GetDirectoryName(path))) throw new DirectoryNotFoundException();

            Console.WriteLine("Text content : " + value);
            DeleteFile(path);
            File.WriteAllText(path, value);
            Console.WriteLine(path + " Created");
        }

        public bool Exist(string path) => File.Exists(path);

      public string ReadFile(string path)
        {
            if (string.IsNullOrEmpty(path)) throw new ArgumentNullException(nameof(path));
            if (!File.Exists(path))
                throw new FileNotFoundException(path);
            var content = File.ReadAllText(path);
            Console.WriteLine(@"Text : " + content);
            return content;
        }

        public void DeleteFile(string path)
        {
            if (string.IsNullOrEmpty(path)) throw new ArgumentNullException(nameof(path));
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
