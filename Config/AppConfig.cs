using SQLMigration.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace SQLMigration.Config
{
    public interface IAppConfig 
    {
        void SetDestination();
        void Id(String cData);
        void SetSource(ConfigData configData);
    }
   
    
    public class AppConfig : IAppConfig
    {
        private ConfigData configData;
        public void SetDestination()
        {
        }

        public void Id(String cData)
        {
            configData.Id = cData;
        }

        public void SetSource(ConfigData configData)
        {

            this.configData = configData;
            
        }

        void CheckFormat(string path)
        {
            var isMatch = Regex.IsMatch(path,
                @"^(?:[a-zA-Z]\:(\\|\/)|file\:\/\/|\\\\|\.(\/|\\))([^\\\/\:\*\?\<\>\""\|]+(\\|\/){0,1})+$");
            if (isMatch == false)
                throw new Exception("Invalid format path");
        }


       


    }
}
