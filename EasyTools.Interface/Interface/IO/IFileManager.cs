namespace EasyTools.Interface.Interface.IO
{
    public interface IFileManager
    {
        void CreateFile(string value, string path);
        string ReadFile(string path);
        void DeleteFile(string path);
        bool Exist(string path);
    }
}