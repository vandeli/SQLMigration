using EasyTools.Interface;
using EasyTools.Interface.DB;
using EasyTools.Interface.IO;
using SQLMigration.Interface.Data;
using SQLMigration.Interface.Interface.Manager;
using SQLMigrationOF;
using System;
using System.IO;
using System.Linq;
using System.Management;
using System.Text;
using System.Windows.Forms;
using EasyTools.Data;
using System.Collections.Generic;

namespace SQLMigration.UI
{
    public partial class Form1 : Form
    {
        private OF of = new OF();
        private IUDTManager udtManager;
        ICoreDB coreDb;
        ConfigData globalConfig;

        public Form1()
        {
            ConfigData cData = new ConfigData();
            this.coreDb = of.GetInstanceCoreDB(Properties.Settings.Default.configPath);
            if(!File.Exists(Properties.Settings.Default.configPath))
                coreDb.CreateTable<ConfigData>();
            InitializeComponent();
            InitComboBox();
           
          
        }

        public void ProsesManager(String pilihan, ConfigData configdata)
        {

         
            StringBuilder scriptStringBuilder = new StringBuilder();
            foreach (var udtResultData in configdata.listUDTResultInfo)
            {

                scriptStringBuilder.AppendLine(udtResultData.sqlString);

            }

            txtResult.Text = scriptStringBuilder.ToString();

            DGUDT.DataSource = null;
            DGUDT.DataSource = configdata.listUDTSchemaInfo;
            DGUDT.Refresh();

            IFileManager fileManager = of.GEtInstanceFileManager();
            //fileManager.CreateFile(scriptStringBuilder.ToString(), configdata.OutputPath + @"\UDTScript.sql");
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
           
            return isNull;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            refreshList();
              

            //### testing purpose only, delete when done #####
            ManagementObjectSearcher searcher = new ManagementObjectSearcher("SELECT UserName FROM Win32_ComputerSystem");
            ManagementObjectCollection collection = searcher.Get();
            string username = (string)collection.Cast<ManagementBaseObject>().First()["UserName"];
            txtConfigPath.Text = Properties.Settings.Default.configPath;
            lbNotif.Text = "";
            switch (username)
            {
                case @"KONTINUM22\ibnu":
                  

                    //txtServer.Text = @"KEA-IBNU\SQLSERVER2012";
                    //txtUsername.Text = "sa";
                    //txtPassword.Text = "12345";
                    //txtDatabase.Text = "padma_live";
                    //txtPath.Text = @"..\Output\";
                    //txtConfigName.Text = "Index_pgSQL.sql";
                    break;

                case @"KONTINUM22\bintang":

                    txtServer.Text = @"KEA-BINTANG\SQLSERVER2014";
                    txtUsername.Text = "sa";
                    txtPassword.Text = "12345";
                    txtDatabase.Text = "Reckitt2";
                    txtPath.Text = @"..\Output\";
                    //txtConfigName.Text = "UDT_pgSQL.sql";
                    break;

            }
            //############################################################333

        }

        private void btnConvert_Click_1(object sender, EventArgs e)
        {
            var isNull = true;
            if (string.IsNullOrEmpty(cboProcess.Text))
            {
                cboProcess.Focus();
                MessageBox.Show("Please choose process");
                isNull = false;
            }

            var validate = ValidateInput();
            if (!validate && !isNull) return;
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
                    OutputPath = txtPath.Text
                };

                ProsesManager(cboProcess.Text, xData);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }            

        private void btnSaveQuery_Click(object sender, EventArgs e)
        {
            SaveFileDialog save = new SaveFileDialog();
            save.FileName = cboProcess.Text + "_PgSQL.sql";
            save.Filter = "Sql File | *.sql";
            if (save.ShowDialog() == DialogResult.OK)
            {
                StreamWriter writer = new StreamWriter(save.OpenFile());
                writer.Write(txtResult.Text);                  
               
                writer.Dispose();
                writer.Close();
            }
        }

        private void btnSaveDb_Click(object sender, EventArgs e)
        {
            var isExist = true;
            var listConfig = coreDb.GetList<ConfigData>();
          
            foreach (ConfigData configName in listConfig)
            {
                if (comboBox1.Text == configName.name)
                {
                    isExist = false;
                    MessageBox.Show("DataBase Config Name already exist");
                }

            }
            var validate = ValidateInput();
            if (validate && isExist)             
            {
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
                        name = comboBox1.Text,
                        OutputPath = txtPath.Text
                    };
                    udtManager = of.GetInstanceUdtManager();
                    xData.listUDTSchemaInfo = udtManager.GetSchema(xData);
                    xData.listUDTResultInfo = udtManager.Convert(xData.listUDTSchemaInfo);
                    coreDb.Insert(xData);
                    comboBox1.Refresh();
                    makeNotif("Database Config Saved.");
                    refreshList();
                   
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            var listConfig = coreDb.GetList<ConfigData>();
            var selectData = listConfig.Where(sumber => sumber.name == comboBox1.Text).ToList();
            var database = selectData.Select(d => d.Source).ToList();

            foreach (DBData item in database)
            {
                txtDatabase.Text = item.dbName;
                txtServer.Text = item.serverName;
                txtUsername.Text = item.userName;
                txtPassword.Text = item.password;
            }
        }

        private void makeNotif(string text)
        {
            lbNotif.Text = text;
            var t = new Timer();
            t.Interval = 3000; // it will Tick in 3 seconds
            t.Tick += (s, e) =>
            {
                lbNotif.Text = "";
                t.Stop();
            };
            t.Start();

        }

        private void refreshList()
        {
            var listConfig = coreDb.GetList<ConfigData>();
            var total = listConfig.Count;
           
            comboBox1.DisplayMember = "name";
            comboBox1.ValueMember = "id";
            comboBox1.DataSource = listConfig;
            comboBox1.Refresh();
           
           var selectData = listConfig[total-1]; 
            comboBox1.Text = selectData.name;
            globalConfig = selectData;
            var database = selectData.Source;

            txtDatabase.Text = database.dbName;
            txtServer.Text = database.serverName;
            txtUsername.Text = database.userName;
            txtPassword.Text = database.password;

            DGUDT.DataSource = globalConfig.listUDTSchemaInfo;
            DGUDT.Refresh();
        }

      
    }
}