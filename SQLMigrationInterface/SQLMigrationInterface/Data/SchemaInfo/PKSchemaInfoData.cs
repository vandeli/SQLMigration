﻿using EasyTools.Data;
using System;
using System.Collections.Generic;

namespace SQLMigration.Data.SchemaInfo
{
    public class PKSchemaInfoData : BaseData
    {
        public PKSchemaInfoData()
        {
            updated = DateTime.Now;
            id = Guid.NewGuid().ToString();
        }
      
        public string PkName { get; set; }
        public string TableName { get; set; }
        public List<UsedColumn> usedColumnList { get; set; }


        public override string ToString()
        {
            return string.Format("PKSchemaInfo => {0], PkName: {1}, TableName: {2}, ColumnName: {3}",
                base.ToString(), PkName, TableName,usedColumnList);
        }
    }
}
