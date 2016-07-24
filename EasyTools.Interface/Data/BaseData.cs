using System;

namespace EasyTools.Data
{
    public abstract class BaseData
    {
        public string id { get; set; }
        public string name { get; set; }
        public DateTime updated { get; set; }
    }
}
