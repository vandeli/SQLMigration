using System;

namespace SQLMigration.Data.SchemaInfo
{
    public class UsedParameter
    {
        public Int32 ParameterNumber { get; set; }
        public string ParameterName { get; set; }
        public string DataType { get; set; }
        public string DomainType { get; set; }
        public Int32 ParameterMaxBytes { get; set; }
        public Int32 NumericPrecision { get; set; }
        public Int32 NumericScale { get; set; }      
        
    }
}
