using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EasyTools.Interface.IO
{
    public delegate void ValueChange(String value);
    public interface ILogger
    {
        TextWriter GetWriter();
        event ValueChange OnValueChange;
    }
}
