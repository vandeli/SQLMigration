namespace SQLMigration.UI
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.label1 = new System.Windows.Forms.Label();
            this.lblServer = new System.Windows.Forms.Label();
            this.lblDatabase = new System.Windows.Forms.Label();
            this.lblUsrName = new System.Windows.Forms.Label();
            this.lblPassword = new System.Windows.Forms.Label();
            this.txtServer = new System.Windows.Forms.TextBox();
            this.txtDatabase = new System.Windows.Forms.TextBox();
            this.txtUsername = new System.Windows.Forms.TextBox();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.lblProcess = new System.Windows.Forms.Label();
            this.cboProcess = new System.Windows.Forms.ComboBox();
            this.uDTManagerBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.btnConvert = new System.Windows.Forms.Button();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.TpConfig = new System.Windows.Forms.TabPage();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnNew = new System.Windows.Forms.Button();
            this.btnSaveDb = new System.Windows.Forms.Button();
            this.txtPath = new System.Windows.Forms.TextBox();
            this.button5 = new System.Windows.Forms.Button();
            this.tabControl3 = new System.Windows.Forms.TabControl();
            this.TpSourceMss = new System.Windows.Forms.TabPage();
            this.tabPage9 = new System.Windows.Forms.TabPage();
            this.label2 = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.button3 = new System.Windows.Forms.Button();
            this.tabControl2 = new System.Windows.Forms.TabControl();
            this.tabPage4 = new System.Windows.Forms.TabPage();
            this.DGUDT = new System.Windows.Forms.DataGridView();
            this.tabPage5 = new System.Windows.Forms.TabPage();
            this.DGTABLE = new System.Windows.Forms.DataGridView();
            this.tabPage6 = new System.Windows.Forms.TabPage();
            this.DGPK = new System.Windows.Forms.DataGridView();
            this.tabPage7 = new System.Windows.Forms.TabPage();
            this.DGINDEX = new System.Windows.Forms.DataGridView();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.button2 = new System.Windows.Forms.Button();
            this.btnSaveQuery = new System.Windows.Forms.Button();
            this.txtResult = new System.Windows.Forms.TextBox();
            this.tabPage10 = new System.Windows.Forms.TabPage();
            this.txtLog = new System.Windows.Forms.TextBox();
            this.cboConfigName = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtConfigPath = new System.Windows.Forms.TextBox();
            this.button4 = new System.Windows.Forms.Button();
            this.LblLog = new System.Windows.Forms.Label();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.DGSP = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.uDTManagerBindingSource)).BeginInit();
            this.tabControl1.SuspendLayout();
            this.TpConfig.SuspendLayout();
            this.tabControl3.SuspendLayout();
            this.TpSourceMss.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabControl2.SuspendLayout();
            this.tabPage4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGUDT)).BeginInit();
            this.tabPage5.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGTABLE)).BeginInit();
            this.tabPage6.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGPK)).BeginInit();
            this.tabPage7.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGINDEX)).BeginInit();
            this.tabPage3.SuspendLayout();
            this.tabPage10.SuspendLayout();
            this.tabPage1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DGSP)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(21, 10);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(79, 13);
            this.label1.TabIndex = 11;
            this.label1.Text = "Config Name";
            // 
            // lblServer
            // 
            this.lblServer.AutoSize = true;
            this.lblServer.Location = new System.Drawing.Point(22, 15);
            this.lblServer.Name = "lblServer";
            this.lblServer.Size = new System.Drawing.Size(109, 13);
            this.lblServer.TabIndex = 12;
            this.lblServer.Text = "MSSQL Server Name";
            // 
            // lblDatabase
            // 
            this.lblDatabase.AutoSize = true;
            this.lblDatabase.Location = new System.Drawing.Point(22, 44);
            this.lblDatabase.Name = "lblDatabase";
            this.lblDatabase.Size = new System.Drawing.Size(53, 13);
            this.lblDatabase.TabIndex = 13;
            this.lblDatabase.Text = "Database";
            // 
            // lblUsrName
            // 
            this.lblUsrName.AutoSize = true;
            this.lblUsrName.Location = new System.Drawing.Point(22, 71);
            this.lblUsrName.Name = "lblUsrName";
            this.lblUsrName.Size = new System.Drawing.Size(60, 13);
            this.lblUsrName.TabIndex = 14;
            this.lblUsrName.Text = "User Name";
            // 
            // lblPassword
            // 
            this.lblPassword.AutoSize = true;
            this.lblPassword.Location = new System.Drawing.Point(22, 99);
            this.lblPassword.Name = "lblPassword";
            this.lblPassword.Size = new System.Drawing.Size(53, 13);
            this.lblPassword.TabIndex = 15;
            this.lblPassword.Text = "Password";
            // 
            // txtServer
            // 
            this.txtServer.Location = new System.Drawing.Point(137, 12);
            this.txtServer.MaxLength = 100;
            this.txtServer.Name = "txtServer";
            this.txtServer.Size = new System.Drawing.Size(231, 20);
            this.txtServer.TabIndex = 0;
            this.txtServer.Tag = "ServerName";
            // 
            // txtDatabase
            // 
            this.txtDatabase.Location = new System.Drawing.Point(137, 41);
            this.txtDatabase.MaxLength = 100;
            this.txtDatabase.Name = "txtDatabase";
            this.txtDatabase.Size = new System.Drawing.Size(121, 20);
            this.txtDatabase.TabIndex = 1;
            this.txtDatabase.Tag = "DBName";
            // 
            // txtUsername
            // 
            this.txtUsername.Location = new System.Drawing.Point(137, 68);
            this.txtUsername.MaxLength = 30;
            this.txtUsername.Name = "txtUsername";
            this.txtUsername.Size = new System.Drawing.Size(121, 20);
            this.txtUsername.TabIndex = 2;
            this.txtUsername.Tag = "UserName";
            // 
            // txtPassword
            // 
            this.txtPassword.Location = new System.Drawing.Point(137, 96);
            this.txtPassword.MaxLength = 20;
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.Size = new System.Drawing.Size(121, 20);
            this.txtPassword.TabIndex = 3;
            this.txtPassword.Tag = "Password";
            this.txtPassword.UseSystemPasswordChar = true;
            // 
            // lblProcess
            // 
            this.lblProcess.AutoSize = true;
            this.lblProcess.Location = new System.Drawing.Point(488, 264);
            this.lblProcess.Name = "lblProcess";
            this.lblProcess.Size = new System.Drawing.Size(45, 13);
            this.lblProcess.TabIndex = 16;
            this.lblProcess.Text = "Process";
            // 
            // cboProcess
            // 
            this.cboProcess.FormattingEnabled = true;
            this.cboProcess.Location = new System.Drawing.Point(566, 261);
            this.cboProcess.Name = "cboProcess";
            this.cboProcess.Size = new System.Drawing.Size(121, 21);
            this.cboProcess.TabIndex = 4;
            this.cboProcess.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.cboProcess_KeyPress);
            // 
            // btnConvert
            // 
            this.btnConvert.Location = new System.Drawing.Point(566, 288);
            this.btnConvert.Name = "btnConvert";
            this.btnConvert.Size = new System.Drawing.Size(124, 23);
            this.btnConvert.TabIndex = 23;
            this.btnConvert.Text = "Convert";
            this.btnConvert.UseVisualStyleBackColor = true;
            this.btnConvert.Click += new System.EventHandler(this.btnConvert_Click_1);
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.TpConfig);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Controls.Add(this.tabPage10);
            this.tabControl1.Location = new System.Drawing.Point(12, 39);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(734, 365);
            this.tabControl1.TabIndex = 24;
            // 
            // TpConfig
            // 
            this.TpConfig.Controls.Add(this.btnCancel);
            this.TpConfig.Controls.Add(this.btnDelete);
            this.TpConfig.Controls.Add(this.btnNew);
            this.TpConfig.Controls.Add(this.btnSaveDb);
            this.TpConfig.Controls.Add(this.txtPath);
            this.TpConfig.Controls.Add(this.button5);
            this.TpConfig.Controls.Add(this.lblProcess);
            this.TpConfig.Controls.Add(this.tabControl3);
            this.TpConfig.Controls.Add(this.btnConvert);
            this.TpConfig.Controls.Add(this.label2);
            this.TpConfig.Controls.Add(this.cboProcess);
            this.TpConfig.Location = new System.Drawing.Point(4, 22);
            this.TpConfig.Name = "TpConfig";
            this.TpConfig.Padding = new System.Windows.Forms.Padding(3);
            this.TpConfig.Size = new System.Drawing.Size(726, 339);
            this.TpConfig.TabIndex = 0;
            this.TpConfig.Text = "Config";
            this.TpConfig.UseVisualStyleBackColor = true;
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(91, 264);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(79, 23);
            this.btnCancel.TabIndex = 34;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Location = new System.Drawing.Point(260, 264);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(79, 23);
            this.btnDelete.TabIndex = 33;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(6, 264);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(79, 23);
            this.btnNew.TabIndex = 32;
            this.btnNew.Text = "New ";
            this.btnNew.UseVisualStyleBackColor = true;
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // btnSaveDb
            // 
            this.btnSaveDb.Location = new System.Drawing.Point(176, 264);
            this.btnSaveDb.Name = "btnSaveDb";
            this.btnSaveDb.Size = new System.Drawing.Size(79, 23);
            this.btnSaveDb.TabIndex = 31;
            this.btnSaveDb.Text = "Save";
            this.btnSaveDb.UseVisualStyleBackColor = true;
            this.btnSaveDb.Click += new System.EventHandler(this.btnSaveDb_Click);
            // 
            // txtPath
            // 
            this.txtPath.Location = new System.Drawing.Point(90, 15);
            this.txtPath.MaxLength = 100;
            this.txtPath.Name = "txtPath";
            this.txtPath.Size = new System.Drawing.Size(231, 20);
            this.txtPath.TabIndex = 22;
            this.txtPath.Tag = "OutputPath";
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(327, 13);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(39, 23);
            this.button5.TabIndex = 29;
            this.button5.Text = "B";
            this.button5.UseVisualStyleBackColor = true;
            // 
            // tabControl3
            // 
            this.tabControl3.Controls.Add(this.TpSourceMss);
            this.tabControl3.Controls.Add(this.tabPage9);
            this.tabControl3.Location = new System.Drawing.Point(6, 42);
            this.tabControl3.Name = "tabControl3";
            this.tabControl3.SelectedIndex = 0;
            this.tabControl3.Size = new System.Drawing.Size(714, 213);
            this.tabControl3.TabIndex = 30;
            // 
            // TpSourceMss
            // 
            this.TpSourceMss.Controls.Add(this.txtPassword);
            this.TpSourceMss.Controls.Add(this.txtServer);
            this.TpSourceMss.Controls.Add(this.txtUsername);
            this.TpSourceMss.Controls.Add(this.lblServer);
            this.TpSourceMss.Controls.Add(this.txtDatabase);
            this.TpSourceMss.Controls.Add(this.lblDatabase);
            this.TpSourceMss.Controls.Add(this.lblPassword);
            this.TpSourceMss.Controls.Add(this.lblUsrName);
            this.TpSourceMss.Location = new System.Drawing.Point(4, 22);
            this.TpSourceMss.Name = "TpSourceMss";
            this.TpSourceMss.Padding = new System.Windows.Forms.Padding(3);
            this.TpSourceMss.Size = new System.Drawing.Size(706, 187);
            this.TpSourceMss.TabIndex = 0;
            this.TpSourceMss.Text = "Source Mss";
            this.TpSourceMss.UseVisualStyleBackColor = true;
            // 
            // tabPage9
            // 
            this.tabPage9.Location = new System.Drawing.Point(4, 22);
            this.tabPage9.Name = "tabPage9";
            this.tabPage9.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage9.Size = new System.Drawing.Size(706, 187);
            this.tabPage9.TabIndex = 1;
            this.tabPage9.Text = "Destination Pst";
            this.tabPage9.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(17, 15);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(63, 13);
            this.label2.TabIndex = 18;
            this.label2.Text = "Output path";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.button3);
            this.tabPage2.Controls.Add(this.tabControl2);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(726, 339);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Schema";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(13, 264);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(119, 23);
            this.button3.TabIndex = 1;
            this.button3.Text = "Refresh schema";
            this.button3.UseVisualStyleBackColor = true;
            // 
            // tabControl2
            // 
            this.tabControl2.Controls.Add(this.tabPage4);
            this.tabControl2.Controls.Add(this.tabPage5);
            this.tabControl2.Controls.Add(this.tabPage6);
            this.tabControl2.Controls.Add(this.tabPage7);
            this.tabControl2.Controls.Add(this.tabPage1);
            this.tabControl2.Location = new System.Drawing.Point(3, 3);
            this.tabControl2.Name = "tabControl2";
            this.tabControl2.SelectedIndex = 0;
            this.tabControl2.Size = new System.Drawing.Size(717, 255);
            this.tabControl2.TabIndex = 0;
            // 
            // tabPage4
            // 
            this.tabPage4.Controls.Add(this.DGUDT);
            this.tabPage4.Location = new System.Drawing.Point(4, 22);
            this.tabPage4.Name = "tabPage4";
            this.tabPage4.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage4.Size = new System.Drawing.Size(709, 229);
            this.tabPage4.TabIndex = 0;
            this.tabPage4.Text = "UDT";
            this.tabPage4.UseVisualStyleBackColor = true;
            // 
            // DGUDT
            // 
            this.DGUDT.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DGUDT.Location = new System.Drawing.Point(6, 6);
            this.DGUDT.Name = "DGUDT";
            this.DGUDT.Size = new System.Drawing.Size(697, 217);
            this.DGUDT.TabIndex = 0;
            // 
            // tabPage5
            // 
            this.tabPage5.Controls.Add(this.DGTABLE);
            this.tabPage5.Location = new System.Drawing.Point(4, 22);
            this.tabPage5.Name = "tabPage5";
            this.tabPage5.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage5.Size = new System.Drawing.Size(709, 229);
            this.tabPage5.TabIndex = 1;
            this.tabPage5.Text = "Table";
            this.tabPage5.UseVisualStyleBackColor = true;
            // 
            // DGTABLE
            // 
            this.DGTABLE.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DGTABLE.Location = new System.Drawing.Point(6, 6);
            this.DGTABLE.Name = "DGTABLE";
            this.DGTABLE.Size = new System.Drawing.Size(697, 217);
            this.DGTABLE.TabIndex = 1;
            // 
            // tabPage6
            // 
            this.tabPage6.Controls.Add(this.DGPK);
            this.tabPage6.Location = new System.Drawing.Point(4, 22);
            this.tabPage6.Name = "tabPage6";
            this.tabPage6.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage6.Size = new System.Drawing.Size(709, 229);
            this.tabPage6.TabIndex = 2;
            this.tabPage6.Text = "PK";
            this.tabPage6.UseVisualStyleBackColor = true;
            // 
            // DGPK
            // 
            this.DGPK.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DGPK.Location = new System.Drawing.Point(6, 6);
            this.DGPK.Name = "DGPK";
            this.DGPK.Size = new System.Drawing.Size(697, 217);
            this.DGPK.TabIndex = 2;
            // 
            // tabPage7
            // 
            this.tabPage7.Controls.Add(this.DGINDEX);
            this.tabPage7.Location = new System.Drawing.Point(4, 22);
            this.tabPage7.Name = "tabPage7";
            this.tabPage7.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage7.Size = new System.Drawing.Size(709, 229);
            this.tabPage7.TabIndex = 3;
            this.tabPage7.Text = "Index";
            this.tabPage7.UseVisualStyleBackColor = true;
            // 
            // DGINDEX
            // 
            this.DGINDEX.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DGINDEX.Location = new System.Drawing.Point(6, 6);
            this.DGINDEX.Name = "DGINDEX";
            this.DGINDEX.Size = new System.Drawing.Size(697, 217);
            this.DGINDEX.TabIndex = 3;
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.button2);
            this.tabPage3.Controls.Add(this.btnSaveQuery);
            this.tabPage3.Controls.Add(this.txtResult);
            this.tabPage3.Location = new System.Drawing.Point(4, 22);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(726, 339);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "Result";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(89, 256);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 2;
            this.button2.Text = "Execute";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // btnSaveQuery
            // 
            this.btnSaveQuery.Location = new System.Drawing.Point(8, 256);
            this.btnSaveQuery.Name = "btnSaveQuery";
            this.btnSaveQuery.Size = new System.Drawing.Size(75, 23);
            this.btnSaveQuery.TabIndex = 1;
            this.btnSaveQuery.Text = "Save to File";
            this.btnSaveQuery.UseVisualStyleBackColor = true;
            this.btnSaveQuery.Click += new System.EventHandler(this.btnSaveQuery_Click);
            // 
            // txtResult
            // 
            this.txtResult.Location = new System.Drawing.Point(6, 6);
            this.txtResult.Multiline = true;
            this.txtResult.Name = "txtResult";
            this.txtResult.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtResult.Size = new System.Drawing.Size(714, 244);
            this.txtResult.TabIndex = 0;
            // 
            // tabPage10
            // 
            this.tabPage10.Controls.Add(this.txtLog);
            this.tabPage10.Location = new System.Drawing.Point(4, 22);
            this.tabPage10.Name = "tabPage10";
            this.tabPage10.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage10.Size = new System.Drawing.Size(726, 339);
            this.tabPage10.TabIndex = 3;
            this.tabPage10.Text = "Log";
            this.tabPage10.UseVisualStyleBackColor = true;
            // 
            // txtLog
            // 
            this.txtLog.Location = new System.Drawing.Point(6, 6);
            this.txtLog.Multiline = true;
            this.txtLog.Name = "txtLog";
            this.txtLog.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtLog.Size = new System.Drawing.Size(714, 337);
            this.txtLog.TabIndex = 1;
            this.txtLog.WordWrap = false;
            // 
            // cboConfigName
            // 
            this.cboConfigName.FormattingEnabled = true;
            this.cboConfigName.Location = new System.Drawing.Point(106, 7);
            this.cboConfigName.Name = "cboConfigName";
            this.cboConfigName.Size = new System.Drawing.Size(287, 21);
            this.cboConfigName.TabIndex = 25;
            this.cboConfigName.Tag = "name";
            this.cboConfigName.Leave += new System.EventHandler(this.comboBox1_Leave);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(426, 10);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(62, 13);
            this.label4.TabIndex = 26;
            this.label4.Text = "Config Path";
            // 
            // txtConfigPath
            // 
            this.txtConfigPath.Location = new System.Drawing.Point(495, 10);
            this.txtConfigPath.Name = "txtConfigPath";
            this.txtConfigPath.Size = new System.Drawing.Size(185, 20);
            this.txtConfigPath.TabIndex = 27;
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(686, 8);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(39, 23);
            this.button4.TabIndex = 28;
            this.button4.Text = "B";
            this.button4.UseVisualStyleBackColor = true;
            // 
            // LblLog
            // 
            this.LblLog.Location = new System.Drawing.Point(16, 417);
            this.LblLog.Name = "LblLog";
            this.LblLog.Size = new System.Drawing.Size(720, 13);
            this.LblLog.TabIndex = 29;
            this.LblLog.Text = "Log :";
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.DGSP);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Size = new System.Drawing.Size(709, 229);
            this.tabPage1.TabIndex = 4;
            this.tabPage1.Text = "SP";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // DGSP
            // 
            this.DGSP.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DGSP.Location = new System.Drawing.Point(6, 6);
            this.DGSP.Name = "DGSP";
            this.DGSP.Size = new System.Drawing.Size(697, 217);
            this.DGSP.TabIndex = 4;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(758, 447);
            this.Controls.Add(this.LblLog);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.txtConfigPath);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.cboConfigName);
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.label1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Mss2Pst";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.uDTManagerBindingSource)).EndInit();
            this.tabControl1.ResumeLayout(false);
            this.TpConfig.ResumeLayout(false);
            this.TpConfig.PerformLayout();
            this.tabControl3.ResumeLayout(false);
            this.TpSourceMss.ResumeLayout(false);
            this.TpSourceMss.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabControl2.ResumeLayout(false);
            this.tabPage4.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.DGUDT)).EndInit();
            this.tabPage5.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.DGTABLE)).EndInit();
            this.tabPage6.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.DGPK)).EndInit();
            this.tabPage7.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.DGINDEX)).EndInit();
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            this.tabPage10.ResumeLayout(false);
            this.tabPage10.PerformLayout();
            this.tabPage1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.DGSP)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblServer;
        private System.Windows.Forms.Label lblDatabase;
        private System.Windows.Forms.Label lblUsrName;
        private System.Windows.Forms.Label lblPassword;
        private System.Windows.Forms.TextBox txtServer;
        private System.Windows.Forms.TextBox txtDatabase;
        private System.Windows.Forms.TextBox txtUsername;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.Label lblProcess;
        private System.Windows.Forms.ComboBox cboProcess;
        private System.Windows.Forms.BindingSource uDTManagerBindingSource;
        private System.Windows.Forms.Button btnConvert;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage TpConfig;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.TabControl tabControl2;
        private System.Windows.Forms.TabPage tabPage4;
        private System.Windows.Forms.DataGridView DGUDT;
        private System.Windows.Forms.TabPage tabPage5;
        private System.Windows.Forms.TabPage tabPage6;
        private System.Windows.Forms.TabPage tabPage7;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button btnSaveQuery;
        private System.Windows.Forms.TextBox txtResult;
        private System.Windows.Forms.ComboBox cboConfigName;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtConfigPath;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.TextBox txtPath;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TabControl tabControl3;
        private System.Windows.Forms.TabPage TpSourceMss;
        private System.Windows.Forms.TabPage tabPage9;

        private System.Windows.Forms.Button btnSaveDb;
        private System.Windows.Forms.Button btnNew;

        private System.Windows.Forms.Label LblLog;
        private System.Windows.Forms.TabPage tabPage10;
        private System.Windows.Forms.TextBox txtLog;
        private System.Windows.Forms.DataGridView DGTABLE;

        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.DataGridView DGPK;
        private System.Windows.Forms.DataGridView DGINDEX;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.DataGridView DGSP;
    }
}

