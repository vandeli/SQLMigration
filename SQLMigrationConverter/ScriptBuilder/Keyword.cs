//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Xml;
//using System.Xml.Linq;

//namespace SqlServerToPostgresLib.ToPostgres
//{
//    public class Keyword
//    {

//        public enum enProcReturnKind
//        {
//            Void,
//            Single,
//            Resultset,
//        }
//        public enum enClauseType
//        {
//            Begin,
//            WhiteSpace,
//            If,
//            Set,
//            Return,
//            Default,
//            Select,
//            Insert,
//            Update,
//            Delete,
//            DDLDeclare,
//        }
//        public enProcReturnKind ReturnKind { get; set; }

//        public const string EQUALS_SIGN = "equalssign";
//        public const string CLAUSE = "clause";
//        public const string DDL_DECLARE_BLOCK = "ddldeclareblock";
//        public const string CONTAINER_OPEN = "containeropen";
//        public const string CONTAINER_CLOSE = "containerclose";
//        public const string CONTAINER_CONTENT_BODY = "containercontentbody";
//        public const string CONTAINER_MULTI_STATEMENT_BODY = "containermultistatementbody";
//        public const string SQL_STATEMENT = "sqlstatement";
//        public const string BEGIN_END_BLOCK = "beginendblock";
//        public const string ELEMENT_OTHER_KEYWORD_DECLARE = "<OtherKeyword>DECLARE</OtherKeyword>";
//        public const string ELEMENT_WHITESPACE = "<WhiteSpace> </WhiteSpace>";
//        public const string ELEMENT_EMPTY_BEGIN = "<SqlStatement><Clause><BeginEndBlock><ContainerOpen><OtherKeyword>BEGIN</OtherKeyword></ContainerOpen><ContainerMultiStatementBody></ContainerMultiStatementBody><ContainerClose><OtherKeyword>END; $$;</OtherKeyword></ContainerClose></BeginEndBlock></Clause></SqlStatement>";
//        public XElement Element { get; set; }
//        public Keyword(XmlElement xmlRootElement)
//        {
//            Element = XElement.Parse(xmlRootElement.OuterXml);
//        }


//        public void convertSqlStatement()
//        {
//            List<XElement> ddlDeclareList = new List<XElement>() {
//                XElement.Parse(ELEMENT_OTHER_KEYWORD_DECLARE),
//                XElement.Parse(ELEMENT_WHITESPACE),
//            };
//            List<XElement> elementList = new List<XElement>();
//            XElement[] originalElementList = Element.Descendants().Where(x => x.Name.LocalName.ToLower() == SQL_STATEMENT).ToArray();
//            originalElementList.ToList().ForEach(delegate (XElement element) {
//                elementList.Add(element);
//            });

//            for (var iterator = 0; iterator < elementList.Count; iterator++)
//            {
//                var sqlStatement = new SqlStatement(elementList[iterator], ReturnKind);
//                if (sqlStatement.ClauseType == enClauseType.DDLDeclare)
//                {
//                    XElement ddlElement = XElement.Parse(sqlStatement.Element.ToString());
//                    ddlDeclareList.Add(ddlElement);
//                }
//                originalElementList[iterator] = sqlStatement.Element;
//            }

//            Element.Descendants().Where(x => x.Name.LocalName.ToLower() == DDL_DECLARE_BLOCK).Remove();


//            var body = Element.Descendants().FirstOrDefault(x => x.Name.LocalName.ToLower() == CONTAINER_CONTENT_BODY);
//            bool beginClauseExist = false;
//            foreach (var sqlStatement in body.Elements().Where(x => x.Name.LocalName.ToLower() == SQL_STATEMENT))
//            {
//                if (beginClauseExist)
//                    break;
//                foreach (var elemen in sqlStatement.Elements())
//                {
//                    if (SqlStatement.getClauseType(elemen) != enClauseType.WhiteSpace)
//                    {
//                        if (SqlStatement.getClauseType(elemen.Elements().First()) == enClauseType.Begin)
//                            beginClauseExist = true;
//                        break;
//                    }
//                }
//            }
//            List<XElement> original;
//            if (!beginClauseExist)
//            {
//                original = XElement.Parse(
//                    body.ToString())
//                    .Elements()
//                    .ToList();
//            }
//            else
//            {
//                original = XElement.Parse(
//                    body
//                    .Descendants()
//                    .First(x => x.Name.LocalName.ToLower() == CONTAINER_MULTI_STATEMENT_BODY).ToString())
//                    .Elements()
//                    .ToList();
//            }
//            body.Elements().Remove();

