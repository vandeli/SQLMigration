
using SQLMigration.Interface.Data.ResultInfo;
using SQLMigration.Interface.Data.SchemaInfo;
using System;
using System.Collections.Generic;
using EasyTools.Data;

namespace SQLMigration.Interface.Data
{

    public class ConfigData : BaseData
    {
        public ConfigData()
        {
            OutputPath = "";
            updated = string.Format("{0:dd/MM/yyy HH:mm:ss}", DateTime.Now);
            id = Guid.NewGuid().ToString();  
            listUDTSchemaInfo = new List<UDTSchemaInfoData>();
            listUDTResultInfo = new List<UDTResultData>();
            name = "";
        }
        public DBData Destination { get; set; }
        public string OutputPath { get; set; }
        public DBData Source { get; set; }

        public List<UDTSchemaInfoData> listUDTSchemaInfo { get; set; }
        public List<UDTResultData> listUDTResultInfo { get; set; }


    }
}
