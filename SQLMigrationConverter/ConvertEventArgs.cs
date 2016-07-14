using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigrationConverter
{
    public class ConvertEventArgs : EventArgs
    {
        public string Script { get; set; }
    }
}
