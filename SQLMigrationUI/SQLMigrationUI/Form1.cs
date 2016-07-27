using EasyTools.Data;
using EasyTools.Interface.DB;
using EasyTools.Interface.IO;
using SQLMigration.Interface.Data;
using SQLMigration.Interface.Interface.Manager;
using SQLMigration.OF;
using System;
using System.CodeDom;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using EasyTools.Interface.Controls;

namespace SQLMigration.UI
{
    public partial class Form1 : Form
    {
        private readonly UIOF of = new UIOF();
        private readonly IBinder binder;
        private readonly IUDTManager udtManager;

        readonly ICoreDB coreDb;
        List<ConfigData> globalListConfig;
        ConfigData globalConfig;

        public Form1()
        {
            coreDb = of.GetInstanceCoreDB(Properties.Settings.Default.configPath);
            if (!File.Exists(Properties.Settings.Default.configPath))
                coreDb.CreateTable<ConfigData>();
          
            InitializeComponent();
            InitComboBox();

            binder = of.GetInstanceBinder();
            udtManager = of.GetInstanceUdtManager();

        }

        public void ProsesManager(String pilihan)
        {
           
            globalConfig.listUDTSchemaInfo = udtManager.GetSchema(globalConfig);
            globalConfig.listUDTResultInfo = udtManager.Convert(globalConfig.listUDTSchemaInfo);
            coreDb.Insert(globalConfig);
            cboConfigName.Refresh();

            var scriptStringBuilder = new StringBuilder();
            foreach (var udtResultData in globalConfig.listUDTResultInfo)
            {
                scriptStringBuilder.AppendLine(udtResultData.sqlString);
            }

            txtResult.Text = scriptStringBuilder.ToString();

            binder.BindControls(DGUDT,globalConfig.listUDTSchemaInfo);
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

        private void ValidateInput()
        {
            if (String.IsNullOrWhiteSpace(globalConfig.Source.name))
                throw new ArgumentNullException("globalConfig.Source.name");
            if (String.IsNullOrWhiteSpace(globalConfig.Source.serverName))
                throw new ArgumentNullException("globalConfig.Source.serverName");
            if (String.IsNullOrWhiteSpace(globalConfig.Source.userName))
                throw new ArgumentNullException("globalConfig.Source.userName");
            if (String.IsNullOrWhiteSpace(globalConfig.Source.dbName))
                throw new ArgumentNullException("globalConfig.Source.dbName");
            if (String.IsNullOrWhiteSpace(globalConfig.Source.password))
                throw new ArgumentNullException("globalConfig.Source.password");
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            try
            {
                var logger = of.GetInstanceLogger();
                Console.SetOut(logger.GetWriter());
                txtConfigPath.Text = Properties.Settings.Default.configPath;
                logger.OnValueChange += LoggerOnOnValueChange;

                var listConfig = coreDb.GetList<ConfigData>();
                globalListConfig = listConfig;

                if (listConfig.Count == 0)
                    return;

                var selectData = listConfig[0];
                globalConfig = selectData;


                BindingCboConfig();
                BindControls();

                cboConfigName.Text = selectData.name;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                ShowWarnMessage(ex.Message);
            }
            
        }

        private void LoggerOnOnValueChange(string value)
        {
            LblLog.Text = value;
            txtLog.AppendText(System.Environment.NewLine + value);
        }

        private void btnConvert_Click_1(object sender, EventArgs e)
        {

            try
            {
                if (string.IsNullOrEmpty(cboProcess.Text))
                {
                    cboProcess.Focus();
                    MessageBox.Show("Please choose process");
                }

                ValidateInput();
                cboConfigName.DisplayMember = "name";
                cboConfigName.ValueMember = "id";

                ProsesManager(cboProcess.Text);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                ShowWarnMessage(ex.Message);
            }
          
        }

        private void btnSaveQuery_Click(object sender, EventArgs e)
        {
            try
            {
                var save = new SaveFileDialog {FileName = cboProcess.Text + "_PgSQL.sql", Filter = "Sql File | *.sql"};
                if (save.ShowDialog() != DialogResult.OK) return;
                var writer = new StreamWriter(save.OpenFile());
                writer.Write(txtResult.Text);

                writer.Dispose();
                writer.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                ShowWarnMessage(ex.Message);
            }
           
        }

        private void btnSaveDb_Click(object sender, EventArgs e)
        {

            try
            {
                 ValidateInput();
           
                    coreDb.Insert(globalConfig);
                    MessageBox.Show("Data Config created.");
                    BindingCboConfig();
                    BindControls();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                ShowWarnMessage(ex.Message);
            } 
        
        }
 
        private void BindControls()
        {
                 
            if (globalConfig == null) return;

            binder.BindControls(TpSourceMss,globalConfig.Source);
            binder.BindControls(this,globalConfig);
            binder.BindControls(TpConfig,globalConfig);

            binder.BindControls(DGUDT,globalConfig.listUDTSchemaInfo);
        }

        private void BindingCboConfig()
        {
            var list = coreDb.GetList<ConfigData>();
            binder.BindControls(cboConfigName,list);
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                var source = new DBData
                {
                    name = "SQL Server",
                    serverName = "",
                    dbName = "",
                    userName = "sa",
                    password = "",
                };

                var dest = new DBData
                {
                    name = "Postgree",
                    serverName = "localhost",
                    dbName = "",
                    userName = "sa",
                    password = "",
                };

                var configNew = new ConfigData
                {

                    Source = source,
                    name = "Name",
                    OutputPath = Environment.CurrentDirectory,
                    updated = DateTime.Now,
                    Destination = dest
                };

                globalConfig = configNew;
                BindingCboConfig();
                BindControls();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                ShowWarnMessage(ex.Message);
            }
        }

        private static void ShowWarnMessage(String message)
        {
            MessageBox.Show(message, "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private void comboBox1_Leave(object sender, EventArgs e)
        {
            try
            {
                if (cboConfigName.SelectedValue == null)
                    return;

                var selectedValue = cboConfigName.SelectedValue.ToString();
                globalConfig = coreDb.Find<ConfigData>(selectedValue);
                BindControls();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                ShowWarnMessage(ex.Message);
            }
           
        }

       
    }
}