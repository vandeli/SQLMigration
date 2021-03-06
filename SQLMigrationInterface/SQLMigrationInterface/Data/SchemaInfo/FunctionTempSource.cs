﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SQLMigration.Data.SchemaInfo
{
    public class FunctionTempSource
    {
        public string FnName { get; set; }
        public string SqlCode { get; set; }
        public Int32 ParameterNumber { get; set; }
        public string ParameterName { get; set; }
        public string DataType { get; set; }
        public string DomainType { get; set; }
        public Int32 ParameterMaxBytes { get; set; }
        public Int32 NumericPrecision { get; set; }
        public Int32 NumericScale { get; set; }
    }
}
