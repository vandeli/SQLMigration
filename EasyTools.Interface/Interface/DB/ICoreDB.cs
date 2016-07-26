using System;
using System.Collections.Generic;
using EasyTools.Data;


namespace EasyTools.Interface.DB
{
    public interface ICoreDB
    {
        void CreateTable<T>() where T : BaseData;
        void DropTable<T>() where T : BaseData;
        T Find<T>(String rowKey) where T : BaseData, new();
        void Update<T>(T model) where T : BaseData, new();
        void Delete<T>(T model) where T : BaseData, new();
        void Insert<T>(T model) where T : BaseData, new();
        List<T> GetList<T>() where T : BaseData, new();
    }

}
