using SQLMigrationInterface;
using SQLMigrationConverter.MapAttribut;
using System.Data;
using SQLMigrationConverter.ResultInfo;
using System;
using System.Windows.Forms;

namespace SQLMigrationConverter.Template
{
    public class cPK : IcPK
    {
        private readonly IInfo info;
        private readonly IInfoQuery infoQuery;


        public cPK(IInfo info, IInfoQuery infoQuery)
        {
            this.infoQuery = infoQuery;
            this.info = info;
        }

        public string CreateScript()
        {
            string[] allcolumn = new string[1000];
            var result = "";
            var tableResult = "";
           // mPK dat = new mPK();
            allcolumn = getAllcolumn(info);
            int xs = 0;
            foreach (var data in info.GetAllPk())
            {
                if (data.OrdinalPosition == 1)
                {
                    xs += 1;
                    tableResult = getTemplate(data, allcolumn[xs]);
                    //   onGenerate(this, new ConvertEventArgs() { Script = tableResult });                    
                    result += tableResult;
                    // MessageBox.Show(xs.ToString());
                }  
                           

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
            DTresultItem.Columns.Add("ResultID", typeof(string));
               
            
            string[] allcolumn = getAllcolumn(info);
            int xs = 1;


            var tableResult = "";
            foreach (var data in info.GetAllPk())
            {
                if (data.OrdinalPosition == 1)
                {
                    DataRow workRow = DTresultItem.NewRow();
                    tableResult = getTemplate(data, allcolumn[xs]);
                    workRow["SchemaId"] = data.SchemaID;
                    workRow["name"] = data.PkName;
                    workRow["sqlString"] = tableResult;
                    workRow["ResultID"] = tableResult.GetHashCode().ToString().Replace("-", "");
                    DTresultItem.Rows.Add(workRow);
                    xs = xs++;
                }
            }

            return DTresultItem;
        }

        private string[] getAllcolumn(IInfo info)
        {
            
            string[] allColumn = new string[1000];
            int xs = 0;
           
            foreach (var data in info.GetAllPk())
            {
                if (data.OrdinalPosition == 1)
                {
                    xs += 1;
                    allColumn[xs] = data.ColumnName;
                   
                }
                else
                {
                    allColumn[xs] += "," + data.ColumnName;
                }

            }
            return allColumn;
        }

        private string getTemplate(mPK data, string allcolumn)
        {
            var result = "";       
            result = "ALTER TABLE " + data.TableName + " ADD CONSTRAINT " + data.PkName + " PRIMARY KEY" + "(" + allcolumn + ")" + ";\r\n";
            return result;
        }
    }
}
