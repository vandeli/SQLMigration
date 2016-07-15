﻿using SQLMigrationInterface;
using SQLMigrationConverter.MapAttribut;
using SQLMigrationConverter.ResultInfo;
using System.Data;

namespace SQLMigrationConverter.Template
{
    public class cUDT : IcUDT
    {
       // public event EventHandler onEndGenerate;
       // public event EventHandler onGenerate;
        private readonly IInfo info;
        private readonly IInfoQuery infoQuery;


        public cUDT(IInfo info, IInfoQuery infoQuery)
        {
            this.infoQuery = infoQuery;
            this.info = info;
        }

        public string CreateScript()
        {
            
            var result = "";
            var tableResult = "";
            foreach (var data in info.GetAllUdts())
            {
                tableResult = getTemplate(data);               
                result += tableResult;
            }
            return result;
          
        }
        public DataTable CreateResultXml()
        {
            ResultItemData resultItemdata = new ResultItemData();
            DataTable DTresultItem = new DataTable("ResultInfo");

            DTresultItem.Columns.Add("SchemaId", typeof(int));
            DTresultItem.Columns.Add("name", typeof(string));
            DTresultItem.Columns.Add("sqlString", typeof(string));

            DataColumn column = new DataColumn("ResultID");
            column.DataType = System.Type.GetType("System.Int32");
            column.AutoIncrement = true;
            column.AutoIncrementSeed = 10;
            column.AutoIncrementStep = 10;
            DTresultItem.Columns.Add(column);

           
           
            var tableResult = "";
            foreach (var data in info.GetAllUdts())
            {
                DataRow workRow = DTresultItem.NewRow();
                tableResult = getTemplate(data);
                workRow["SchemaId"] = data.SchemaID;
                workRow["name"] = data.Name;
                workRow["sqlString"] = tableResult;
                DTresultItem.Rows.Add(workRow);
                
            }

            return DTresultItem;
        }

        private string  getTemplate(mUDT data)
        {
            var result = "";
            var infodata = data.GetConvertedDataType();
            switch (infodata)
            {
                case "decimal":
                    result = "CREATE DOMAIN " + data.Name + " AS " + data.GetConvertedDataType() + "(" + data.Precision + "," + data.Scale + ")"  + (data.IsNullable ? "" : " NOT NULL") + ";\r\n";

                    break;

                case "varchar":
                    result = "CREATE DOMAIN " + data.Name + " AS " + data.GetConvertedDataType() + "(" + data.MaxLength + ")" + (data.IsNullable ? "" : " NOT NULL") + ";\r\n";
                    break;

                default:
                    result = "CREATE DOMAIN " + data.Name + " AS " + data.GetConvertedDataType() + (data.IsNullable ? "" : " NOT NULL") + ";\r\n";
                    break;
            }
            return result;
        }
    }
}
