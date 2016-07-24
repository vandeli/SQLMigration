
using EasyTools.Data;
using SQLMigration.Interface.ResultInfo;
using SQLMigration.Interface.SchemaInfo;
using System;
using System.Collections.Generic;

namespace SQLMigration.Data
{

    public class ConfigData : BaseData
    {
        public ConfigData()
        {
            Path = "";
            updated = DateTime.Now;
            id = DateTime.Now.GetHashCode().ToString();
            listUDTSchemaInfo = new List<UDTSchemaInfoData>();
            listUDTResultInfo = new List<UDTResultData>();
        }
        public DBData Destination { get; set; }
        public string Path { get; set; }
        public DBData Source { get; set; }

        public List<UDTSchemaInfoData> listUDTSchemaInfo { get; set; }
        public List<UDTResultData> listUDTResultInfo { get; set; }


    }
}
