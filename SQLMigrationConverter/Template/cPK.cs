using SQLMigrationInterface;
using SQLMigrationConverter.MapAttribut;

namespace SQLMigrationConverter.Template
{
    public class cPK : IBaseConvert 
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
            var result = "";
            var tableResult = "";
            foreach (var data in info.GetAllPk())
            {
                tableResult = getTemplate(data);
                //   onGenerate(this, new ConvertEventArgs() { Script = tableResult });
                result += tableResult;
            }
            return result;

        }

        private string getTemplate(mPK data)
        {
            var result = "";
            var infodata = data.GetConvertedDataType();
            switch (infodata)
            {
                case "decimal":
             //       result = "ALTER TABLE " + BOS_AP_ApMaster + " ADD CONSTRAINT " + PK_BOS_AP_ApMaster + "PRIMARY KEY" + "(" + szSuppId, szCcyId + ")" + ";\r\n";

                    break;

                default:
            //        result = "CREATE DOMAIN " + data.Name + " AS " + data.GetConvertedDataType() + (data.IsNullable ? "" : " NOT NULL") + ";\r\n";
                    break;
            }
            return result;
        }
    }
}
