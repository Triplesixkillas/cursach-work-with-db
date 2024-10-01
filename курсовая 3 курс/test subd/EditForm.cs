using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Menu;
using System.Runtime.Remoting.Contexts;
using test_subd.Properties;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using System.Reflection.Emit;
using System.Runtime.Remoting.Messaging;

namespace test_subd
{

    public partial class EditForm : Form
    {

        SqlConnection connect;
        int roleForm;
        string boxItem;
        string condition;

        public EditForm(SqlConnection cnct, int rl, string item, string editID)
        {
            connect = cnct;
            roleForm = rl;
            boxItem = item;
            condition = editID;
            InitializeComponent();
        }



        private void Form4_Load(object sender, EventArgs e)
        {
            lblNameTabel.Text = boxItem;
            int user = 0;

            if (connect.State == ConnectionState.Open)
            {
                connect.Close();
            }

            if (boxItem == "Товары")
            {
                
                txtThirdSell.Visible = true;
                txtFourthSell.Visible = true;
                txtFifthSell.Visible = true;
                txtSixthSell.Visible = true;

                cmbSecondSell.Visible = true;
                cmbFirstSell.Visible = true;
                cmbSixthSell.Visible = true;

                
                lblFirstCell.Visible = true;
                lblSecondSell.Visible = true;
                lblThirdCell.Visible = true;
                lblFourthCell.Visible = true;
                lblFifthCell.Visible = true;
                lblSixthCell.Visible = true;

                using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                    conn.Open();
                    SqlCommand logRequest = new SqlCommand("SELECT fgid, fgfirms FROM FirmsGoods", conn);

                    SqlDataReader rdr = logRequest.ExecuteReader();
                    List<Categories> lstCategories = new List<Categories>();

                    while (rdr.Read())
                    {
                        lstCategories.Add(new Categories(Convert.ToInt32(rdr["fgid"]), rdr["fgfirms"].ToString()));
                    }

                    cmbFirstSell.DataSource = lstCategories;
                    cmbFirstSell.DisplayMember = "name";
                    cmbFirstSell.ValueMember = "id";
                    

                    rdr.Close();

                    SqlCommand typeGoodCommand = new SqlCommand("SELECT typeGoodsID, typeGood FROM TypeGoods", conn);
                    SqlDataReader reader1 = typeGoodCommand.ExecuteReader();
                    List<Categories> lstCategories1 = new List<Categories>();

                    while (reader1.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader1["typeGoodsID"]), reader1["typeGood"].ToString()));
                    }

                    cmbSecondSell.DataSource = lstCategories1;
                    cmbSecondSell.DisplayMember = "name";
                    cmbSecondSell.ValueMember = "id";
                    

                    reader1.Close();

                    SqlCommand warehousesCommand = new SqlCommand("SELECT warehouseID, warehouseAdres FROM Warehouses", conn);
                    reader1 = warehousesCommand.ExecuteReader();
                    lstCategories1 = new List<Categories>();

