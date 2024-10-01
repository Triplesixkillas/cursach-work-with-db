namespace test_subd
{
    partial class MainForm
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
            this.fileSystemWatcher1 = new System.IO.FileSystemWatcher();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.btnExit = new System.Windows.Forms.Button();
            this.txtbSearch = new System.Windows.Forms.TextBox();
            this.lblCount = new System.Windows.Forms.Label();
            this.lblSearch = new System.Windows.Forms.Label();
            this.cmbTables = new System.Windows.Forms.ComboBox();
            this.lblSelectTabel = new System.Windows.Forms.Label();
            this.addString = new System.Windows.Forms.Button();
            this.delString = new System.Windows.Forms.Button();
            this.EditStr = new System.Windows.Forms.Button();
            this.btnDoOrder = new System.Windows.Forms.Button();
            this.btnCheckOrder = new System.Windows.Forms.Button();
            this.lblRowsCount = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.fileSystemWatcher1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // fileSystemWatcher1
            // 
            this.fileSystemWatcher1.EnableRaisingEvents = true;
            this.fileSystemWatcher1.SynchronizingObject = this;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(28, 82);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(736, 343);
            this.dataGridView1.TabIndex = 0;
            // 
            // btnExit
            // 
            this.btnExit.Location = new System.Drawing.Point(649, 431);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(115, 23);
            this.btnExit.TabIndex = 1;
            this.btnExit.Text = "Назад";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // txtbSearch
            // 
            this.txtbSearch.Location = new System.Drawing.Point(90, 31);
            this.txtbSearch.Name = "txtbSearch";
            this.txtbSearch.Size = new System.Drawing.Size(180, 20);
            this.txtbSearch.TabIndex = 2;
            this.txtbSearch.TextChanged += new System.EventHandler(this.txtbSearch_TextChanged);
            // 
            // lblCount
            // 
            this.lblCount.AutoSize = true;
            this.lblCount.Location = new System.Drawing.Point(142, 436);
            this.lblCount.Name = "lblCount";
            this.lblCount.Size = new System.Drawing.Size(23, 13);
            this.lblCount.TabIndex = 3;
            this.lblCount.Text = "уку";
            this.lblCount.Click += new System.EventHandler(this.lblCount_Click);
            // 
            // lblSearch
            // 
            this.lblSearch.AutoSize = true;
            this.lblSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblSearch.Location = new System.Drawing.Point(24, 29);
            this.lblSearch.Name = "lblSearch";
            this.lblSearch.Size = new System.Drawing.Size(60, 20);
            this.lblSearch.TabIndex = 4;
            this.lblSearch.Text = "Поиск";
            this.lblSearch.Click += new System.EventHandler(this.label2_Click);
            // 
            // cmbTables
            // 
            this.cmbTables.FormattingEnabled = true;
            this.cmbTables.Items.AddRange(new object[] {
            "Водители",
            "Доставки",
            "Заказы",
            "Контейнер",
            "Пользователи",
            "Роли",
            "Склады",
            "ТипДоставки",
            "ТипТовара",
            "Товары",
            "Транспорт",
            "Фирмы"});
            this.cmbTables.Location = new System.Drawing.Point(186, 59);
            this.cmbTables.Name = "cmbTables";
            this.cmbTables.Size = new System.Drawing.Size(121, 21);
            this.cmbTables.TabIndex = 7;
            this.cmbTables.Text = "Товары";
            this.cmbTables.SelectedIndexChanged += new System.EventHandler(this.cmbTables_SelectedIndexChanged);
            // 
            // lblSelectTabel
            // 
            this.lblSelectTabel.AutoSize = true;
            this.lblSelectTabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.lblSelectTabel.Location = new System.Drawing.Point(24, 58);
            this.lblSelectTabel.Name = "lblSelectTabel";
            this.lblSelectTabel.Size = new System.Drawing.Size(157, 20);
            this.lblSelectTabel.TabIndex = 8;
            this.lblSelectTabel.Text = "Выбрать таблицу";
            // 
            // addString
            // 
            this.addString.Location = new System.Drawing.Point(510, 26);
            this.addString.Name = "addString";
            this.addString.Size = new System.Drawing.Size(115, 23);
            this.addString.TabIndex = 9;
            this.addString.Text = "Добавить строчку";
            this.addString.UseVisualStyleBackColor = true;
            this.addString.Click += new System.EventHandler(this.addString_Click);
            // 
            // delString
            // 
            this.delString.Location = new System.Drawing.Point(631, 26);
            this.delString.Name = "delString";
            this.delString.Size = new System.Drawing.Size(115, 23);
            this.delString.TabIndex = 10;
            this.delString.Text = "Удалить строчку";
            this.delString.UseVisualStyleBackColor = true;
            this.delString.Click += new System.EventHandler(this.delString_Click);
            // 
            // EditStr
            // 
            this.EditStr.Location = new System.Drawing.Point(510, 53);
            this.EditStr.Name = "EditStr";
            this.EditStr.Size = new System.Drawing.Size(236, 23);
            this.EditStr.TabIndex = 14;
            this.EditStr.Text = "Редактировать строчку";
            this.EditStr.UseVisualStyleBackColor = true;
            this.EditStr.Click += new System.EventHandler(this.EditStr_Click);
            // 
            // btnDoOrder
            // 
            this.btnDoOrder.Location = new System.Drawing.Point(326, 26);
            this.btnDoOrder.Name = "btnDoOrder";
            this.btnDoOrder.Size = new System.Drawing.Size(165, 23);
            this.btnDoOrder.TabIndex = 15;
            this.btnDoOrder.Text = "Сделать заказ";
            this.btnDoOrder.UseVisualStyleBackColor = true;
            this.btnDoOrder.Click += new System.EventHandler(this.btnDoOrder_Click);
            // 
            // btnCheckOrder
            // 
            this.btnCheckOrder.Location = new System.Drawing.Point(326, 55);
            this.btnCheckOrder.Name = "btnCheckOrder";
            this.btnCheckOrder.Size = new System.Drawing.Size(165, 23);
            this.btnCheckOrder.TabIndex = 16;
            this.btnCheckOrder.Text = "Посмотреть мои заказы";
            this.btnCheckOrder.UseVisualStyleBackColor = true;
            this.btnCheckOrder.Click += new System.EventHandler(this.btnCheckOrder_Click);
            // 
            // lblRowsCount
            // 
            this.lblRowsCount.AutoSize = true;
            this.lblRowsCount.Location = new System.Drawing.Point(25, 436);
            this.lblRowsCount.Name = "lblRowsCount";
            this.lblRowsCount.Size = new System.Drawing.Size(111, 13);
            this.lblRowsCount.TabIndex = 17;
            this.lblRowsCount.Text = "Количество записей";
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(790, 462);
            this.Controls.Add(this.lblRowsCount);
            this.Controls.Add(this.btnCheckOrder);
            this.Controls.Add(this.btnDoOrder);
            this.Controls.Add(this.EditStr);
            this.Controls.Add(this.delString);
            this.Controls.Add(this.addString);
            this.Controls.Add(this.lblSelectTabel);
            this.Controls.Add(this.cmbTables);
            this.Controls.Add(this.lblSearch);
            this.Controls.Add(this.lblCount);
            this.Controls.Add(this.txtbSearch);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.dataGridView1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Поставка товаров";
            this.Load += new System.EventHandler(this.Form2_Load);
            ((System.ComponentModel.ISupportInitialize)(this.fileSystemWatcher1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.IO.FileSystemWatcher fileSystemWatcher1;
        private System.Windows.Forms.Label lblCount;
        private System.Windows.Forms.TextBox txtbSearch;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label lblSearch;
        private System.Windows.Forms.Label lblSelectTabel;
        private System.Windows.Forms.ComboBox cmbTables;
        private System.Windows.Forms.Button delString;
        private System.Windows.Forms.Button addString;
        private System.Windows.Forms.Button EditStr;
        private System.Windows.Forms.Button btnCheckOrder;
        private System.Windows.Forms.Button btnDoOrder;
        private System.Windows.Forms.Label lblRowsCount;
    }
}