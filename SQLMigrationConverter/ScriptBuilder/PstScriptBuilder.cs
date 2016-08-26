
using SQLMigration.Converter.ScriptBuilder;
using SQLMigration.Data.SchemaInfo;
using SQLMigrationInterface.Interface.ScriptBuilder;

using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Schema;
using System.Xml.Serialization;

namespace SQLMigration.Converter.ScriptBuilder
{
    public class PstScriptBuilder : IScriptBuilder
    {

        class TablesFieldDataType
        {
            public string DataType { get; set; }
            public string ConvertedDataType { get; set; }
        }

        
        public string CreateScriptUDT(UDTSchemaInfoData schemaInfo)
        {
            
            string result;

            var convertedDataType = GetDataTypeMap(schemaInfo.DataType);
            if (schemaInfo.Scale > 0)
            {
                result = string.Format("CREATE DOMAIN {0} AS {1}({2},{3}){4};\r\n",
                                schemaInfo.name, convertedDataType, schemaInfo.Precision,
                                schemaInfo.Scale, (schemaInfo.IsNullable ? "" : " NOT NULL"));

            }
            else if (schemaInfo.Precision == 0)
            {
                result = string.Format("CREATE DOMAIN {0} AS {1}({2}){3};\r\n",
                        schemaInfo.name, convertedDataType, schemaInfo.MaxLength,
                        (schemaInfo.IsNullable ? "" : " NOT NULL"));

            }
            else
            {
                result = string.Format("CREATE DOMAIN {0} AS {1}{2};\r\n",
                        schemaInfo.name, convertedDataType,
                        (schemaInfo.IsNullable ? "" : " NOT NULL"));
            }


            Console.WriteLine("PstScriptBuilder.CreateScriptUDT : " + schemaInfo.name + ", Done");

            return result;

        }

        public string CreateScriptTable(TableSchemaInfoData schemaInfo)
        {
            string result;
            var usedColum = "";
            var n = 0;
        
            foreach (var eachColumn in schemaInfo.usedColumnList)
            {
                n = schemaInfo.usedColumnList.IndexOf(eachColumn);

                if ((n + 1) == schemaInfo.usedColumnList.Count)
                {
                    usedColum += eachColumn.ColumnName + "  " +  cekSuffix(eachColumn) + "\r\n";
                }
                else
                {
                    usedColum += eachColumn.ColumnName + "  " +  cekSuffix(eachColumn) + ",\r\n";
                }
            }
            result = string.Format("CREATE TABLE {0} (\r\n {1} );\r\n",
                                schemaInfo.TableName, usedColum);
         
           

            Console.WriteLine("PstScriptBuilder.CreateScriptTable : " + schemaInfo.name + ", Done");
            return result;
        }

        public string CreateScriptPK(PKSchemaInfoData schemaInfo)
        {
            string result;
            var usedColum = "";
            var n = 0;

            foreach (var eachColumn in schemaInfo.usedColumnList)
            {
                n = schemaInfo.usedColumnList.IndexOf(eachColumn);

                if ((n + 1) == schemaInfo.usedColumnList.Count)
                {
                    usedColum += eachColumn.ColumnName;
                }
                else
                {
                    usedColum += eachColumn.ColumnName + ", ";
                }
            }

            result = string.Format("ALTER TABLE {0} ADD CONSTRAINT {1} PRIMARY KEY ({2});\r\n",
                                   schemaInfo.TableName, schemaInfo.PkName, usedColum);
                     

            Console.WriteLine("PstScriptBuilder.CreateScriptUDT : " + schemaInfo.name + ", Done");

            return result;

        }

        public string CreateScriptIndex(IndexSchemaInfoData schemaInfo)
        {
            string result;
            var usedColum = "";
            var n = 0;

            foreach (var eachColumn in schemaInfo.usedColumnList)
            {
                n = schemaInfo.usedColumnList.IndexOf(eachColumn);

                if ((n + 1) == schemaInfo.usedColumnList.Count)
                {
                    usedColum += eachColumn.ColumnName;
                }
                else
                {
                    usedColum += eachColumn.ColumnName + ", ";
                }
            }


            result = string.Format("CREATE INDEX {0} ON {1} ({2});\r\n",
                         schemaInfo.IndexName, schemaInfo.TableName, usedColum);              
           

            Console.WriteLine("PstScriptBuilder.CreateScriptIndex : " + schemaInfo.name + ", Done");

            return result;

        }

        public string CreateScriptSP2(SPSchemaInfoData schemaInfo)
        {
            string result;
            var usedParameter = "";
            var n = 0;

            foreach (var eachParameter in schemaInfo.usedParameterList)
            {
                n = schemaInfo.usedParameterList.IndexOf(eachParameter);

                if ((n + 1) == schemaInfo.usedParameterList.Count)
                {
                    usedParameter += eachParameter.ParameterName + "  " + cekParameter(eachParameter) + "\r\n";
                }
                else
                {
                    usedParameter += eachParameter.ParameterName + "  " + cekParameter(eachParameter) + ",\r\n";
                }
            }
            result = string.Format("CREATE OR REPLACE FUNCTION {0} (\r\n {1} )\r\n BEGIN\r\n END;\r\n $$ LANGUAGE plpgsql;\r\n",
                                schemaInfo.SPName, usedParameter);

    

            Console.WriteLine("PstScriptBuilder.CreateScriptTable : " + schemaInfo.name + ", Done");
            return result;
        }

