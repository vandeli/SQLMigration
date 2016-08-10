using EasyTools.DB;
using EasyTools.Interface.DB;
using EasyTools.Interface.IO;
using EasyTools.IO;
using SQLMigration.Converter.ScriptBuilder;
using SQLMigration.Interface.Interface.Manager;
using SQLMigrationConverter.SourceQuery;
using SQLMigrationInterface.Interface.ScriptBuilder;
using SQLMigrationInterface.Interface.SourceQuery;
using SQLMigrationManager;
using System;
using System.Data.SqlClient;
using EasyTools.Controls;
using EasyTools.Interface.Controls;


namespace SQLMigration.OF
{
    public class UIOF
    {
        static IUDTManager udtManager;
        static ITableManager tableManager;
        static IPKManager pkManager;
        static IFileManager fileManager;
        static IIndexManager indexManager;
        static ISPManager spManager;
        static IRecordManager recordManager;
        static IFunctionManager functionManager;

        static ICoreDB coreDb;
        private static ILogger logger;
        private static IBinder binder;
        public IUDTManager GetInstanceUdtManager()
        {
            if (udtManager != null) return udtManager;
            var dbConn = new SqlConnection();
            var dbCommand = new SqlCommand();
            var dbAdapter = new SqlDataAdapter();

            IDataAccess dataAccess = new DataAccess(dbConn, dbCommand, dbAdapter);
            IScriptBuilder scriptBuilder = new PstScriptBuilder();
            ISourceQuery schemaQuery = new MssQuery();
            udtManager = new UDTManager(dataAccess, scriptBuilder, schemaQuery);

            return udtManager;
        }

        public ITableManager GetInstanceTableManager()
        {
            if (tableManager != null) return tableManager;
            var dbConn = new SqlConnection();
            var dbCommand = new SqlCommand();
            var dbAdapter = new SqlDataAdapter();

            IDataAccess dataAccess = new DataAccess(dbConn, dbCommand, dbAdapter);
            IScriptBuilder scriptBuilder = new PstScriptBuilder();
            ISourceQuery schemaQuery = new MssQuery();
            tableManager = new TableManager(dataAccess, scriptBuilder, schemaQuery);

            return tableManager;

        }

        public IPKManager GetInstancePKManager()
        {
            if (pkManager != null) return pkManager;
            var dbConn = new SqlConnection();
            var dbCommand = new SqlCommand();
            var dbAdapter = new SqlDataAdapter();

            IDataAccess dataAccess = new DataAccess(dbConn, dbCommand, dbAdapter);
            IScriptBuilder scriptBuilder = new PstScriptBuilder();
            ISourceQuery schemaQuery = new MssQuery();
            pkManager = new PKManager(dataAccess, scriptBuilder, schemaQuery);

            return pkManager;
        }

        public IIndexManager GetInstanceIndexManager()
        {
            if (indexManager != null) return indexManager;
            var dbConn = new SqlConnection();
            var dbCommand = new SqlCommand();
            var dbAdapter = new SqlDataAdapter();

            IDataAccess dataAccess = new DataAccess(dbConn, dbCommand, dbAdapter);
            IScriptBuilder scriptBuilder = new PstScriptBuilder();
            ISourceQuery schemaQuery = new MssQuery();
            indexManager = new IndexManager(dataAccess, scriptBuilder, schemaQuery);

            return indexManager;
        }

        public ISPManager GetInstanceSPManager()
        {
            if (spManager != null) return spManager;
            var dbConn = new SqlConnection();
            var dbCommand = new SqlCommand();
            var dbAdapter = new SqlDataAdapter();

            IDataAccess dataAccess = new DataAccess(dbConn, dbCommand, dbAdapter);
            IScriptBuilder scriptBuilder = new PstScriptBuilder();
            ISourceQuery schemaQuery = new MssQuery();
            spManager = new SPManager(dataAccess, scriptBuilder, schemaQuery);

            return spManager;

        }

        public IRecordManager GetInstanceRecordManager()
        {
            if (recordManager != null) return recordManager;
            var dbConn = new SqlConnection();
            var dbCommand = new SqlCommand();
            var dbAdapter = new SqlDataAdapter();

            IDataAccess dataAccess = new DataAccess(dbConn, dbCommand, dbAdapter);
            IScriptBuilder scriptBuilder = new PstScriptBuilder();
            ISourceQuery schemaQuery = new MssQuery();
            recordManager = new RecordManager(dataAccess, scriptBuilder, schemaQuery);

            return recordManager;

        }

        public IFunctionManager GetInstanceFunctionManager()
        {
            if (functionManager != null) return functionManager;
            var dbConn = new SqlConnection();
            var dbCommand = new SqlCommand();
            var dbAdapter = new SqlDataAdapter();

            IDataAccess dataAccess = new DataAccess(dbConn, dbCommand, dbAdapter);
            IScriptBuilder scriptBuilder = new PstScriptBuilder();
            ISourceQuery schemaQuery = new MssQuery();
            functionManager = new FunctionManager(dataAccess, scriptBuilder, schemaQuery);

            return functionManager;

        }


        public IFileManager GEtInstanceFileManager()
        {                                                                        
            if (fileManager != null) return fileManager;

            fileManager = new FileManager();

            return fileManager;
        }

        public ICoreDB GetInstanceCoreDB(String filePath)
        {
            if (coreDb != null) return coreDb;

            fileManager = GEtInstanceFileManager();
            coreDb = new DbXml(filePath, fileManager);

            return coreDb;
        }


        public ILogger GetInstanceLogger()
        {
            if (logger != null) return logger;
            logger = new Logger();
            return logger;
        }

        public IBinder GetInstanceBinder()
        {
            if (binder != null) return binder;
            binder = new Binder();
            return binder;
        }
    }
}
