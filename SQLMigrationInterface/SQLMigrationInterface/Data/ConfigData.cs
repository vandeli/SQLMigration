

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
            name = "";
            OutputPath = "";
            updated =  DateTime.Now;
            id = Guid.NewGuid().ToString();

            listUDTSchemaInfo = new List<UDTSchemaInfoData>();
            listTableSchemaInfo = new List<TableSchemaInfoData>();
            listPKSchemaInfo = new List<PKSchemaInfoData>();
            listIndexSchemaInfo = new List<IndexSchemaInfoData>();
            listSPSchemaInfo = new List<SPSchemaInfoData>();

            listUDTResultInfo = new List<UDTResultData>();          
            listTableResultInfo = new List<TableResultData>();
            listPKResultInfo = new List<PKResultData>();
            listIndexResultInfo = new List<IndexResultData>();
            listSPResultInfo = new List<SPResultData>();
            //allSchemaInfo = new AllSchemaInfoData();
            //allResultInfo = new AllResultData(); 



        }
        
        public DBData Destination { get; set; }
        public string OutputPath { get; set; }
        public DBData Source { get; set; }

        public List<UDTSchemaInfoData> listUDTSchemaInfo { get; set; }
        public List<TableSchemaInfoData> listTableSchemaInfo { get; set; }
        public List<PKSchemaInfoData> listPKSchemaInfo { get; set; }
        public List<IndexSchemaInfoData> listIndexSchemaInfo { get; set; }
        public List<SPSchemaInfoData> listSPSchemaInfo { get; set; }

        public List<UDTResultData> listUDTResultInfo { get; set; }       
        public List<TableResultData> listTableResultInfo { get; set; }
        public List<PKResultData> listPKResultInfo { get; set; }
        public List<IndexResultData> listIndexResultInfo { get; set; }
        public List<SPResultData> listSPResultInfo { get; set; }

        //public AllSchemaInfoData allSchemaInfo { get; set; }
        //public AllResultData allResultInfo { get; set; }

        public override string ToString()
        {
            return string.Format("ConfigData => {0} OutputPath: {12} , \r\n " +
                                 "Destination: {1}, Source: {13}, \r\n" +
                                 "listUDTResultInfo: {2}, listTableResultInfo: {3}" +
                                 "listUDTSchemaInfo: {4}, listTableSchemaInfo: {5}" +
                                 "listPKSchemaInfo: {6}, listPKSchemaInfo: {7}",
                                 "listIndexSchemaInfo: {8}, listIndexSchemaInfo: {9}",
                                 "listIndexSchemaInfo: {10}, listIndexSchemaInfo: {11}",
                base.ToString(), Destination, listUDTResultInfo.Count,listTableResultInfo.Count, listPKResultInfo.Count, listIndexResultInfo.Count, listSPResultInfo.Count,listUDTSchemaInfo.Count, listTableSchemaInfo.Count, listPKSchemaInfo.Count, listIndexSchemaInfo.Count,listSPSchemaInfo , OutputPath, Source);
        }
    }
}