        public string CreateScriptSP3(SPSchemaInfoData schemaInfo)
        {
            var result = "";
           
            var Tools = new PoorMansUtils();
                var comments = schemaInfo.SqlCode;
                
                comments = Tools.beautifySQL(comments);
                var resultsetOutputs = schemaInfo.SPOutputList;
                var singleOutputs = schemaInfo.usedParameterList;
                var xml = Tools.getXml(comments).DocumentElement;
                var keyword = new Keyword(xml);

                var parameter = "";
                var outputString = "";
                if (singleOutputs != null)
                {
                    outputString = " " + cekParameter(singleOutputs[0]) + " ";
                    keyword.ReturnKind =  Keyword.enProcReturnKind.Single;
                }
                else if (resultsetOutputs.Count() != 0)
                {
                    outputString = " SETOF " + schemaInfo.SPName + "_rs ";
                    keyword.ReturnKind = Keyword.enProcReturnKind.Resultset;
                }
                else
                {
                    outputString = " VOID ";
                    keyword.ReturnKind = Keyword.enProcReturnKind.Void;
                }
           

               keyword.convertSqlStatement();
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.LoadXml(keyword.Element.ToString());
                var script = Tools.getString(xmlDoc);
                script = script.Replace(@"@", "m_");
                var splittedText = Regex.Split(script, "\r\nas\r\n", RegexOptions.IgnoreCase).ToList().Skip(1).ToArray();

             //   var parameters = getAllParameters().Where(x => x.IsResult == false && x.Name == proc);
             //   var parameter = parameters.ToList().Aggregate(new StringBuilder(), (sb, i) => sb.Append("m_" + i.ParamName.Substring(1, i.ParamName.Length - 1) + " " + i.getConvertedDataType() + "\r\n,")).ToString();
             //   parameter = parameter.Substring(0, parameter.Length - 1);
                foreach (var allparam in singleOutputs)
                 {
                        parameter += allparam.ParameterName + "\r\n";
                 }
                parameter = parameter.Replace(@"@", "m_");
                result = "CREATE OR REPLACE FUNCTION " + schemaInfo.SPName + "\r\n(" +
                    parameter +
                     ")\r\n RETURNS " + outputString + " \r\n LANGUAGE plpgsql \r\n AS $$ \r\n " +
                     splittedText.Aggregate(new StringBuilder(), (sb, i) => sb.Append(i)).ToString() + "  \r\n  \r\n ";

          //  MessageBox.Show(result);
            return result;
        }

        public string CreateScriptSP(SPSchemaInfoData schemaInfo)
        {
            var result = "";
          
            var FnName = schemaInfo.SPName;
            var spType = "Other";
            var nReturn = "";
            var parName = "";



            //    StringReader strReader = new StringReader(schemaInfo.SqlCode);

         //   string txtSQLcode = File.ReadAllText(@"D:\BOSNET\Project\BOSNET\BOSNETLINUX\sampleSQL.txt", Encoding.UTF8);
            using (StringReader reader = new StringReader(schemaInfo.SqlCode))
            {
                string line = string.Empty;
                var breakFlag = false;
                //  line = reader.ReadLine();
                do
                {
                    line = reader.ReadLine();
                    if (line != null)
                    {
                        var lines = line.TrimStart();
                        //    if ((lines.Contains("Update") )|| (lines.Contains("update")) || (lines.Contains("UPDATE")))
                        if (Regex.IsMatch(lines, @"\b(update|Update|UPDATE)\b"))
                        { spType = "update"; breakFlag = true; break; }
                        else if (Regex.IsMatch(lines, @"\b(insert|Insert|INSERT)\b"))
                        { spType = "insert"; breakFlag = true; break; }
                        else if (Regex.IsMatch(lines, @"\b(delete|Delete|DELETE)\b"))
                        { spType = "delete"; breakFlag = true; break; }
                        else if (Regex.IsMatch(lines, @"\b(select|Select|SELECT)\b"))
                        { spType = "select"; breakFlag = true; break; }
                        //else
                        //{ spType = "other"; }

                    }
                    else
                    { breakFlag = true; }
                } while ((line != null) || (!breakFlag));
            }


            for (var i = 0; i < schemaInfo.usedParameterList.Count; i++)
            {
                if (schemaInfo.usedParameterList[i].ParameterName != "")
                {
                    parName += schemaInfo.usedParameterList[i].ParameterName.Replace(@"@", "p_");
                    if (schemaInfo.usedParameterList[i].DomainType != "")
                    {
                        parName += " " + schemaInfo.usedParameterList[i].DomainType;
                    }
                    else
                    {
                        parName += " " + GetDataTypeMap(schemaInfo.usedParameterList[i].DataType);
                    }


                    if (i < (schemaInfo.usedParameterList.Count - 1))
                        parName += ",\r\n";
                }
                else
                {
                    if (schemaInfo.usedParameterList[i].DomainType != "")
                    {
                        nReturn = schemaInfo.usedParameterList[i].DomainType;
                    }
                    else if (schemaInfo.usedParameterList[i].DataType == "datetime" || schemaInfo.usedParameterList[i].DataType == "bit")
                    {
                        nReturn = schemaInfo.usedParameterList[i].DataType;
                    }
                    else if (schemaInfo.usedParameterList[i].ParameterMaxBytes != 0)
                    {
                        nReturn = GetDataTypeMap(schemaInfo.usedParameterList[i].DataType) + "(" + schemaInfo.usedParameterList[i].ParameterMaxBytes + ")";
                    }
                    else
                    {
                        nReturn = GetDataTypeMap(schemaInfo.usedParameterList[i].DataType) + "(" + schemaInfo.usedParameterList[i].NumericPrecision + ")";
                    }


                }

            }
            //  string txtSQLcode = File.ReadAllText(@"D:\BOSNET\Project\BOSNET\BOSNETLINUX\sampleSQL.txt", Encoding.UTF8);

            //  var sqlResult = SqlQueryCheck(txtSQLcode, "delete");
            //if (FnName == "BOS_CAS_Cash_DEV_DeleteALL")
            //{ var aa = ""; }

           var sqlResult = SqlQueryCheck(schemaInfo.SqlCode, spType);

            if (parName == "")
            {
                result = "CREATE OR REPLACE FUNCTION " + FnName + "()\r\n" +
                          "RETURNS void AS\r\n" +
                          "$BODY$\r\n" +
                          "BEGIN\r\n" +
                             sqlResult + "\r\n" +
                          "END;\r\n" +
                          "$BODY$\r\n" +
                         "LANGUAGE plpgsql;\r\n" +
                         "\r\n";
            }
            else
            {

                result = "CREATE OR REPLACE FUNCTION " + FnName + "(\r\n" + parName + ")\r\n" +
                         "RETURNS void AS\r\n" +
                         "$BODY$\r\n" +
                         "BEGIN\r\n" +
                            sqlResult + "\r\n" +
                         "END;\r\n" +
                         "$BODY$\r\n" +
                        "LANGUAGE plpgsql;\r\n" +
                        "\r\n";
            }
            return result;
           
        }

