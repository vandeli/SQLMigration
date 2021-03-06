﻿using System;
using EasyTools.Data;

namespace SQLMigration.Data.SchemaInfo
{
    public class UDTSchemaInfoData : BaseData
    {
        public UDTSchemaInfoData()
        {
            updated = DateTime.Now;
            id = Guid.NewGuid().ToString(); 
        }

        public string DataType { get; set; }
        public int MaxLength { get; set; }
        public byte Precision { get; set; }
        public int Scale { get; set; }
        public bool IsNullable { get; set; }


        public override string ToString()
        {
            return string.Format("UDTSchemaInfo => {0}, DataType: {1}, IsNullable: {2}, MaxLength: {3}, Precision: {4}, Scale: {5}", 
                base.ToString(), DataType, IsNullable, MaxLength, Precision, Scale);
        }
    }
}
