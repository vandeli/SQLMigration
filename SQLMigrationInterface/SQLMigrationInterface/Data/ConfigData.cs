

using System;
using System.Collections.Generic;
using EasyTools.Data;
using SQLMigration.Data.ResultInfo;
using SQLMigration.Data.SchemaInfo;

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

        public override string ToString()
        {
            return string.Format("ConfigData => {0} OutputPath: {4} , \r\n " +
                                 "Destination: {1}, Source: {5}, \r\n" +
                                 "listUDTResultInfo: {2}, listUDTSchemaInfo: {3}", 
                base.ToString(), Destination, listUDTResultInfo.Count, listUDTSchemaInfo.Count, OutputPath, Source);
        }
    }
}
