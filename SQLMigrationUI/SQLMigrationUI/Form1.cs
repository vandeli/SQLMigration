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
        private readonly ITableManager tableManager;
        private readonly IPKManager pkManager;
        private readonly IIndexManager indexManager;
        private readonly ISPManager spManager;

        private readonly ICoreDB coreDb;
        private List<ConfigData> globalListConfig;
        private ConfigData globalConfig;

        public Form1()
        {
            coreDb = of.GetInstanceCoreDB(Properties.Settings.Default.configPath);
            if (!File.Exists(Properties.Settings.Default.configPath))
                coreDb.CreateTable<ConfigData>();

            InitializeComponent();
            InitComboBox();

            binder = of.GetInstanceBinder();
            udtManager = of.GetInstanceUdtManager();
            tableManager = of.GetInstanceTableManager();
            pkManager = of.GetInstancePKManager();
            indexManager = of.GetInstanceIndexManager();
            spManager = of.GetInstanceSPManager();
        }

        public void ProsesManager(String pilihan)
        {
            switch (pilihan)
            {
                case "UDT":
                    globalConfig.listUDTSchemaInfo = udtManager.GetSchema(globalConfig);
                    globalConfig.listUDTResultInfo = udtManager.Convert(globalConfig.listUDTSchemaInfo);
                    coreDb.Insert(globalConfig);
                    cboConfigName.Refresh();

                    var UDTscriptStringBuilder = new StringBuilder();
                    foreach (var udtResultData in globalConfig.listUDTResultInfo)
                    {
                        UDTscriptStringBuilder.AppendLine(udtResultData.sqlString);
                    }
                    txtResult.Text = UDTscriptStringBuilder.ToString();
                    binder.BindControls(DGUDT, globalConfig.listUDTSchemaInfo);
                    break;

                case "Table":
                    globalConfig.listTableSchemaInfo = tableManager.GetSchema(globalConfig);
                    globalConfig.listTableResultInfo = tableManager.Convert(globalConfig.listTableSchemaInfo);
                    coreDb.Insert(globalConfig);
                    cboConfigName.Refresh();

                    var TableScriptStringBuilder = new StringBuilder();
                    foreach (var tableResultData in globalConfig.listTableResultInfo)
                    {
                        TableScriptStringBuilder.AppendLine(tableResultData.sqlString);
                    }

                    txtResult.Text = TableScriptStringBuilder.ToString();
                    binder.BindControls(DGTABLE, globalConfig.listTableSchemaInfo);
                    break;

                case "PK":
                    globalConfig.listPKSchemaInfo = pkManager.GetSchema(globalConfig);
                    globalConfig.listPKResultInfo = pkManager.Convert(globalConfig.listPKSchemaInfo);
                    coreDb.Insert(globalConfig);
                    cboConfigName.Refresh();

                    var PKscriptStringBuilder = new StringBuilder();
                    foreach (var pkResultData in globalConfig.listPKResultInfo)
                    {
                        PKscriptStringBuilder.AppendLine(pkResultData.sqlString);
                    }
                    txtResult.Text = PKscriptStringBuilder.ToString();
                    binder.BindControls(DGPK, globalConfig.listPKSchemaInfo);
                    break;

                case "Index":
                    globalConfig.listIndexSchemaInfo = indexManager.GetSchema(globalConfig);
                    globalConfig.listIndexResultInfo = indexManager.Convert(globalConfig.listIndexSchemaInfo);
                    coreDb.Insert(globalConfig);
                    cboConfigName.Refresh();

                    var IndexscriptStringBuilder = new StringBuilder();
                    foreach (var indexResultData in globalConfig.listIndexResultInfo)
                    {
                        IndexscriptStringBuilder.AppendLine(indexResultData.sqlString);
                    }
                    txtResult.Text = IndexscriptStringBuilder.ToString();
                    binder.BindControls(DGINDEX, globalConfig.listIndexSchemaInfo);
                    break;

                case "SP":
                    globalConfig.listSPSchemaInfo = spManager.GetSchema(globalConfig);
                    globalConfig.listSPResultInfo = spManager.Convert(globalConfig.listSPSchemaInfo);
                    coreDb.Insert(globalConfig);
                    cboConfigName.Refresh();

                    var SPscriptStringBuilder = new StringBuilder();
                    foreach (var spResultData in globalConfig.listSPResultInfo)
                    {
                        SPscriptStringBuilder.AppendLine(spResultData.sqlString);
                    }
                    txtResult.Text = SPscriptStringBuilder.ToString();
                    binder.BindControls(DGSP, globalConfig.listSPSchemaInfo);
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

            if (e.KeyChar == (char) 8)
            {
                if (cb.SelectionStart <= 1)
                {
                    cb.Text = "";
                    return;
                }

                strFindStr = cb.SelectionLength == 0
                    ? cb.Text.Substring(0, cb.Text.Length - 1)
                    : cb.Text.Substring(0, cb.SelectionStart - 1);
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

                RefreshUi();
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
                RefreshUi();
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

            binder.BindControls(TpSourceMss, globalConfig.Source);
            binder.BindControls(this, globalConfig);
            binder.BindControls(TpConfig, globalConfig);

            binder.BindControls(DGUDT, globalConfig.listUDTSchemaInfo);
            binder.BindControls(DGTABLE, globalConfig.listTableSchemaInfo);
            binder.BindControls(DGPK, globalConfig.listPKSchemaInfo);
            binder.BindControls(DGINDEX, globalConfig.listIndexSchemaInfo);
        }

        private void BindingCboConfig()
        {
            binder.BindControls(cboConfigName,globalListConfig);
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

                globalConfig = coreDb.Find<ConfigData>(cboConfigName.SelectedValue.ToString());
                BindControls();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                ShowWarnMessage(ex.Message);
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Delete config ?", "Confirm", MessageBoxButtons.YesNo, MessageBoxIcon.Question) !=
                    DialogResult.Yes) return;
                coreDb.Delete(globalConfig);
                RefreshUi();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                ShowWarnMessage(ex.Message);
            }
        }

        private void RefreshUi()
        {
            globalListConfig = coreDb.GetList<ConfigData>();
            if (globalListConfig.Count > 0)
                globalConfig = globalListConfig[0];

            SetupBinding();
        }

        private void SetupBinding()
        {
            BindingCboConfig();
            BindControls();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                RefreshUi();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                ShowWarnMessage(ex.Message);
            }
        }
    }
}