        public string CreateScriptRecord(RecordSchemaInfoData schemaInfo)
        {
            string result = "";
          //  string[] rColumnDT = null;
          //  string[] rColumnName = null;
          //  var r = 0;
          ////  var getType = "";
          //  var columnName = "";
          //  var nValues = "";
            var dtSet = new DataSet();
            foreach (DataTable dataTable in dtSet.Tables)
                dataTable.BeginLoadData(); 

       

            var path = "D:\\tempMigration\\" + schemaInfo.TableName + ".xml";
           var SchemaPath = "D:\\tempMigration\\" + schemaInfo.TableName + ".xsd";
            var pathResult = "D:\\tempMigration\\result\\" + schemaInfo.TableName + "_Result.sql";

            try
            {
                if (!File.Exists(path))
                    throw new FileNotFoundException();
                //var nValue = 
                GetRecodScript(schemaInfo,path, SchemaPath);
                result = pathResult;
                //using (StreamWriter sw = new StreamWriter(pathResult))
                //{
                //    sw.Write(nValue);
                //}


                }
            catch (FileNotFoundException)
            {
                MessageBox.Show("The " + schemaInfo.TableName + ".xml, is missing..!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        

           
            Console.WriteLine("PstScriptBuilder.CreateScriptRecord : " + schemaInfo.name + ", Done");
            
            return result;

        }

        public string CreateScriptFunction(FunctionSchemaInfoData schemaInfo)
        {
            var result = "";
            var hasDeclare = false;
            var hasBody = false;
            var beginBody = "";

            var FnName = schemaInfo.FnName;
            var nReturn = "";
            var parName = "";
            var declareName = "";
            var declareDT = "";
            StringReader strReader = new StringReader(schemaInfo.SqlCode);


            using (StringReader reader = new StringReader(schemaInfo.SqlCode))
            {
                string line = string.Empty;
                do
                {
                    line = reader.ReadLine();
                    if (line != null)
                    {
                        var lines = line.TrimStart();
                        if (lines.Contains("declare"))
                        {
                            hasDeclare = true;
                            string[] words = lines.Split(' ');
                            declareName = words[1].Replace(@"@", "d_");
                            declareDT = words[2];
                        }

                        
                        else if (lines.Contains("END"))
                            hasBody = false;

                        if (hasBody == true)
                            beginBody += "--" + lines + "\r\n";
                        if (lines.Contains("BEGIN"))
                            hasBody = true;

                    }

                } while (line != null);
            }
           

            for (var i = 0; i < schemaInfo.usedParameterList.Count; i++)
            {
                if (schemaInfo.usedParameterList[i].ParameterName != "")
                {
                    parName += schemaInfo.usedParameterList[i].ParameterName.Replace(@"@", "p_");
                    if (schemaInfo.usedParameterList[i].DomainType != "")
                    {
                        parName += " " + schemaInfo.usedParameterList[i].DomainType;
                    }
                    else
                    {
                        parName += " " + GetDataTypeMap(schemaInfo.usedParameterList[i].DataType);
                    }
                   

                    if (i < (schemaInfo.usedParameterList.Count - 1))
                        parName += ",";
                }
                else
                {
                    if (schemaInfo.usedParameterList[i].DomainType != "")
                    {
                        nReturn = schemaInfo.usedParameterList[i].DomainType;
                    }
                    else if (schemaInfo.usedParameterList[i].DataType == "datetime" || schemaInfo.usedParameterList[i].DataType == "bit")
                    {
                        nReturn = schemaInfo.usedParameterList[i].DataType;
                    }
                    else if (schemaInfo.usedParameterList[i].ParameterMaxBytes != 0)
                    {
                        nReturn = GetDataTypeMap(schemaInfo.usedParameterList[i].DataType) + "(" + schemaInfo.usedParameterList[i].ParameterMaxBytes + ")";
                    }
                    else
                    {
                        nReturn = GetDataTypeMap(schemaInfo.usedParameterList[i].DataType) + "(" + schemaInfo.usedParameterList[i].NumericPrecision + ")";
                    }

                       
                }
                
            }

            result = "CREATE OR REPLACE FUNCTION " + FnName + "(" + parName + ")\r\n" +
                     "RETURNS " + nReturn + " AS $$\r\n";
            if (hasDeclare == true)
                result += "DECLARE " + " " + declareName + " " + declareDT + ";\r\n";

            result += "BEGIN\r\n" +
                      beginBody +
                  
            "RETURN " + declareName + ";\r\n" + 
            "END;\r\n" +
            "$$  LANGUAGE plpgsql;\r\n"+
            "\r\n";
            return result;
        }

        public string SqlQueryCheck(String sql, String sptype)
        {
            var result = "";
            try
            {            
           
            switch (sptype)
            {
                case "update":
                    
                    result = SPUpdatePattern(sql);                          
               
                    break;

                case "insert":
                      //  var nInsert = SPInsertPattern(sql);//" INSERT PATTERN not set";
                  //  result = SPInsertPattern(sql);
                        break;

                case "delete":
                        result = SPDeletePattern(sql);
                        break;

                case "select":
                     var nSelect = " SELECT PATTERN not set";
                     result = nSelect;
                     break;

                default:
                    result = "--NOT DEFINED PATTERN ";
                    break;
            }
            
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                MessageBox.Show(ex.Message + "\r\n"+ sql);
            }
            return result;
        }

        //private string SPInsertPattern(string sql)
        //{
        //    string nInsert;
        //    int tAS = 0;
        //    int tSET = 0;
        //    int tINSERT = 0;
        //    int tVALUE = 0;
        //    int insertType = 0;
        //    nInsert = "";
        //    string uTableName = "";
        //    string wKolom = "";
        //    string[] sKolom;
        //    string[] vKolom;
        //    string[] allLines;
        //    int sIndex = 0;
        //    int vIndex = 0;
        //    int sLine = 0;

        //    int totalLines = CountLines(sql);
        //    allLines = new string[totalLines];
        //    using (StringReader reader2 = new StringReader(sql))
        //    {
        //        string line = string.Empty;
        //        do
        //        {
        //            line = reader2.ReadLine();
        //            if (line != null)
        //            {
        //                allLines[sLine] = line.TrimStart();
        //                sLine++;
        //            }
        //        } while (line != null);
        //    }

        //    //for (var x = 0; x < allLines.Length; x++)
        //    //{
        //    //    if (Regex.IsMatch(allLines[x], @"\b(update|Update|UPDATE)\b"))
        //    //    {
        //    //        updateType += 1;
        //    //    }
        //    //}

        //    //if (updateType == 1)  //#### awal switch ##
        //    //{

        //        var tsIndex = 0;
        //    for (var s = 0; s < allLines.Length; s++)
        //    {

        //        if (Regex.IsMatch(allLines[s], @"\b(insert|Insert|INSERT)\b"))  //|| (Regex.IsMatch(allLines[s], "Set")) || (Regex.IsMatch(allLines[s], "SET")))
        //        {
        //            //save pos dsini cari count insert jika cuma 2 sIndex di lebihin 1
        //            var iA = allLines[s].Split(' ').Count();
        //            if (tsIndex == 0)
        //            {
        //                sIndex = s;
        //                tsIndex = 1;
        //            }
        //        }
        //        if (Regex.IsMatch(allLines[s], @"\b(values|Values|VALUES)\b"))  // || (Regex.IsMatch(allLines[s], "Where")) || (Regex.IsMatch(allLines[s], "WHERE")))
        //        { sIndex = s - sIndex - 1; vIndex = allLines.Length - s; }
        //    }

        //    if (sIndex != 0)
        //    { sKolom = new string[sIndex]; }
        //    else
        //    { sKolom = new string[1]; }
        //    vKolom = new string[vIndex];

        //    for (var i = 0; i < allLines.Length; i++)
        //        {
        //            //  var tess = allLines[i].Split(' ').Count();
        //            if ((allLines[i].Split(' ').First() == "as") || (allLines[i].Split(' ').First() == "As") || (allLines[i].Split(' ').First() == "AS"))
        //            {
        //                if (tAS == 0)
        //                {
        //                    var iAS = allLines[i].Split(' ').Count();

        //                    switch (iAS)
        //                    {
        //                        case 1:
        //                            break;
                              
        //                        case 4:
                                   
        //                             uTableName = allLines[i].Split(' ').Last();
        //                            for (var n = 0; n < sIndex; n++)
        //                            {
                                        
        //                                sKolom[n] = allLines[i + n + 1].TrimStart();
                                        
        //                                sKolom[n] = sKolom[n].Replace(@"(", "");
        //                                sKolom[n] = sKolom[n].Replace(@")", "");
        //                                sKolom[n] = sKolom[n].Replace(@",", "");

        //                            }
        //                            tINSERT = 1;
                                   
        //                            break;
        //                        default:
        //                            break;
        //                    }
        //                    tAS = 1;
        //                }

        //            }

        //            if ((allLines[i].Split(' ').First() == "insert") || (allLines[i].Split(' ').First() == "Insert") || (allLines[i].Split(' ').First() == "INSERT"))
        //            {
        //                if (tINSERT == 0)
        //                {
        //                    var iINSERT = allLines[i].Split(' ').Count();
        //                    switch (iINSERT)
        //                    {
        //                        case 1:
        //                            uTableName = allLines[i + 1].TrimStart();
        //                            tUPDATE = 1;
        //                            break;
        //                        case 2:
        //                            uTableName = allLines[i].Split(' ').Last();
        //                            tUPDATE = 1;
        //                            break;
        //                        case 3:
        //                            string[] nTN = allLines[i].Split(' ');
        //                            uTableName = nTN[1];
        //                            for (var n = 0; n < sIndex; n++)
        //                            {
        //                                sKolom[n] = allLines[i + n + 1].TrimStart();
        //                                sKolom[n] = sKolom[n].Replace(@"@", "p_");
        //                            }
        //                            tUPDATE = 1;
        //                            tSET = 1;
        //                            break;

        //                        default:
        //                            break;
        //                    }
        //                    // uTableName = allLines[i + 1].TrimStart();
        //                    tUPDATE = 1;
        //                }
        //            }
        //            else if ((allLines[i].Split(' ').First() == "Set") || (allLines[i].Split(' ').First() == "set") || (allLines[i].Split(' ').First() == "SET"))
        //            {
        //                if (tSET == 0)
        //                {
        //                    //if (sIndex == 0)
        //                    //{

        //                    //    var tes = "tes";

        //                    //}
        //                    var iSET = allLines[i].Split(' ').Count();
        //                    var kSet = allLines[i].Split(' ').First();
        //                    switch (iSET)
        //                    {
        //                        case 1:

        //                            for (var n = 0; n < sIndex; n++)
        //                            {
        //                                sKolom[n] = allLines[i + n + 1].TrimStart();
        //                                sKolom[n] = sKolom[n].Replace(@"@", "p_");
        //                            }

        //                            tSET = 1;
        //                            break;

        //                        default:

        //                            sKolom[0] = allLines[i].Replace(kSet, "");
        //                            sKolom[0] = sKolom[0].Replace(@"@", "p_");


        //                            tSET = 1;
        //                            break;
        //                    }
        //                    tSET = 1;
        //                }


        //            }
        //            else if ((allLines[i].Split(' ').First() == "Where") || (allLines[i].Split(' ').First() == "where") || (allLines[i].Split(' ').First() == "WHERE"))
        //            {
        //                if (tWHERE == 0)
        //                {
        //                    var iWHERE = allLines[i].Split(' ').Count();
        //                    var kWHERE = allLines[i].Split(' ').First();
        //                    switch (iWHERE)
        //                    {
        //                        case 1:
        //                            wKolom = allLines[i + 1].TrimStart();
        //                            wKolom = wKolom.Replace(@"@", "p_");
        //                            break;

        //                        default:
        //                            wKolom = allLines[i].Replace(kWHERE, "");
        //                            wKolom = wKolom.Replace(@"@", "p_");
        //                            break;
        //                    }
        //                }

        //            }


        //        }
        //        nInsert = "INSERT INTO" + uTableName + "\r\n" +
        //                  "(\r\n";
               
        //            for (var n = 0; n < sIndex; n++)
        //            {
        //                nInsert += sKolom[n] + "\r\n";
        //            }
        //            nInsert += ")\r\n";

        //            nInsert+= "VALUES\r\n" +
        //                "(\r\n";
        //            for (var z = 0; z < sIndex; z++)
        //            {
        //                nInsert += wKolom[z] + "\r\n";
        //            }
        //            nInsert += ")\r\n";
            
        //    return nInsert;
        //}

        private string SPDeletePattern(string sql)
        {
            string nDelete;
            int tAS = 0;
            int tDELETE = 0;
            int tWHERE = 0;
            int deleteType = 0;
            int whereType = 0;
            nDelete = "";
            string[] uTableName;
            string[] uWhere;
            string wKolom = "";
            string[] sKolom;
            string[] allLines;
            int sIndex = 0;
            int sLine = 0;
            int hasRead = 0;

            int totalLines = CountLines(sql);
            allLines = new string[totalLines];
            using (StringReader reader2 = new StringReader(sql))
            {
                string line = string.Empty;
                do
                {
                    line = reader2.ReadLine();
                    if (line != null)
                    {
                        allLines[sLine] = line.TrimStart();
                        sLine++;
                    }
                } while (line != null);
            }

            for (var x = 0; x < allLines.Length; x++)
            {
                if ((allLines[x].Split(' ').First() == "delete") || (allLines[x].Split(' ').First() == "Delete") || (allLines[x].Split(' ').First() == "DELETE"))
                {
                    deleteType += 1;
                }
                if ((allLines[x].Split(' ').First() == "Where") || (allLines[x].Split(' ').First() == "where") || (allLines[x].Split(' ').First() == "WHERE"))
                {
                    whereType += 1;
                }
            }

            uTableName = new string[deleteType];
            uWhere = new string[whereType];

            var counter = 0;
            tDELETE = 1;
            tWHERE = 1;
            for (var i = 0; i < allLines.Length; i++)
                {
                    //  var tess = allLines[i].Split(' ').Count();
                    if ((allLines[i].Split(' ').First() == "delete") || (allLines[i].Split(' ').First() == "Delete") || (allLines[i].Split(' ').First() == "DELETE"))
                    {

                    var kSet = allLines[i].Split(' ').First();
                  
                    counter ++;  
                        if (tDELETE <= deleteType)  //# 99 : tag agar jika ada DELETE lagi tidak akan di baca
                        {
                        allLines[i] = allLines[i].TrimEnd();
                        var iDELETE = allLines[i].Split(' ').Count();
                           

                        switch (iDELETE)
                            {
                                case 1:
                                    uTableName[tDELETE-1] = allLines[i + 1].TrimStart();
                                    tDELETE += 1;
                                    break;
                                case 2:
                                    if(Regex.IsMatch(allLines[i], @"\b(from|From|FROM)\b"))
                                        {
                                          uTableName[tDELETE - 1] = allLines[i].Split(' ').Last();
                                          uTableName[tDELETE - 1] += "  " + allLines[i + 1].TrimStart();
                                        }
                                    else
                                        {
                                          uTableName[tDELETE - 1] = allLines[i].Split(' ').Last();
                                        }
                                   
                                    tDELETE += 1;
                                    break;
                                case 3:
                                     uTableName[tDELETE - 1] = allLines[i].Replace(kSet, "");
                                        tDELETE += 1;
                                        break;
                                
                                default:
                                uTableName[tDELETE - 1] = allLines[i].Replace(kSet, "");
                                tDELETE += 1;
                                break;
                            }
                          
                      
                        }

                    }

                 
                    else if ((allLines[i].Split(' ').First() == "Where") || (allLines[i].Split(' ').First() == "where") || (allLines[i].Split(' ').First() == "WHERE"))
                    {
                   
                        var kSet = allLines[i].Split(' ').First();
                        
                       
                        if (tWHERE <= whereType)  
                        {
                        allLines[i] = allLines[i].TrimEnd();
                        var iWHERE = allLines[i].Split(' ').Count();

                            switch (iWHERE)
                            {
                                case 1:
                                if (whereType > 1)
                                {
                                    var stop = false;
                                    for (var y = i; y < allLines.Length; y++)
                                    {
                                        if ((stop != true) && (y != allLines.Length -1))
                                        {
                                            if (Regex.IsMatch(allLines[y+1], @"\b(delete|Delete|DELETE)\b"))
                                            {
                                                stop = true;
                                            }
                                            else
                                            {
                                                uWhere[tWHERE - 1] += allLines[y + 1].TrimStart() + "\r\n";
                                            }
                                        }
                                       
                                        
                                    }
                                    uWhere[tWHERE - 1] = uWhere[tWHERE - 1].Replace(@"@", "p_");

                                }
                                else
                                {
                                    for (var y = i; y < allLines.Length; y++)
                                    {
                                        if (y != allLines.Length - 1)
                                        { uWhere[tWHERE - 1] += allLines[y + 1].TrimStart() + "\r\n"; }
                                    }
                                    uWhere[tWHERE - 1] = uWhere[tWHERE - 1].Replace(@"@", "p_");
                                }
                                tWHERE += 1;
                                break;
                              
                                default:
                                uWhere[tWHERE - 1] = allLines[i].Replace(kSet, "");
                                uWhere[tWHERE - 1] = uWhere[tWHERE - 1].Replace(@"@", "p_");
                                tWHERE += 1;
                                    break;
                            }


                        }

                    }


                }
               
            if (deleteType == 1)
                    {
                      if (whereType == 0)
                        {
                             nDelete = "DELETE \r\n" + uTableName[0] + "\r\n";
                        }
                      else
                {
                    nDelete = "DELETE \r\n" + uTableName[0] + "\r\n" +
                                   "WHERE\r\n" +
                                   uWhere[0];
                }
                       
                    }
                               
                else if (whereType == 0)
                {
                    for (var y = 0; y < deleteType; y++)
                    {
                    nDelete += "DELETE \r\n" + uTableName[y] + "\r\n";
                    }
                    
                }
                else
                    {
                        for (var y = 0; y < deleteType; y++)
                        {
                             nDelete += "DELETE \r\n" + uTableName[y] + "\r\n" +
                                         "WHERE\r\n" +
                                        uWhere[y] ;
                          }
                    }

     
            return nDelete;
        }

        private string SPUpdatePattern(string sql)
        {

            string nUpdate;
            int tAS = 0;
            int tSET = 0;
            int tUPDATE = 0;
            int tWHERE = 0;
            int updateType = 0;
            nUpdate = "";
            string uTableName = "";
            string wKolom = "";
            string[] sKolom;
            string[] allLines;
            int sIndex = 0;
            int sLine = 0;

            int totalLines = CountLines(sql);
            allLines = new string[totalLines];
            using (StringReader reader2 = new StringReader(sql))
            {
                string line = string.Empty;
                do
                {
                    line = reader2.ReadLine();
                    if (line != null)
                    {
                        allLines[sLine] = line.TrimStart();
                        sLine++;
                    }
                } while (line != null);
            }

            for (var x = 0; x < allLines.Length; x++)
            {
                if (Regex.IsMatch(allLines[x], @"\b(update|Update|UPDATE)\b"))
                {
                    updateType += 1;
                }
            }

            if (updateType == 1)  //#### awal switch ##
            {

                var tsIndex = 0;
                for (var s = 0; s < allLines.Length; s++)
                {

                    if (Regex.IsMatch(allLines[s], @"\b(set|Set|SET)\b"))  //|| (Regex.IsMatch(allLines[s], "Set")) || (Regex.IsMatch(allLines[s], "SET")))
                    {
                        if (tsIndex == 0)
                        {
                            sIndex = s;
                            tsIndex = 1;
                        }
                    }
                    if (Regex.IsMatch(allLines[s], @"\b(where|Where|WHERE)\b"))  // || (Regex.IsMatch(allLines[s], "Where")) || (Regex.IsMatch(allLines[s], "WHERE")))
                    { sIndex = s - sIndex - 1; }
                }

                if (sIndex != 0)
                { sKolom = new string[sIndex]; }
                else
                { sKolom = new string[1]; }

                for (var i = 0; i < allLines.Length; i++)
                {
                    //  var tess = allLines[i].Split(' ').Count();
                    if ((allLines[i].Split(' ').First() == "as") || (allLines[i].Split(' ').First() == "As") || (allLines[i].Split(' ').First() == "AS"))
                    {
                        if (tAS == 0)
                        {
                            var iAS = allLines[i].Split(' ').Count();

                            switch (iAS)
                            {
                                case 1:
                                    break;
                                case 2:
                                    uTableName = allLines[i + 1].TrimStart();
                                    tUPDATE = 1;
                                    break;
                                case 3:
                                    uTableName = allLines[i].Split(' ').Last();
                                    tUPDATE = 1;
                                    break;
                                case 4:
                                    string[] nTN = allLines[i].Split(' ');
                                    uTableName = nTN[2];
                                    for (var n = 0; n < sIndex; n++)
                                    {
                                        sKolom[n] = allLines[i + n + 1].TrimStart();
                                        sKolom[n] = sKolom[n].Replace(@"@", "p_");
                                    }
                                    tUPDATE = 1;
                                    tSET = 1;
                                    break;
                                default:
                                    break;
                            }
                            tAS = 1;
                        }

                    }

                    if ((allLines[i].Split(' ').First() == "Update") || (allLines[i].Split(' ').First() == "update") || (allLines[i].Split(' ').First() == "UPDATE"))
                    {
                        if (tUPDATE == 0)
                        {
                            var iUPDATE = allLines[i].Split(' ').Count();
                            switch (iUPDATE)
                            {
                                case 1:
                                    uTableName = allLines[i + 1].TrimStart();
                                    tUPDATE = 1;
                                    break;
                                case 2:
                                    uTableName = allLines[i].Split(' ').Last();
                                    tUPDATE = 1;
                                    break;
                                case 3:
                                    string[] nTN = allLines[i].Split(' ');
                                    uTableName = nTN[1];
                                    for (var n = 0; n < sIndex; n++)
                                    {
                                        sKolom[n] = allLines[i + n + 1].TrimStart();
                                        sKolom[n] = sKolom[n].Replace(@"@", "p_");
                                    }
                                    tUPDATE = 1;
                                    tSET = 1;
                                    break;

                                default:
                                    break;
                            }
                            // uTableName = allLines[i + 1].TrimStart();
                            tUPDATE = 1;
                        }
                    }
                    else if ((allLines[i].Split(' ').First() == "Set") || (allLines[i].Split(' ').First() == "set") || (allLines[i].Split(' ').First() == "SET"))
                    {
                        if (tSET == 0)
                        {
                            //if (sIndex == 0)
                            //{

                            //    var tes = "tes";

                            //}
                            var iSET = allLines[i].Split(' ').Count();
                            var kSet = allLines[i].Split(' ').First();
                            switch (iSET)
                            {
                                case 1:

                                    for (var n = 0; n < sIndex; n++)
                                    {
                                        sKolom[n] = allLines[i + n + 1].TrimStart();
                                        sKolom[n] = sKolom[n].Replace(@"@", "p_");
                                    }

                                    tSET = 1;
                                    break;

                                default:

                                    sKolom[0] = allLines[i].Replace(kSet, "");
                                    sKolom[0] = sKolom[0].Replace(@"@", "p_");


                                    tSET = 1;
                                    break;
                            }
                            tSET = 1;
                        }


                    }
                    else if ((allLines[i].Split(' ').First() == "Where") || (allLines[i].Split(' ').First() == "where") || (allLines[i].Split(' ').First() == "WHERE"))
                    {
                        if (tWHERE == 0)
                        {
                            var iWHERE = allLines[i].Split(' ').Count();
                            var kWHERE = allLines[i].Split(' ').First();
                            switch (iWHERE)
                            {
                                case 1:
                                    wKolom = allLines[i + 1].TrimStart();
                                    wKolom = wKolom.Replace(@"@", "p_");
                                    break;

                                default:
                                    wKolom = allLines[i].Replace(kWHERE, "");
                                    wKolom = wKolom.Replace(@"@", "p_");
                                    break;
                            }
                        }

                    }


                }
                nUpdate = "UPDATE " + uTableName + "\r\n" +
                          "SET \r\n";
                if (sIndex != 0)
                {
                    for (var n = 0; n < sIndex; n++)
                    {
                        nUpdate += sKolom[n] + "\r\n";
                    }
                }
                else
                {
                    nUpdate += sKolom[0] + "\r\n";
                }

                nUpdate += "WHERE \r\n" + wKolom + "\r\n";
            }
            else //## another type
            {
                nUpdate = "-- ### 2 update #####";
            }
            return nUpdate;
        }

        public void GetRecodScript(RecordSchemaInfoData schemaInfo, string path, string SchemaPath)
        {
            var pathResult = "D:\\tempMigration\\result\\" + schemaInfo.TableName + "_Result.sql";
            string[] rColumnDT = null;
            string[] rColumnName = null;
            var r = 0;
            //  var getType = "";
            var columnName = "";
            var nValues = "";
            var getValue = "";
          //  var itsBinary = false;
            //if (schemaInfo.name == "BOS_AR_ArTrans")
            //    Console.WriteLine(schemaInfo.name);

                XmlDocument nData = new XmlDocument();
                XmlSchemaSet schemaSet = new XmlSchemaSet();
                schemaSet.Add("http://www.w3.org/2001/XMLSchema", SchemaPath);
                schemaSet.Compile();
                XmlSchema xmlSchema = null;
                foreach (XmlSchema schema in schemaSet.Schemas())
                {
                    xmlSchema = schema;
                }
                foreach (object item in xmlSchema.Items)
                {
                    XmlSchemaElement schemaElement = item as XmlSchemaElement;
                    XmlSchemaComplexType complexType = item as XmlSchemaComplexType;
                    if (schemaElement != null)
                    {
                        //MessageBox.Show(schemaElement.Name);

                        XmlSchemaType schemaType = schemaElement.SchemaType;
                        XmlSchemaComplexType schemaComplexType = schemaType as XmlSchemaComplexType;

                        if (schemaComplexType != null)
                        {
                            XmlSchemaParticle particle = schemaComplexType.Particle;
                            XmlSchemaChoice schemaChoice = particle as XmlSchemaChoice;

                            var item2 = schemaChoice.Items[0];
                            XmlSchemaElement schemaElement2 = item2 as XmlSchemaElement;
                            if (schemaElement2 != null)
                            {
                                //    MessageBox.Show(schemaElement2.Name);
                                XmlSchemaType schemaType2 = schemaElement2.SchemaType;
                                XmlSchemaComplexType schemaComplexType2 = schemaType2 as XmlSchemaComplexType;
                                if (schemaComplexType2 != null)
                                {
                                    XmlSchemaParticle particle2 = schemaComplexType2.Particle;
                                    XmlSchemaSequence sequence2 = particle2 as XmlSchemaSequence;
                                    if (sequence2 != null)
                                    {
                                        //  r = 0;
                                        rColumnName = new string[sequence2.Items.Count];
                                        rColumnDT = new string[sequence2.Items.Count];
                                        foreach (XmlSchemaElement childElement in sequence2.Items)
                                        {
                                            rColumnName[r] = childElement.Name;
                                            rColumnDT[r] = childElement.SchemaTypeName.Name;
                                        //   MessageBox.Show(childElement.Name + " " + childElement.SchemaTypeName.Name);
                                        //    if (rColumnDT[r] == "base64Binary")
                                        //       { itsBinary = true; }

                                            r++;
                                        }

                                    }
                                }

                            }


                        }

                    }
                }

                nData.Load(path);


                XmlNodeList list = nData.DocumentElement.GetElementsByTagName("Table");

            if (list.Count != 0)
            {
                for (int i = 0; i < list[0].ChildNodes.Count; i++)
                {
                    if (i == (list[0].ChildNodes.Count - 1))
                    {
                        columnName += list[0].ChildNodes[i].Name;
                    }
                    else
                    {
                        columnName += list[0].ChildNodes[i].Name + ",";
                    }

                }
                using (StreamWriter sw = new StreamWriter(pathResult))
                {
                    //  sw.Write(nValue);
                   // if (schemaInfo.name == "BOS_INV_StockTransferType")
                    //    Console.WriteLine("test");
                    
                    getValue += "INSERT INTO " + schemaInfo.name + "(" + columnName + ") " + "VALUES\r\n";
                    //    sw.WriteLine("INSERT INTO " + schemaInfo.name + "(" + columnName + ") " + "VALUES");
                    sw.Write(getValue);
                    for (int p = 0; p < list.Count; p++)
                    {

                        nValues += "(";
                        //==== mulai value kolom

                        for (int i = 0; i < list[p].ChildNodes.Count; i++)
                        {
                            var nColumn = list[p].ChildNodes[i].InnerText;
                             nColumn = nColumn.Replace(@"'", "''");
                            //   nValues += nColumn;
                            if (nColumn == "" || nColumn == null)
                            {
                                if (i == (list[p].ChildNodes.Count - 1))
                                {
                                    if (rColumnDT[i] != "string" && rColumnDT[i] != "base64Binary" && rColumnDT[i] != "dateTime")
                                    { nValues += nColumn; }
                                    else
                                    { nValues += "''"; }
                                }
                                else
                                {
                                    if (rColumnDT[i] != "string" && rColumnDT[i] != "base64Binary" && rColumnDT[i] != "dateTime")
                                    { nValues += nColumn + ","; }
                                    else
                                    { nValues += "'',"; }
                                }
                            }
                            else
                            {
                                if (i == (list[p].ChildNodes.Count - 1))
                                {
                                    switch (rColumnDT[i])
                                    {
                                        case "string":
                                        case "base64Binary":
                                            nValues += "'" + nColumn + "'";
                                            break;
                                        case "dateTime":
                                            nColumn = nColumn.Remove(nColumn.Length - 6);
                                            nColumn = nColumn.Replace(@"T", " ");
                                            nValues += "'" + nColumn + "'";
                                            break;

                                        default:
                                            nValues += nColumn;
                                            break;
                                    }


                                }
                                else
                                {

                                    switch (rColumnDT[i])
                                    {
                                        case "string":
                                        case "base64Binary":
                                            nValues += "'" + nColumn + "',";
                                            break;
                                        case "dateTime":
                                            nColumn = nColumn.Remove(nColumn.Length - 6);
                                            nColumn = nColumn.Replace(@"T", " ");
                                            nValues += "'" + nColumn + "',";
                                            break;

                                        default:
                                            nValues += nColumn + ",";
                                            break;
                                    }
                                }
                            }
                        }
                        //========last value
                        if (p == (list.Count - 1))
                        {
                            nValues += ");\r\n";
                        }
                        else
                        {
                            nValues += "),\r\n";
                        }
                        //   getValue += nValues;
                        sw.Write(nValues);
                        nValues = "";
                    }


                }
            }
            else
            {
                getValue = "";
            }
            
           // return getValue;
        }

       

        private string cekParameter(UsedParameter data)
        {
            var cekResult = "";
            if (data.DomainType != "")
            {
                cekResult = data.DomainType;
            }
            else
            {
                cekResult = GetDataTypeMap(data.DataType);
            }

           
            return cekResult;
        }

        private readonly List<TablesFieldDataType> mapDataTypes = new List<TablesFieldDataType>
        {
            new TablesFieldDataType { DataType="datetime", ConvertedDataType="timestamp" },
            new TablesFieldDataType { DataType="bigint", ConvertedDataType="bigint" },
            new TablesFieldDataType { DataType="binary", ConvertedDataType="bytea" },
            new TablesFieldDataType { DataType="boolean", ConvertedDataType="boolean" },
            new TablesFieldDataType { DataType="char", ConvertedDataType="char" },
            new TablesFieldDataType { DataType="currency", ConvertedDataType="money" },
            new TablesFieldDataType { DataType="dbdate", ConvertedDataType="date" },
            new TablesFieldDataType { DataType="dbtime", ConvertedDataType="time" },
            new TablesFieldDataType { DataType="dbtimestamp", ConvertedDataType="timestamp" },
            new TablesFieldDataType { DataType="date", ConvertedDataType="date" },
            new TablesFieldDataType { DataType="decimal", ConvertedDataType="numeric" },
            new TablesFieldDataType { DataType="double", ConvertedDataType="double" },
            new TablesFieldDataType { DataType="filetime", ConvertedDataType="timestamp" },
            new TablesFieldDataType { DataType="guid", ConvertedDataType="uuid" },
            new TablesFieldDataType { DataType="idispatch", ConvertedDataType="oid" },
            new TablesFieldDataType { DataType="iunknown", ConvertedDataType="oid" },
            new TablesFieldDataType { DataType="integer", ConvertedDataType="integer" },
            new TablesFieldDataType { DataType="int", ConvertedDataType="integer" },
            new TablesFieldDataType { DataType="longvarbinary", ConvertedDataType="bytea" },
            new TablesFieldDataType { DataType="longvarchar", ConvertedDataType="text" },
            new TablesFieldDataType { DataType="longvarwchar", ConvertedDataType="text" },
            new TablesFieldDataType { DataType="numeric", ConvertedDataType="numeric" },
            new TablesFieldDataType { DataType="bit", ConvertedDataType="bit" },
            new TablesFieldDataType { DataType="propvariant", ConvertedDataType="text" },
            new TablesFieldDataType { DataType="single", ConvertedDataType="real" },
            new TablesFieldDataType { DataType="smallint", ConvertedDataType="smallint" },
            new TablesFieldDataType { DataType="tinyint", ConvertedDataType="smallint" },
            new TablesFieldDataType { DataType="unsignedtinyint", ConvertedDataType="tinyint" },
            new TablesFieldDataType { DataType="nvarchar", ConvertedDataType="varchar" },
            new TablesFieldDataType { DataType="nchar", ConvertedDataType="varchar" },
            new TablesFieldDataType { DataType="varchar", ConvertedDataType="varchar" },
            new TablesFieldDataType { DataType="varbinary", ConvertedDataType="bytea" },
            new TablesFieldDataType { DataType="varnumeric", ConvertedDataType="numeric" },
            new TablesFieldDataType { DataType="varwchar", ConvertedDataType="varchar" },
            new TablesFieldDataType { DataType="variant", ConvertedDataType="oid" },
            new TablesFieldDataType { DataType="wchar", ConvertedDataType="char" },
            new TablesFieldDataType { DataType="image", ConvertedDataType="bytea" },
            new TablesFieldDataType { DataType="bstr", ConvertedDataType="--" },
            new TablesFieldDataType { DataType="empty", ConvertedDataType="--" },
            new TablesFieldDataType { DataType="error", ConvertedDataType="--" },
            new TablesFieldDataType { DataType="unsignedbigint", ConvertedDataType="--" },
            new TablesFieldDataType { DataType="unsignedint", ConvertedDataType="--" },
            new TablesFieldDataType { DataType="unsignedsmallint", ConvertedDataType="--" },
        };

        public string GetDataTypeMap(string dataType)
        {
            if (dataType == null)
            {
                throw new ArgumentNullException("dataType");
            }


            var findingResult = mapDataTypes.SingleOrDefault(x => string.Equals(x.DataType, dataType, StringComparison.CurrentCultureIgnoreCase));

            return findingResult == null ? "" : findingResult.ConvertedDataType;
        }

        private string cekSuffix(UsedColumn data)
        {
            var cekResult = "";
           

            if (data.CharMaxLength != 0 && data.CharMaxLength != -1 && data.CharMaxLength < 10485760 )
            {
                cekResult = " (" + data.CharMaxLength + ")";
            }
            else if (data.Scale != 0)
            {
                cekResult = " (" + data.Precision + "," + data.Scale + ")";
            }

            if (data.isNullable == false)
            {
                cekResult += "  NOT NULL";
            }

            if (data.Domain != "")
            {
                cekResult = data.Domain;
            }
            else if (data.DataType == "binary")
            {
                cekResult = GetDataTypeMap(data.DataType);
                if (data.isNullable == false)
                {
                    cekResult = GetDataTypeMap(data.DataType) + "  NOT NULL";
                }else
                {
                    cekResult = GetDataTypeMap(data.DataType);
                }
            }
            else
            {
                cekResult = GetDataTypeMap(data.DataType) + cekResult;
            }
            return cekResult;

        }

        private class nTable
        {
            public string[] nColumn { get; set; }
        }

        private  static int CountLines(string text)
        {
            int count = 0;
            if (!string.IsNullOrEmpty(text))
            {
                count = text.Length - text.Replace("\n", string.Empty).Length;

               
                if (text[text.Length - 1] != '\n')
                {
                    ++count;
                }
            }

            return count;
        }
    }
}
