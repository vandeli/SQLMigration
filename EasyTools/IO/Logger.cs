using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EasyTools.Interface.IO;

namespace EasyTools.IO
{
 

    public class Logger : TextWriter, ILogger
    {
        public TextWriter GetWriter()
        {
            return (TextWriter) this;
        }

        public event ValueChange OnValueChange;

        public override void WriteLine(string value)
        {
            base.WriteLine(value);
            if (OnValueChange != null)
                OnValueChange(value.ToString());
        }

        public override Encoding Encoding
        {
            get { return System.Text.Encoding.UTF8; }
        }
    }
}
