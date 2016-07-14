using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigrationOF
{
    public abstract class OF
    {
        bool isUsingRestFake;
        bool isUsingDbFake;
        
        public void setFakeRest()
        {
            isUsingRestFake = true;
        }

        public void setFakeDb()
        {
            isUsingDbFake = true;
        }
    }
}