//            original.Reverse();
//            body.Add(XElement.Parse(ELEMENT_EMPTY_BEGIN));
//            foreach (var element in original)
//            {
//                body.Descendants().First(x => x.Name.LocalName.ToLower() == CONTAINER_MULTI_STATEMENT_BODY).AddFirst(element);
//            }

//            if (ddlDeclareList.Count > 2)
//            {
//                ddlDeclareList.Reverse();
//                foreach (var element in ddlDeclareList)
//                    body.Elements().First().AddBeforeSelf(element);
//            }



//        }
//        public class SqlStatement
//        {
//            const string WHITE_SPACE = "whitespace";
//            const string IF_STATEMENT = "ifstatement";
//            const string OTHER_KEYWORD = "otherkeyword";
//            const string BOOLEAN_EXPRESSION = "booleanexpression";
//            const string DATA_TYPE_KEYWORD = "datatypekeyword";
//            const string DDL_DETAIL_PARENS = "ddldetailparens";
//            const string COMPOUND_KEYWORD = "compoundkeyword";


//            const string ELEMENT_SEMICOLON = "<OtherKeyword>;</OtherKeyword>";
//            const string ELEMENT_RETURN_QUERY = "<OtherKeyword>return query</OtherKeyword>";
//            const string ELEMENT_ENDIF = "<ContainerClose><OtherKeyword>end if;</OtherKeyword></ContainerClose>";
//            const string ELEMENT_THEN = "<OtherKeyword>then</OtherKeyword>";

//            public XElement Element { get; set; }
//            public enClauseType ClauseType { get; set; }
//            enProcReturnKind _returnKind { get; set; }
//            public SqlStatement(XElement xml, enProcReturnKind returnKind)
//            {
//                _returnKind = returnKind;

//                //Element = XElement.Parse(xml.InnerXml.ToString());
//                Element = xml;
//                ClauseType = getClauseType();
//                switch (ClauseType)
//                {
//                    case enClauseType.Set:
//                        convertSetClause();
//                        break;
//                    case enClauseType.Return:
//                        convertReturnClause();
//                        break;
//                    case enClauseType.If:
//                        convertIfClause();
//                        break;
//                    case enClauseType.Select:
//                        convertSelectClause();
//                        break;
//                    case enClauseType.DDLDeclare:
//                        convertDDLDeclareClause();
//                        break;
//                    default:
//                        break;
//                }
//            }
//            void convertDDLDeclareClause()
//            {
//                var ddlDeclareBlockElement = Element.Descendants().SingleOrDefault(x => x.Name.LocalName.ToLower() == DDL_DECLARE_BLOCK);
//                var dataType = ddlDeclareBlockElement.Elements().SingleOrDefault(x => x.Name.LocalName.ToLower() == DATA_TYPE_KEYWORD).Value;
//                var detail = ddlDeclareBlockElement.Elements().SingleOrDefault(x => x.Name.LocalName.ToLower() == DDL_DETAIL_PARENS);
//                ddlDeclareBlockElement.Elements().Where(x => x.Name.LocalName.ToLower() == OTHER_KEYWORD).Remove();
//                if (detail != null)
//                {
//                    dataType += " (" + detail.Elements().Aggregate(new StringBuilder(), (sb, i) => sb.Append(i.Value)).ToString() + " )";
//                    detail.Remove();
//                }
//                var convertedDataType = Mapping.DataTypes.getRawMappingValue(dataType);
//                ddlDeclareBlockElement.Elements().SingleOrDefault(x => x.Name.LocalName.ToLower() == DATA_TYPE_KEYWORD).Value = convertedDataType;
//            }

//            void convertSelectClause()
//            {
//                if (_returnKind == enProcReturnKind.Resultset)
//                {
//                    var xml = new XmlDocument();
//                    xml.LoadXml("<SqlRoot>" + Element.ToString() + "</SqlRoot>");
//                    var query = Tools.PoorMansUtils.getString(xml);
//                    if (query.Trim().Substring(query.Trim().Length - 1, 1) != ";")
//                        query = query + " ;";
//                    var data = Tools.PoorMansUtils.getXml(query)["SqlRoot"];