                    while (reader1.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader1["warehouseID"]), reader1["warehouseAdres"].ToString()));
                    }

                    cmbSixthSell.DataSource = lstCategories1;
                    cmbSixthSell.DisplayMember = "name";
                    cmbSixthSell.ValueMember = "id";
                    

                    reader1.Close();

                    string query = $"SELECT * FROM Goods WHERE goodID = {condition}";
                    SqlCommand command = new SqlCommand(query, conn);
                    SqlDataReader reader5 = command.ExecuteReader();
                    if (reader5.Read())
                    {
                        textBox1.Text = reader5["goodID"].ToString();
                        cmbFirstSell.SelectedValue = reader5["firmGoodID"];
                        cmbSecondSell.SelectedValue = reader5["typeGoodID"];
                        cmbSixthSell.SelectedValue = reader5["warehouseID"];
                        txtThirdSell.Text = reader5["goodModel"].ToString();
                        txtFourthSell.Text = reader5["goodAmount"].ToString();
                        txtFifthSell.Text = reader5["goodSize"].ToString();
                    }
                    reader5.Close();

                    conn.Close();
                }
        }
            else if (boxItem == "Фирмы")
            {

                SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString);
                conn.Open();

                this.Width = 250;
                this.Height = 200;
                lblSecondSell.Left = 20;
                lblSecondSell.Top = 25;

                txtSecondSell.Left = 20;
                txtSecondSell.Top = 40;

                btnEdit.Left = 20;
                btnEdit.Top = 65;

                btnExit.Left = 20;
                btnExit.Top = 90;

                lblSecondSell.Text = "Фирма";

                
                lblSecondSell.Visible = true;

                
                txtSecondSell.Visible = true;

                string query = $"SELECT * FROM FirmsGoods WHERE fgid = {condition}";
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    textBox1.Text = reader["fgid"].ToString();
                    txtSecondSell.Text = reader["fgfirms"].ToString();
                }
                reader.Close();
                conn.Close();

            }
            else if (boxItem == "Водители")
            {
                this.Width = 250;
                this.Height = 200;
                lblSecondSell.Left = 15;
                lblSecondSell.Top = 25;

                txtSecondSell.Left = 20;
                txtSecondSell.Top = 40;

                txtSecondSell.Width = 170;

                btnEdit.Left = 20;
                btnEdit.Top = 80;

                btnExit.Left = 20;
                btnExit.Top = 105;

                SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString);
                conn.Open();

                lblSecondSell.Text = "ФИО";

                
                lblSecondSell.Visible = true;

               
                txtSecondSell.Visible = true;

                string query = $"SELECT * FROM EmployeeDriver WHERE employeesDriverID = {condition}";
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    textBox1.Text = reader["employeesDriverID"].ToString();
                    txtSecondSell.Text = reader["employeeDriverFIO"].ToString();
                }
                reader.Close();
                conn.Close();

            }
            else if (boxItem == "Контейнер")
            {
                SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString);
                conn.Open();


                this.Width = 250;
                this.Height = 200;
                lblSecondSell.Left = 15;
                lblSecondSell.Top = 25;

                txtSecondSell.Left = 20;
                txtSecondSell.Top = 40;

                txtSecondSell.Width = 170;

                btnEdit.Left = 20;
                btnEdit.Top = 80;

                btnExit.Left = 20;
                btnExit.Top = 105;

                lblSecondSell.Text = "Контейнер";

               
                lblSecondSell.Visible = true;

                
                txtSecondSell.Visible = true;

                string query = $"SELECT * FROM Container WHERE containerID = {condition}";
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    textBox1.Text = reader["containerID"].ToString();
                    txtSecondSell.Text = reader["containerType"].ToString();
                }
                reader.Close();
                conn.Close();

            }
            else if (boxItem == "Доставки")
            {

                lblFirstCell.Text = "Заказ";
                lblSecondSell.Text = "Водитель";
                lblThirdCell.Text = "Транспорт";
                lblFourthCell.Text = "Контейнер";
                lblFifthCell.Text = "Пункт назначения";

                
                txtFifthSell.Visible = true;

                cmbFirstSell.Visible = true;
                cmbSecondSell.Visible = true;
                cmbThirdSell.Visible = true;
                cmbFourthSell.Visible = true;

               
                lblFirstCell.Visible = true;
                lblSecondSell.Visible = true;
                lblThirdCell.Visible = true;
                lblFourthCell.Visible = true;
                lblFifthCell.Visible = true;

                using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                    conn.Open();

                    // order
                    SqlCommand orderCommand = new SqlCommand("SELECT orderid FROM Orders", conn);
                    SqlDataReader reader1 = orderCommand.ExecuteReader();
                    if (reader1.HasRows)
                    {
                        while (reader1.Read())
                        {
                            cmbFirstSell.Items.Add(Convert.ToInt32(reader1["orderid"]));
                        }
                    }
                    reader1.Close();

                    // driver
                    SqlCommand employeeDriverCommand = new SqlCommand("SELECT employeesDriverID, employeeDriverFIO FROM EmployeeDriver", conn);
                    SqlDataReader reader2 = employeeDriverCommand.ExecuteReader();
                    List<Categories> lstCategories1 = new List<Categories>();
                    while (reader2.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader2["employeesDriverID"]), reader2["employeeDriverFIO"].ToString()));
                    }
                    reader2.Close();
                    cmbSecondSell.DataSource = lstCategories1;
                    cmbSecondSell.DisplayMember = "name";
                    cmbSecondSell.ValueMember = "id";
                    

                    // transport
                    SqlCommand transportCommand = new SqlCommand("SELECT transportID, transport FROM Transport", conn);
                    SqlDataReader reader3 = transportCommand.ExecuteReader();
                    lstCategories1 = new List<Categories>();
                    while (reader3.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader3["transportID"]), reader3["transport"].ToString()));
                    }
                    reader3.Close();
                    cmbThirdSell.DataSource = lstCategories1;
                    cmbThirdSell.DisplayMember = "name";
                    cmbThirdSell.ValueMember = "id";
                    

                    // container
                    SqlCommand containerCommand = new SqlCommand("SELECT containerID, containerType FROM Container", conn);
                    SqlDataReader reader4 = containerCommand.ExecuteReader();
                    lstCategories1 = new List<Categories>();
                    while (reader4.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader4["containerID"]), reader4["containerType"].ToString()));
                    }
                    reader4.Close();
                    cmbFourthSell.DataSource = lstCategories1;
                    cmbFourthSell.DisplayMember = "name";
                    cmbFourthSell.ValueMember = "id";
                    

                    // Выполнение запроса для boxItem
                    string query = $"SELECT * FROM Delivery WHERE deliveryID = {condition}";
                    SqlCommand command = new SqlCommand(query, conn);
                    SqlDataReader reader5 = command.ExecuteReader();
                    if (reader5.Read())
                    {
                        
                        cmbFirstSell.SelectedItem = reader5["orderid"];
                        cmbSecondSell.SelectedValue = reader5["employeesDriverID"];
                        cmbThirdSell.SelectedValue = reader5["transportID"];
                        cmbFourthSell.SelectedValue = reader5["containerID"];
                        txtFifthSell.Text = reader5["destination"].ToString();
                    }
                    reader5.Close();

                    conn.Close();
                }


            }
            else if (boxItem == "Заказы")
            {
                lblFirstCell.Text = "Менеджер";
                lblSecondSell.Text = "Клиент";
                lblThirdCell.Text = "goodid";
                lblFourthCell.Text = "orderamount";

                
                lblFirstCell.Visible = true;
                lblSecondSell.Visible = true;
                lblThirdCell.Visible = true;
                lblFourthCell.Visible = true;

                
                txtFourthSell.Visible = true;

                cmbFirstSell.Visible = true;
                cmbSecondSell.Visible = true;
                cmbThirdSell.Visible = true;


                // employee
                using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                        conn.Open();
                        SqlCommand employeeCommand = new SqlCommand("SELECT userID, userFIO FROM Users WHERE roles IN (1,2,5,8,9)", conn);

                        SqlDataReader reader1 = employeeCommand.ExecuteReader();

                        List<Categories> lstCategories1 = new List<Categories>();

                        while (reader1.Read())
                        {
                            lstCategories1.Add(new Categories(Convert.ToInt32(reader1["userID"]), reader1["userFIO"].ToString()));
                        }

                        cmbFirstSell.DataSource = lstCategories1;
                        cmbFirstSell.DisplayMember = "name"; // Отображаем имя пользователя
                        cmbFirstSell.ValueMember = "id"; // Устанавливаем значение пользователя как идентификатор

                        reader1.Close();


                    // customer
                    SqlCommand customerCommand = new SqlCommand("Select userID, userFIO from Users where roles in (3,4,6,7,10)", conn);

                    reader1 = customerCommand.ExecuteReader();
                    lstCategories1 = new List<Categories>();

                    while (reader1.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader1["userID"]), reader1["userFIO"].ToString()));
                    }

                    cmbSecondSell.DataSource = lstCategories1;
                    cmbSecondSell.DisplayMember = "name";
                    cmbSecondSell.ValueMember = "id";
                    

                    reader1.Close();


                    // good
                    SqlCommand goodCommand = new SqlCommand("Select goodID, goodModel from Goods", conn);

                    reader1 = goodCommand.ExecuteReader();
                    lstCategories1 = new List<Categories>();

                    while (reader1.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader1["goodID"]), reader1["goodModel"].ToString()));
                    }

                    cmbThirdSell.DataSource = lstCategories1;
                    cmbThirdSell.DisplayMember = "name";
                    cmbThirdSell.ValueMember = "id";
                    

                    reader1.Close();

                    // Выполнение запроса для boxItem
                    string query = $"SELECT * FROM Orders WHERE orderid = {condition}";
                    SqlCommand command = new SqlCommand(query, conn);
                    SqlDataReader reader5 = command.ExecuteReader();
                    if (reader5.Read())
                    {
                        textBox1.Text = reader5["orderid"].ToString();
                        cmbFirstSell.SelectedValue = reader5["employeeid"];
                        cmbSecondSell.SelectedValue = reader5["customerid"];
                        cmbThirdSell.SelectedValue = reader5["goodid"];
                        txtFourthSell.Text = reader5["orderamount"].ToString();
                    }
                    reader5.Close();

                    conn.Close();

                }
            }
            else if (boxItem == "Роли")
            {
                this.Width = 250;
                this.Height = 200;
                lblSecondSell.Left = 15;
                lblSecondSell.Top = 25;

                txtSecondSell.Left = 20;
                txtSecondSell.Top = 40;

                txtSecondSell.Width = 170;

                btnEdit.Left = 20;
                btnEdit.Top = 80;

                btnExit.Left = 20;
                btnExit.Top = 105;

                SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString);
                conn.Open();

                lblSecondSell.Text = "Роли";

                
                lblSecondSell.Visible = true;

               
                txtSecondSell.Visible = true;

                string query = $"SELECT * FROM Roles WHERE RolesID = {condition}";
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    textBox1.Text = reader["RolesID"].ToString();
                    txtSecondSell.Text = reader["RolesName"].ToString();
                }
                reader.Close();
                conn.Close();

            }
            else if (boxItem == "Транспорт")
            {
                this.Height = 200;
          
                btnEdit.Left = 150;
                btnEdit.Top = 90;

                btnExit.Left = 150;
                btnExit.Top = 115;

                lblFirstCell.Text = "Тип доставки";
                lblSecondSell.Text = "Транспорт";

                
                lblFirstCell.Visible = true;
                lblSecondSell.Visible = true;

                cmbFirstSell.Visible = true;

              
                txtSecondSell.Visible = true;

                // type
                using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                    conn.Open();
                    SqlCommand typeCommand = new SqlCommand("Select typeDeliveryID, typeDeliveryVehicle from Typeofdelivery", conn);

                    SqlDataReader reader1 = typeCommand.ExecuteReader();

                    List<Categories> lstCategories1 = new List<Categories>();

                    while (reader1.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader1["typeDeliveryID"]), reader1["typeDeliveryVehicle"].ToString()));
                    }

                    cmbFirstSell.DataSource = lstCategories1;
                    cmbFirstSell.DisplayMember = "name";
                    cmbFirstSell.ValueMember = "id";
                    

                    reader1.Close();

                    string query = $"SELECT * FROM Transport WHERE transportID = {condition}";
                    SqlCommand command = new SqlCommand(query, conn);
                    SqlDataReader reader5 = command.ExecuteReader();
                    if (reader5.Read())
                    {
                        textBox1.Text = reader5["transportID"].ToString();
                        cmbFirstSell.SelectedValue = reader5["typeDeliveryID"];
                        txtSecondSell.Text = reader5["transport"].ToString();
                    }
                    reader5.Close();

                    conn.Close();

                }
            }

            else if (boxItem == "ТипТовара")
            {
                this.Width = 250;
                this.Height = 200;
                lblSecondSell.Left = 10;
                lblSecondSell.Top = 35;

                txtSecondSell.Left = 20;
                txtSecondSell.Top = 40;

                cmbFirstSell.Width = 150;

                btnEdit.Left = 20;
                btnEdit.Top = 80;

                btnExit.Left = 20;
                btnExit.Top = 105;

                SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString);
                conn.Open();

                lblSecondSell.Text = "Тип товара";
                lblSecondSell.Visible = true;

                cmbFirstSell.Visible = true;

                // Параметризованный запрос для безопасности и читаемости кода
                SqlCommand typeCommand = new SqlCommand("SELECT typeGoodsID, typeGood FROM TypeGoods", conn);
                SqlDataReader reader = typeCommand.ExecuteReader();

                List<Categories> lstCategories1 = new List<Categories>();

                while (reader.Read())
                {
                    lstCategories1.Add(new Categories(Convert.ToInt32(reader["typeGoodsID"]), reader["typeGood"].ToString())); // Исправлено название переменной
                }

                reader.Close();

                cmbFirstSell.DataSource = lstCategories1;
                cmbFirstSell.DisplayMember = "name"; // Установка отображаемого поля
                cmbFirstSell.ValueMember = "id"; // Установка поля значения

                SqlCommand typeCommand2 = new SqlCommand("SELECT * FROM TypeGoods WHERE typeGoodsID = @condition", conn);
                typeCommand2.Parameters.AddWithValue("@condition", condition);

                SqlDataReader reader2 = typeCommand2.ExecuteReader();

                if (reader2.Read())
                {
                    textBox1.Text = reader2["typeGoodsID"].ToString();
                    cmbFirstSell.Text = reader2["typeGood"].ToString(); // Установка текста в комбобоксе, так как у вас необходимо выбрать значение по тексту, а не по идентификатору
                }

                reader2.Close();
                conn.Close();


            }
            else if (boxItem == "ТипДоставки")
            {

                this.Width = 250;
                this.Height = 200;
                lblSecondSell.Left = 20;
                lblSecondSell.Top = 25;

                txtSecondSell.Left = 20;
                txtSecondSell.Top = 40;

                btnEdit.Left = 20;
                btnEdit.Top = 65;

                btnExit.Left = 20;
                btnExit.Top = 90;

                SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString);
                conn.Open();

                
                lblSecondSell.Text = "Тип доставки";

                
                lblSecondSell.Visible = true;

             
                txtSecondSell.Visible = true;

                string query = $"SELECT * FROM Typeofdelivery WHERE typeDeliveryID = {condition}";
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    textBox1.Text = reader["typeDeliveryID"].ToString();
                    txtSecondSell.Text = reader["typeDeliveryVehicle"].ToString();
                }
                reader.Close();
                conn.Close();

               

            }
            else if (boxItem == "Пользователи")
            {
                lblFirstCell.Text = "ФИО";
                lblSecondSell.Text = "Роли";
                lblThirdCell.Text = "Логин";
                lblFourthCell.Text = "Пароль";

                
                lblFirstCell.Visible = true;
                lblSecondSell.Visible = true;
                lblThirdCell.Visible = true;
                lblFourthCell.Visible = true;

               
                txtFirstCell.Visible = true;
                txtThirdSell.Visible = true;
                txtFourthSell.Visible = true;

                cmbSecondSell.Visible = true;

                // roles
                using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                    conn.Open();
                    SqlCommand rolesCommand = new SqlCommand("Select RolesID, RolesName from Roles", conn);

                    SqlDataReader reader1 = rolesCommand.ExecuteReader();

                    List<Categories> lstCategories1 = new List<Categories>();

                    while (reader1.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader1["RolesID"]), reader1["RolesName"].ToString()));
                    }

                    cmbSecondSell.DataSource = lstCategories1;
                    cmbSecondSell.DisplayMember = "name";
                    cmbSecondSell.ValueMember = "id";
                    

                    reader1.Close();

                    string query = $"SELECT * FROM Users WHERE userID = {condition}";
                    SqlCommand command = new SqlCommand(query, conn);
                    SqlDataReader reader5 = command.ExecuteReader();
                    if (reader5.Read())
                    {
                        textBox1.Text = reader5["userID"].ToString();
                        cmbSecondSell.SelectedValue = reader5["roles"];
                        txtThirdSell.Text = reader5["loginRules"].ToString();
                        txtFourthSell.Text = reader5["passwordRules"].ToString();
                        txtFirstCell.Text = reader5["userFIO"].ToString();
                    }
                    reader5.Close();

                    conn.Close();
                }

            }
            else if (boxItem == "Склады")
            {
                SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString);
                conn.Open();

                this.Width = 350;
                this.Height = 200;
                lblSecondSell.Left = 15;
                lblSecondSell.Top = 25;

                txtSecondSell.Left = 20;
                txtSecondSell.Top = 40;

                txtSecondSell.Width = 300;

                btnEdit.Left = 20;
                btnEdit.Top = 80;

                btnExit.Left = 20;
                btnExit.Top = 105;

                lblSecondSell.Text = "Адрес";

                
                lblSecondSell.Visible = true;

                
                txtSecondSell.Visible = true;
                string query = $"SELECT * FROM Warehouses WHERE warehouseID = {condition}";
                SqlCommand command = new SqlCommand(query, conn);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    textBox1.Text = reader["warehouseID"].ToString();
                    txtSecondSell.Text = reader["warehouseAdres"].ToString();
                }
                reader.Close();
                conn.Close();
            }

        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                conn.Open();
                SqlCommand logRequest = new SqlCommand();
                logRequest.Connection = conn;

                if (boxItem == "Товары")
                {
                    logRequest.CommandText = $"Update Goods set firmGoodID = {cmbFirstSell.SelectedIndex + 1}, typeGoodID = '{cmbSecondSell.SelectedIndex + 1}'," +
                        $" goodModel = '{txtThirdSell.Text}', goodAmount = {txtFourthSell.Text}, goodSize = {txtFifthSell.Text}, warehouseID = {cmbSixthSell.SelectedIndex + 1} where goodID = {textBox1.Text}";

                }
                else if (boxItem == "Фирмы")
                {
                    logRequest.CommandText = $"Update [FirmsGoods] set fgfirms = '{txtSecondSell.Text}' where fgid = {textBox1.Text}";
                }

                else if (boxItem == "Водители")
                {
                    logRequest.CommandText = $"Update [EmployeeDriver] set employeeDriverFIO = '{txtSecondSell.Text}' where employeeDriverID = {textBox1.Text}";
                }
                else if (boxItem == "Контейнер")
                {
                    logRequest.CommandText = $"Update [Container] set containerType = '{txtSecondSell.Text}' where containerID = {textBox1.Text}";
                }
                else if (boxItem == "Доставки")
                {
                    logRequest.CommandText = $"Update [Delivery] set orderID = {cmbFirstSell.SelectedIndex + 1}, employeesDriverID =  {cmbSecondSell.SelectedIndex + 1}," +
                        $" transportID = {cmbThirdSell.SelectedIndex + 1}, containerID = {cmbFourthSell.SelectedIndex + 1}, " +
                                             $" destination = '{txtFifthSell.Text}' where deliveryID = {textBox1.Text})";
                }
                else if (boxItem == "Заказы")
                {

                    int employeeId = (int)cmbFirstSell.SelectedValue;
                    int customerId = (int)cmbSecondSell.SelectedValue;
                    int goodId = (int)cmbThirdSell.SelectedValue;

                    logRequest.CommandText = $"UPDATE [Orders] SET employeeid = {employeeId}, " +
                               $"customerid = {customerId}, " +
                               $"goodid = {goodId}, " +
                               $"orderamount = {txtFourthSell.Text} " +
                               $"WHERE orderid = {textBox1.Text}";
                }
                else if (boxItem == "Роли")
                {
                    logRequest.CommandText = $"Update [Roles] set RolesName = '{txtSecondSell.Text}' where RolesID = {textBox1.Text}";
                }
                else if (boxItem == "Транспорт")
                {
                    logRequest.CommandText = $"Update [Transport] set typeDeliveryID = {cmbFirstSell.SelectedIndex + 1}, transport = '{txtSecondSell.Text}'" +
                        $"where transportID = {textBox1.Text}";
                }
                else if (boxItem == "ТипТовара")
                {
                    logRequest.CommandText = $"Update [TypeGoods] set typeGood = '{cmbSecondSell.SelectedIndex + 1}'" +
                        $"where typeGoodsID = {textBox1.Text}";
                }
                else if (boxItem == "ТипДоставки")
                {
                    logRequest.CommandText = $"Update [Typeofdelivery] set typeDeliveryVehicle) = '{txtSecondSell.Text}'" +
                        $"where typeDeliveryID = {textBox1.Text}";
                }
                else if (boxItem == "Пользователи")
                {
                    logRequest.CommandText = $"Update [Users] set userFIO = '{txtFirstCell.Text}'," +
                        $" roles = {cmbSecondSell.SelectedIndex + 1}, loginRules = '{txtFourthSell.Text}', passwordRules = '{txtFifthSell.Text}'  " +
                        $"where userID = {textBox1.Text}";
                }
                else if (boxItem == "Склады")
                {
                    logRequest.CommandText = $"Update [Warehouses] set warehouseAdres = '{txtSecondSell.Text}'" +
                        $"where warehouseID = {textBox1.Text}";
                }

                logRequest.ExecuteNonQuery();
                MessageBox.Show("Запись успешно отредактирована");
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();

            // Получаем ссылку на форму 2
            MainForm fm = Application.OpenForms["MainForm"] as MainForm;
            if (fm != null)
            {
                // Показываем форму 2
                fm.Show();

                // Вызываем метод обновления данных на форме 2
                fm.RefreshData();
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void comboBox5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
