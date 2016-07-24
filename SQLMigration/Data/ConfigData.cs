using SQLMigrationConverter.ResultInfo;
using SQLMigrationConverter.SchemaInfo;
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
            listSchemaInfo = new List<UDTSchemaInfoData>();
            listResultInfo = new List<UDTResultData>();
        }
        public DBData Destination { get; set; }
        public string Path { get; set; }
        public DBData Source { get; set; }

        public List<UDTSchemaInfoData> listSchemaInfo { get; set; }
        public List<UDTResultData> listResultInfo { get; set; }


    }
}
