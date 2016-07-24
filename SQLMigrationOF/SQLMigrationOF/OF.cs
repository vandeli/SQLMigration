using SQLMigration.Data;
using System;
using EasyTools.DB;
using EasyTools.Interface.DB;
using EasyTools.Interface.IO;
using EasyTools.IO;
using SQLMigration.Converter.ScriptBuilder;
using SQLMigration.Converter.SourceQuery;
using SQLMigration.Interface.Manager;
using SQLMigration.Interface.ScriptBuilder;
using SQLMigration.Interface.SourceQuery;
using SQLMigration.Manager;

namespace SQLMigration
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