//                    Element.ReplaceAll(XElement.Parse(data.InnerXml.ToString()));
//                    Element.Elements().First().AddBeforeSelf(XElement.Parse(ELEMENT_RETURN_QUERY));
//                }
//            }
//            void convertIfClause()
//            {
//                Element.Descendants().SingleOrDefault(x => x.Name.LocalName.ToLower() == BOOLEAN_EXPRESSION).AddAfterSelf(XElement.Parse(ELEMENT_THEN));
//                if (getClauseType(Element.Elements().Last()) == enClauseType.WhiteSpace)
//                    Element.Elements().Last().Remove();
//                Element.Descendants().SingleOrDefault(x => x.Name.LocalName.ToLower() == IF_STATEMENT).Elements().Last().AddAfterSelf(XElement.Parse(ELEMENT_ENDIF));
//            }
//            void convertSetClause()
//            {
//                if (getClauseType(Element.Elements().Single(x => x.Name.LocalName.ToLower() == CLAUSE).Elements().Last()) == enClauseType.WhiteSpace)
//                    Element.Elements().Single(x => x.Name.LocalName.ToLower() == CLAUSE).Elements().Last().Remove();

//                Element.Elements().Single(x => x.Name.LocalName.ToLower() == CLAUSE).Elements().First().Remove();
//                var element = Element.Elements().Single(x => x.Name.LocalName.ToLower() == CLAUSE).Elements().SingleOrDefault(x => x.Name.LocalName.ToLower() == EQUALS_SIGN);
//                element.Value = ":=";
//                if (Element.Elements().Single(x => x.Name.LocalName.ToLower() == CLAUSE).Elements().Last().Value.Trim() != ";")
//                    Element.Elements().Single(x => x.Name.LocalName.ToLower() == CLAUSE).Elements().Last().AddAfterSelf(XElement.Parse(ELEMENT_SEMICOLON));
//            }
//            void convertReturnClause()
//            {
//                if (getClauseType(Element.Elements().Single(x => x.Name.LocalName.ToLower() == CLAUSE).Elements().Last()) == enClauseType.WhiteSpace)
//                    Element.Elements().Single(x => x.Name.LocalName.ToLower() == CLAUSE).Elements().Last().Remove();

//                if (Element.Elements().Single(x => x.Name.LocalName.ToLower() == CLAUSE).Elements().Last().Value.Trim() != ";")
//                    Element.Elements().Single(x => x.Name.LocalName.ToLower() == CLAUSE).Elements().Last().AddAfterSelf(XElement.Parse(ELEMENT_SEMICOLON));
//            }

//            public static enClauseType getClauseType(XElement element)
//            {
//                enClauseType clauseType = enClauseType.Default;
//                switch (element.Name.LocalName.ToLower())
//                {
//                    case COMPOUND_KEYWORD:
//                        if (element.Attribute("simpleText").Value.ToString() == "INSERT INTO")
//                            clauseType = enClauseType.Insert;
//                        break;
//                    case BEGIN_END_BLOCK:
//                        clauseType = enClauseType.Begin;
//                        break;
//                    case WHITE_SPACE:
//                        clauseType = enClauseType.WhiteSpace;
//                        break;
//                    case IF_STATEMENT:
//                        clauseType = enClauseType.If;
//                        break;
//                    case DDL_DECLARE_BLOCK:
//                        clauseType = enClauseType.DDLDeclare;
//                        break;
//                    case OTHER_KEYWORD:
//                        if (element.Value.ToLower() == "set")
//                            clauseType = enClauseType.Set;
//                        else if (element.Value.ToLower() == "return")
//                            clauseType = enClauseType.Return;
//                        else if (element.Value.ToLower() == "select")
//                            clauseType = enClauseType.Select;
//                        else if (element.Value.ToLower() == "update")
//                            clauseType = enClauseType.Update;
//                        else if (element.Value.ToLower() == "delete")
//                            clauseType = enClauseType.Delete;
//                        break;
//                    default:
//                        clauseType = enClauseType.Default;
//                        break;
//                }
//                return clauseType;
//            }
//            enClauseType getClauseType()
//            {
//                enClauseType clauseType = enClauseType.Default;

//                foreach (var element in Element.Elements().Where(x => x.Name.LocalName.ToLower() != WHITE_SPACE).First().Elements())
//                {
//                    if (element.Name.LocalName.ToLower() != WHITE_SPACE)
//                    {
//                        clauseType = getClauseType(element);
//                        break;
//                    }
//                }
//                return clauseType;
//            }

//        }
//    }
//}
