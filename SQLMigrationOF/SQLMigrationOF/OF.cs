﻿using EasyTools.DB;
using System;
using System.Data.SqlClient;
using EasyTools.IO;
using EasyTools.Interface.DB;
using EasyTools.Interface.IO;
﻿using SQLMigration.Converter.ScriptBuilder;
﻿using SQLMigration.Interface.Interface.Manager;
using SQLMigrationConverter.SourceQuery;
using SQLMigrationInterface.Interface.ScriptBuilder;
using SQLMigrationInterface.Interface.SourceQuery;
using SQLMigrationManager;


namespace SQLMigrationOF
{
    public class OF
    {
        IUDTManager udtManager;
        IFileManager fileManager;
        ICoreDB coreDb;
        public IUDTManager GetInstanceUdtManager()
        {
            if (udtManager != null) return udtManager;
            var dbConn = new SqlConnection();
            var dbCommand = new SqlCommand();
            var dbAdapter = new SqlDataAdapter();

            IDataAccess dataAccess = new DataAccess(dbConn,dbCommand,dbAdapter);
            IScriptBuilder scriptBuilder = new PstScriptBuilder();
            ISourceQuery schemaQuery = new MssQuery();
            udtManager = new UDTManager(dataAccess, scriptBuilder, schemaQuery);

            return udtManager;
        }

        public IFileManager GEtInstanceFileManager()
        {
            if (fileManager != null) return this.fileManager;

            fileManager = new FileManager();

            return fileManager;
        }
        public ICoreDB GetInstanceCoreDB(String filePath)
        {
            if (coreDb != null) return coreDb;


            coreDb = new DbXml(filePath, fileManager);

            return coreDb;
        }
    }
}
