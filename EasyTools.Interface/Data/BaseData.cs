using System;

namespace EasyTools.Data
{
    public abstract class BaseData
    {
        public string id { get; set; }
        public string name { get; set; }
        public string updated { get; set; }

        public override string ToString()
        {
            return string.Format("id: {0}, name: {1}, updated: {2}", id, name, updated);
        }
    }
}
