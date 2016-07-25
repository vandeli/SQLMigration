using EasyTools.DB;
using EasyTools.IO;
using EasyTools.Interface.Interface.DB;
using EasyTools.Interface.Interface.IO;
using SQLMigration.Interface.Interface.Manager;
using SQLMigrationConverter.ScriptBuilder;
using SQLMigrationConverter.SourceQuery;
using SQLMigrationInterface.Interface.ScriptBuilder;
using SQLMigrationInterface.Interface.SourceQuery;
using SQLMigrationManager;
using System;

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

            IDataAccess dataAccess = new DataAccess();
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
