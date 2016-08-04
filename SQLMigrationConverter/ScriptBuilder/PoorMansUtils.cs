using PoorMansTSqlFormatterLib.Formatters;
using PoorMansTSqlFormatterLib.Interfaces;
using PoorMansTSqlFormatterLib.Parsers;
using PoorMansTSqlFormatterLib.Tokenizers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace SqlServerToPostgresLib.Tools
{
    public static class PoorMansUtils
    {
        static void StripCommentsFromSqlTree(XmlDocument sqlTree)
        {
            StripElementNameFromXml(sqlTree, PoorMansTSqlFormatterLib.Interfaces.SqlXmlConstants.ENAME_COMMENT_MULTILINE);
            StripElementNameFromXml(sqlTree, PoorMansTSqlFormatterLib.Interfaces.SqlXmlConstants.ENAME_COMMENT_SINGLELINE);
            StripElementNameFromXml(sqlTree, PoorMansTSqlFormatterLib.Interfaces.SqlXmlConstants.ENAME_COMMENT_SINGLELINE_CSTYLE);
        }
        static void StripElementNameFromXml(XmlDocument sqlTree, string elementName)
        {
            XmlNodeList deletionCandidates = sqlTree.SelectNodes(string.Format("//*[local-name() = '{0}']", elementName));
            foreach (XmlElement deletionCandidate in deletionCandidates)
                deletionCandidate.ParentNode.RemoveChild(deletionCandidate);
        }
        public static XmlDocument getXml(string sql)
        {
            TSqlStandardFormatter _standardFormatter = new TSqlStandardFormatter(new TSqlStandardFormatterOptions
            {
                TrailingCommas = true,
                KeywordStandardization = true
            });
            ISqlTokenizer _tokenizer = new TSqlStandardTokenizer(); ;
            ISqlTokenParser _parser = new TSqlStandardParser(); ;
            XmlDocument parsedOriginal = _parser.ParseSQL(_tokenizer.TokenizeSQL(sql));
            StripCommentsFromSqlTree(parsedOriginal);
            TSqlObfuscatingFormatter _obfuscatingFormatter = new TSqlObfuscatingFormatter(); ;
            string obfuscatedSql = _obfuscatingFormatter.FormatSQLTree(parsedOriginal);
            return _parser.ParseSQL(_tokenizer.TokenizeSQL(obfuscatedSql));
        }
        public static string getString(XmlDocument xml)
        {
            TSqlStandardFormatter _standardFormatter = new TSqlStandardFormatter(new TSqlStandardFormatterOptions
            {
                TrailingCommas = true,
                KeywordStandardization = true
            });
            string parsedSql = _standardFormatter.FormatSQLTree(xml);
            return parsedSql;
        }

        public static string beautifySQL(string sql)
        {

            TSqlStandardFormatter _standardFormatter = new TSqlStandardFormatter(new TSqlStandardFormatterOptions
            {
                TrailingCommas = true,
                KeywordStandardization = true
            });

            ISqlTokenizer _tokenizer = new TSqlStandardTokenizer(); ;
            ISqlTokenParser _parser = new TSqlStandardParser(); ;
            XmlDocument parsedOriginal = _parser.ParseSQL(_tokenizer.TokenizeSQL(sql));
            StripCommentsFromSqlTree(parsedOriginal);

            //todo : try parse with xml format with this code below
            //======================================================================================
            TSqlObfuscatingFormatter _obfuscatingFormatter = new TSqlObfuscatingFormatter(); ;
            string obfuscatedSql = _obfuscatingFormatter.FormatSQLTree(parsedOriginal);
            XmlDocument parsedAgain = _parser.ParseSQL(_tokenizer.TokenizeSQL(obfuscatedSql));
            //string unObfuscatedSql = _standardFormatter.FormatSQLTree(parsedAgain);
            //======================================================================================

            string parsedSql = _standardFormatter.FormatSQLTree(parsedOriginal);
            return parsedSql;
        }

    }
}
