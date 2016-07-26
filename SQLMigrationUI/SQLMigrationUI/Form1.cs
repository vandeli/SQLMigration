using EasyTools.Interface;
using EasyTools.Interface.DB;
using EasyTools.Interface.IO;
using SQLMigration.Interface.Data;
using SQLMigration.Interface.Interface.Manager;
using SQLMigration.OF;
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
        private readonly UIOF of = new UIOF();
        private IUDTManager udtManager;

        ICoreDB coreDb;
        List<ConfigData> globalListConfig;
        ConfigData globalConfig;

        public Form1()
        {            
            coreDb = of.GetInstanceCoreDB(Properties.Settings.Default.configPath);
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
            var listConfig = coreDb.GetList<ConfigData>();
            globalListConfig = listConfig;
            var selectData = listConfig[0];           
            globalConfig = selectData;

            var database = selectData.Source;

            txtDatabase.Text = database.dbName;
            txtServer.Text = database.serverName;
            txtUsername.Text = database.userName;
            txtPassword.Text = database.password;

            BindingCboConfig();
            BindControls();
            
            comboBox1.Text = selectData.name;

            ILogger logger = of.GetInstanceLogger();
            Console.SetOut(logger.GetWriter());

            logger.OnValueChange += LoggerOnOnValueChange;

        

        }

        private void LoggerOnOnValueChange(string value)
        {
            LblLog.Text = value;
            txtLog.AppendText( System.Environment.NewLine + value);
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
                var listConfig = globalListConfig;
                comboBox1.DisplayMember = "name";
                comboBox1.ValueMember = "id";
                var selectData = listConfig.Where(sumber => sumber.id == comboBox1.SelectedValue.ToString()).SingleOrDefault();

                ProsesManager(cboProcess.Text, selectData);
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
            var listConfig = globalListConfig;

            foreach (ConfigData configName in listConfig.Where(configName => globalConfig.name == configName.name))
            {
                isExist = false;
                MessageBox.Show("Config Name Already exist");
            }

            var validate = ValidateInput();
            if (validate && isExist)
            {
                try
                {
                    
                    coreDb.Insert(globalConfig);
        
                    MessageBox.Show("Data Config created.");
                }
              

                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
          
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

            

        }

        private void BindControls()
        {
         

 
            comboBox1.DataBindings.Clear();
            txtServer.DataBindings.Clear();
            txtUsername.DataBindings.Clear();
            txtPassword.DataBindings.Clear();
            txtDatabase.DataBindings.Clear();
            txtPath.DataBindings.Clear();


            if (globalConfig == null) return;

            


            comboBox1.DataBindings.Add("Text", globalConfig, "name", false, DataSourceUpdateMode.OnPropertyChanged);
            txtServer.DataBindings.Add("Text", globalConfig.Source, "serverName", false, DataSourceUpdateMode.OnPropertyChanged);
            txtUsername.DataBindings.Add("Text", globalConfig.Source, "userName", false, DataSourceUpdateMode.OnPropertyChanged);
            txtPassword.DataBindings.Add("Text", globalConfig.Source, "password", false, DataSourceUpdateMode.OnPropertyChanged);
            txtDatabase.DataBindings.Add("Text", globalConfig.Source, "dbName", false, DataSourceUpdateMode.OnPropertyChanged);
            txtPath.DataBindings.Add("Text", globalConfig, "OutputPath", false, DataSourceUpdateMode.OnPropertyChanged);

            DGUDT.DataSource = globalConfig.listUDTSchemaInfo;
            DGUDT.Refresh();
        }

        private void BindingCboConfig()
        {
            comboBox1.DataSource = new BindingSource(globalListConfig, null);
            comboBox1.DisplayMember = "name";
            comboBox1.ValueMember = "id";
            comboBox1.Refresh();
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                var source = new DBData
                {                    
                    serverName = "",
                    dbName = "",
                    userName = "sa",
                    password = "12345",                   
                };

                var configNew = new ConfigData
                {
                    id = "",
                    Source = source,
                    name = "",
                    OutputPath = @"..\Output\",
                    updated = "",                    
                };

                globalConfig = configNew;
                globalListConfig = new List<ConfigData>();
                BindControls();
            }
            catch (Exception ex)
            {
                ShowWarnMessage(ex.Message);
            }

        }

        private static void ShowWarnMessage(String message)
        {
            MessageBox.Show(message, "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
          
            try
            {
              
                coreDb.Update(globalConfig);
                comboBox1.Refresh();               
                MessageBox.Show("Data Config updated.");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }

        private void comboBox1_Leave(object sender, EventArgs e)
        {
           
             if(comboBox1.SelectedValue == null )
                return;
            
            var selectedValue = comboBox1.SelectedValue.ToString();
            globalConfig = coreDb.Find<ConfigData>(selectedValue);
            BindControls();
        }
    }
}