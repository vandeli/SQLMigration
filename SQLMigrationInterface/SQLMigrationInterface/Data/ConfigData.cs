
using EasyTools.Data;

using System;
using System.Collections.Generic;
using SQLMigration.Data.ResultInfo;
using SQLMigration.Data.SchemaInfo;

namespace SQLMigration.Data
{

    public class ConfigData : BaseData
    {
        public ConfigData()
        {
            OutputPath = "";
            updated = DateTime.Now;
            id = DateTime.Now.GetHashCode().ToString();
            listUDTSchemaInfo = new List<UDTSchemaInfoData>();
            listUDTResultInfo = new List<UDTResultData>();
        }
        public DBData Destination { get; set; }
        public string OutputPath { get; set; }
        public DBData Source { get; set; }

        public List<UDTSchemaInfoData> listUDTSchemaInfo { get; set; }
        public List<UDTResultData> listUDTResultInfo { get; set; }


    }
}
