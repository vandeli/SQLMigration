using SQLMigrationInterface;
using SQLMigrationConverter.MapAttribut;
using SQLMigrationConverter.ResultInfo;

namespace SQLMigrationConverter.Template
{
    public class cUDT : IBaseConvert
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
            ResultItemData resultItem = new ResultItemData();

            var result = "";
            var tableResult = "";
            foreach (var data in info.GetAllUdts())
            {
                tableResult = getTemplate(data);
                resultItem.sqlString = tableResult;
                //   onGenerate(this, new ConvertEventArgs() { Script = tableResult });
                result += tableResult;
            }
            return result;
          
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
