﻿using System;
using System.Windows.Forms;
using SQLMigrationInterface;
using SQLMigration.Data;
using System.Data.SqlClient;
using System.Management;
using System.Linq;
using SQLMigrationOF;
using static SQLMigrationUI.Program;
using System.Data;

namespace SQLMigrationUI
{
    public partial class Form1 : Form
    {
      private OF of = new OF();
      private  IUDTManager udtManager;
      private readonly IManager tableManager;
      private readonly IPKManager pkManager;
      private readonly IIndexManager indexManager;    
    
       
        public Form1()
        {
         // udtManager = of.GetInstanceUdtManager();
          tableManager = of.GetInstanceTableManager();
          pkManager = of.GetInstancePkManager();
          indexManager = of.GetInstanceIndexManager();
          InitializeComponent();
          InitComboBox();
        }

        public void ProsesManager(String pilihan, ConfigData configdata)
        {
            switch (pilihan)
            {
                case "UDT":

                    DataTable data = new DataTable();
                    udtManager.SetConfig(configdata);
                    data = udtManager.GetSchema();
                    udtManager.Convert(data);
                    break;

                case "PK":
                    DataTable data = new DataTable();
                    pkManager.SetConfig(configdata);
                    data = pkManager.GetSchema();
                    pkManager.Convert(data);
                    break;

                case "Table":
                    DataTable data = new DataTable();
                    tableManager.SetConfig(configdata);
                    data = tableManager.GetSchema();
                    tableManager.Convert(data);
                    break;

                case "Index":
                    DataTable data = new DataTable();
                    indexManager.SetConfig(configdata);
                    data = indexManager.GetSchema();
                    indexManager.Convert(data);
                    break;

                default:
                    MessageBox.Show("Pilihan belum tersedia");
                    break;
            }
        }

        private void InitComboBox()
        {
            cboProcess.Items.Add("UDT");
            cboProcess.Items.Add("Table");
            cboProcess.Items.Add("Index");
            cboProcess.Items.Add("PK");
            cboProcess.Items.Add("SP");
            cboProcess.Items.Add("Record");
        }

        private void cboProcess_KeyPress(object sender, KeyPressEventArgs e)
        {
            AutoComplete(cboProcess, e, false);
        }

        public void AutoComplete(ComboBox cb, KeyPressEventArgs e, bool blnLimitToList)
        {
            string strFindStr;

            if (e.KeyChar == (char)8)
            {
                if (cb.SelectionStart <= 1)
                {
                    cb.Text = "";
                    return;
                }

                strFindStr = cb.SelectionLength == 0 ? cb.Text.Substring(0, cb.Text.Length - 1) : cb.Text.Substring(0, cb.SelectionStart - 1);
            }
            else
            {
                if (cb.SelectionLength == 0)
                    strFindStr = cb.Text + e.KeyChar;
                else
                    strFindStr = cb.Text.Substring(0, cb.SelectionStart) + e.KeyChar;
            }

            var intIdx = -1;
            intIdx = cb.FindString(strFindStr);

            if (intIdx != -1)
            {
                cb.SelectedText = "";
                cb.SelectedIndex = intIdx;
                cb.SelectionStart = strFindStr.Length;
                cb.SelectionLength = cb.Text.Length;
                e.Handled = true;
            }
            else
            {
                e.Handled = blnLimitToList;
            }
        }

        private bool ValidateInput()
        {
            var isNull = true;
            if (txtServer.Text == "" || txtServer == null)
            {
                txtServer.Focus();
                isNull = false;
            }
            else if (txtDatabase.Text == "" || txtDatabase == null)
            {
                txtDatabase.Focus(); 

                isNull = false;
            }
            else if (txtUsername.Text == "" || txtUsername == null)
            {
                txtUsername.Focus();
                isNull = false;
            }
            else if (txtPassword.Text == "" || txtPassword == null)
            {
                txtPassword.Focus();
                isNull = false;
            }
            else if (string.IsNullOrEmpty(cboProcess.Text))
            {
                cboProcess.Focus();
                    isNull = false;
            }

            return isNull;
        }

       
        private void Form1_Load(object sender, EventArgs e)
        {
          //  public static string configPath;
            
            //### testing purpose only, delete when done #####
            ManagementObjectSearcher searcher = new ManagementObjectSearcher("SELECT UserName FROM Win32_ComputerSystem");
            ManagementObjectCollection collection = searcher.Get();
            string username = (string)collection.Cast<ManagementBaseObject>().First()["UserName"];

     

            switch (username)
            {
                case @"KONTINUM22\ibnu":

                    txtServer.Text = @"KEA-IBNU\SQLSERVER2012";
                    txtUsername.Text = "sa";
                    txtPassword.Text = "12345";
                    txtDatabase.Text = "padma_live";
                    txtPath.Text = @"..\Output\";
                    txtOutput.Text = "Index_pgSQL.sql";
                    break;

                case @"KONTINUM22\bintang":

                    txtServer.Text = @"KEA-BINTANG\SQLSERVER2014";
                    txtUsername.Text = "sa";
                    txtPassword.Text = "12345";
                    txtDatabase.Text = "Reckitt2";
                    txtPath.Text = @"..\Output\";
                    txtOutput.Text = "UDT_pgSQL.sql";
                    break;

            }
            //############################################################333

        }       

        private void btnConvert_Click_1(object sender, EventArgs e)
        {
            
            var validate = ValidateInput();
            if (validate == true)
            try
            {
               var param = new DBData
               {
                   serverName = txtServer.Text,
                   userName = txtUsername.Text,
                   password = txtPassword.Text,
                   dbName = txtDatabase.Text
               };
                var xData = new ConfigData
                {
                    Source = param,                   
                    Id = cboProcess.Text,
                    Destination = txtOutput.Text,
                    Path = txtPath.Text
                };

                    udtManager = of.GetInstanceUdtManager(xData);
                    ProsesManager(xData.Id, xData);    
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

      
    }
}