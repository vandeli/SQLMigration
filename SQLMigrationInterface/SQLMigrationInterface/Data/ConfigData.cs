

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
            updated =  DateTime.Now;
            id = Guid.NewGuid().ToString();
            listUDTSchemaInfo = new List<UDTSchemaInfoData>();
            listUDTResultInfo = new List<UDTResultData>();
            listTableSchemaInfo = new List<TableSchemaInfoData>();
            listTableResultInfo = new List<TableResultData>();

            //allSchemaInfo = new AllSchemaInfoData();
            //allResultInfo = new AllResultData(); 
            
            name = "";

        }
        
        public DBData Destination { get; set; }
        public string OutputPath { get; set; }
        public DBData Source { get; set; }

        public List<UDTSchemaInfoData> listUDTSchemaInfo { get; set; }
        public List<UDTResultData> listUDTResultInfo { get; set; }
        public List<TableSchemaInfoData> listTableSchemaInfo { get; set; }
        public List<TableResultData> listTableResultInfo { get; set; }
        //public AllSchemaInfoData allSchemaInfo { get; set; }
        //public AllResultData allResultInfo { get; set; }

        public override string ToString()
        {
            return string.Format("ConfigData => {0} OutputPath: {6} , \r\n " +
                                 "Destination: {1}, Source: {7}, \r\n" +
                                 "listUDTResultInfo: {2}, listTableResultInfo: {3}" +
                                 "listUDTSchemaInfo: {4}, listTableSchemaInfo: {5}", 
                base.ToString(), Destination, listUDTResultInfo.Count,listTableResultInfo.Count, listUDTSchemaInfo.Count, listTableSchemaInfo.Count, OutputPath, Source);
        }
    }
}
