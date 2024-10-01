using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace test_subd
{
    public partial class AddForm : Form
    {
        private SqlConnection connect;
        private int roleForm;
        private string boxItem;

        public AddForm(SqlConnection cnct, int rl, string item)
        {
            connect = cnct;
            roleForm = rl;
            boxItem = item;
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                conn.Open();
                SqlCommand logRequest = new SqlCommand();
                logRequest.Connection = conn;

                if (boxItem == "Товары")
                {
                    logRequest.CommandText = $"INSERT INTO [Goods] (firmGoodID, typeGoodID, goodModel, goodAmount, goodSize, warehouseID) " +
                                             $"VALUES ({cmbFirstSell.SelectedIndex + 1}, {cmbSecondSell.SelectedIndex + 1}, '{txtThirdSell.Text}', {txtFourthSell.Text}, {txtFifthSell.Text}, {cmbFifthSell.SelectedIndex + 1})";
                }
                else if (boxItem == "Фирмы")
                {
                    logRequest.CommandText = $"INSERT INTO [FirmsGoods] (fgfirms) VALUES ('{txtSecondSell.Text}')";
                }

                else if (boxItem == "Водители")
                {
                    logRequest.CommandText = $"INSERT INTO [EmployeeDriver] (employeeDriverFIO) VALUES ('{txtSecondSell.Text}')";
                }
                else if (boxItem == "Контейнер")
                {
                    logRequest.CommandText = $"INSERT INTO [Container] (containerType) VALUES ('{txtSecondSell.Text}')";
                }
                else if (boxItem == "Доставки")
                {
                    logRequest.CommandText = $"INSERT INTO [Delivery] (orderID, employeesDriverID, transportID, containerID, destination) " +
                                             $"VALUES ({cmbFirstSell.SelectedIndex + 1}, {cmbSecondSell.SelectedIndex + 1}, {cmbThirdSell.SelectedIndex + 1}, {cmbFourthSell.SelectedIndex + 1}, '{txtFifthSell.Text}')";
                }
                else if (boxItem == "Заказы")
                {
                    int employeeId = (int)cmbFirstSell.SelectedValue;
                    int customerId = (int)cmbSecondSell.SelectedValue;
                    int goodId = (int)cmbThirdSell.SelectedValue;

                    logRequest.CommandText = $"INSERT INTO [Orders] (employeeid, customerid, goodid, orderamount) " +
                                             $"VALUES ({employeeId}, {customerId}, {goodId}, '{txtFourthSell.Text}')";
                }
                else if (boxItem == "Роли")
                {
                    logRequest.CommandText = $"INSERT INTO [Roles] (RolesName) VALUES ('{txtSecondSell.Text}')";
                }
                else if (boxItem == "Транспорт")
                {
                    logRequest.CommandText = $"INSERT INTO [Transport] (typeDeliveryID, transport) VALUES ({cmbFirstSell.SelectedIndex + 1},'{txtSecondSell.Text}')";
                }
                else if (boxItem == "ТипТовара")
                {
                    logRequest.CommandText = $"INSERT INTO [TypeGoods] (typeGood) VALUES ('{txtSecondSell.Text}')";
                }
                else if (boxItem == "ТипДоставки")
                {
                    logRequest.CommandText = $"INSERT INTO [Typeofdelivery] (typeDeliveryVehicle) VALUES ('{txtSecondSell.Text}')";
                }
                else if (boxItem == "Пользователи")
                {
                    logRequest.CommandText = $"INSERT INTO [Users] (userFIO, roles, loginRules, passwordRules) VALUES ('{txtFirstSell.Text}'), {cmbSecondSell.SelectedIndex + 1}, '{txtFourthSell.Text}', '{txtFifthSell.Text}'";
                }
                else if (boxItem == "Склады")
                {
                    logRequest.CommandText = $"INSERT INTO [Warehouses] (warehouseAdres) VALUES ('{txtSecondSell.Text}')";
                }

                logRequest.ExecuteNonQuery();
                MessageBox.Show("Запись успешно добавлена");
            }
        }

        private void Form3_Load(object sender, EventArgs e)
        {
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
                cmbFifthSell.Visible = true;

                lblFirstSell.Visible = true;
                lblSecondSell.Visible = true;
                lblThirdSell.Visible = true;
                lblFourthSell.Visible = true;
                lblFifthSell.Visible = true;
                lblSixthSell.Visible = true;

                using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                    conn.Open();
                    SqlCommand logRequest = new SqlCommand("SELECT fgid, fgfirms FROM FirmsGoods", conn);

                    using (SqlDataReader rdr = logRequest.ExecuteReader())
                    {
                        List<Categories> lstCategories = new List<Categories>();

                        while (rdr.Read())
                        {
                            lstCategories.Add(new Categories(Convert.ToInt32(rdr["fgid"]), rdr["fgfirms"].ToString()));
                        }

                        cmbFirstSell.DataSource = lstCategories;
                        cmbFirstSell.DisplayMember = "name";
                        cmbFirstSell.ValueMember = "id";
                        cmbFirstSell.Text = "";
                    }

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
                    cmbSecondSell.Text = "";

                    reader1.Close();

                    SqlCommand warehousesCommand = new SqlCommand("SELECT warehouseID, warehouseAdres FROM Warehouses", conn);
                    reader1 = warehousesCommand.ExecuteReader();
                    lstCategories1 = new List<Categories>();

                    while (reader1.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader1["warehouseID"]), reader1["warehouseAdres"].ToString()));
                    }

                    cmbFifthSell.DataSource = lstCategories1; // Changed from comboBox2 to comboBox5
                    cmbFifthSell.DisplayMember = "name"; // Changed from "name" to "warehouseAdres"
                    cmbFifthSell.ValueMember = "id"; // Changed from "id" to "warehouseID"
                    cmbFifthSell.Text = "";

                    reader1.Close();
                }
            }
            else if (boxItem == "Фирмы")
            {
                this.Width = 250;
                this.Height = 200;
                lblSecondSell.Left = 20;
                lblSecondSell.Top = 25;

                txtSecondSell.Left = 20;
                txtSecondSell.Top = 40;

                btnAdd.Left = 20;
                btnAdd.Top = 65;

                btnExit.Left = 20;
                btnExit.Top = 90;

                lblSecondSell.Text = "Фирма";

               
                lblSecondSell.Visible = true;

                
                txtSecondSell.Visible = true;
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

                btnAdd.Left = 20;
                btnAdd.Top = 80;

                btnExit.Left = 20;
                btnExit.Top = 105;

                lblSecondSell.Text = "ФИО";

                lblSecondSell.Visible = true;

                
                txtSecondSell.Visible = true;
            }
            else if (boxItem == "Контейнер")
            {

                this.Width = 250;
                this.Height = 200;
                lblSecondSell.Left = 15;
                lblSecondSell.Top = 25;

                txtSecondSell.Left = 20;
                txtSecondSell.Top = 40;

                txtSecondSell.Width = 170;

                btnAdd.Left = 20;
                btnAdd.Top = 80;

                btnExit.Left = 20;
                btnExit.Top = 105;

                lblSecondSell.Text = "Контейнер";

                
                lblSecondSell.Visible = true;

                
                txtSecondSell.Visible = true;
            }
            else if (boxItem == "Доставки")
            {

                
                lblFirstSell.Text = "Доставка";
                lblSecondSell.Text = "Водитель";
                lblThirdSell.Text = "Транспорт";
                lblFourthSell.Text = "Контейнер";
                lblFifthSell.Text = "Пункт назначения";

                
                txtFifthSell.Visible = true;

                cmbFirstSell.Visible = true;
                cmbSecondSell.Visible = true;
                cmbThirdSell.Visible = true;
                cmbFourthSell.Visible = true;

               
                lblFirstSell.Visible = true;
                lblSecondSell.Visible = true;
                lblThirdSell.Visible = true;
                lblFourthSell.Visible = true;
                lblFifthSell.Visible = true;

                using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                    conn.Open();
                    // order
                    SqlCommand orderCommand = new SqlCommand("Select orderid from Orders", conn);

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
                    SqlCommand employeeDriverCommand = new SqlCommand("Select employeesDriverID, employeeDriverFIO from EmployeeDriver", conn);

                    reader1 = employeeDriverCommand.ExecuteReader();
                    List<Categories> lstCategories1 = new List<Categories>();

                    while (reader1.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader1["employeesDriverID"]), reader1["employeeDriverFIO"].ToString()));
                    }


                    cmbSecondSell.DataSource = lstCategories1;
                    cmbSecondSell.DisplayMember = "name";
                    cmbSecondSell.ValueMember = "id";
                    cmbSecondSell.Text = "";

                    reader1.Close();

                    // transport
                    SqlCommand transportCommand = new SqlCommand("Select transportID, transport from Transport", conn);

                    reader1 = transportCommand.ExecuteReader();
                    lstCategories1 = new List<Categories>();

                    while (reader1.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader1["transportID"]), reader1["transport"].ToString()));
                    }

                    cmbThirdSell.DataSource = lstCategories1;
                    cmbThirdSell.DisplayMember = "name";
                    cmbThirdSell.ValueMember = "id";
                    cmbThirdSell.Text = "";

                    reader1.Close();

                    // container
                    SqlCommand containerCommand = new SqlCommand("Select containerID, containerType from Container", conn);

                    reader1 = containerCommand.ExecuteReader();
                    lstCategories1 = new List<Categories>();

                    while (reader1.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader1["containerID"]), reader1["containerType"].ToString()));
                    }

                    cmbFourthSell.DataSource = lstCategories1;
                    cmbFourthSell.DisplayMember = "name";
                    cmbFourthSell.ValueMember = "id";
                    cmbFourthSell.Text = "";

                }

            }
            else if (boxItem == "Заказы")
            {
                
                lblFirstSell.Text = "Менеджер";
                lblSecondSell.Text = "Клиент";
                lblThirdSell.Text = "Товар";
                lblFourthSell.Text = "Количество";

                
                lblFirstSell.Visible = true;
                lblSecondSell.Visible = true;
                lblThirdSell.Visible = true;
                lblFourthSell.Visible = true;

                
                txtFourthSell.Visible = true;

                cmbFirstSell.Visible = true;
                cmbSecondSell.Visible = true;
                cmbThirdSell.Visible = true;


                // employee
                using (SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString))
                {
                    conn.Open();
                    SqlCommand employeeCommand = new SqlCommand("Select userID, userFIO from Users where roles in (1,5,8,9)", conn);

                    SqlDataReader reader1 = employeeCommand.ExecuteReader();

                    List<Categories> lstCategories1 = new List<Categories>();

                    while (reader1.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader1["userID"]), reader1["userFIO"].ToString()));
                    }

                    cmbFirstSell.DataSource = lstCategories1;
                    cmbFirstSell.DisplayMember = "name";
                    cmbFirstSell.ValueMember = "id";
                    cmbFirstSell.Text = "";

                    reader1.Close();


                    // customer
                    SqlCommand customerCommand = new SqlCommand("Select userID, userFIO from Users where roles in (2,3,4,6,7,10)", conn);

                    reader1 = customerCommand.ExecuteReader();
                    lstCategories1 = new List<Categories>();

                    while (reader1.Read())
                    {
                        lstCategories1.Add(new Categories(Convert.ToInt32(reader1["userID"]), reader1["userFIO"].ToString()));
                    }

                    cmbSecondSell.DataSource = lstCategories1;
                    cmbSecondSell.DisplayMember = "name";
                    cmbSecondSell.ValueMember = "id";
                    cmbSecondSell.Text = "";

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
                    cmbThirdSell.Text = "";

                    reader1.Close();
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

                btnAdd.Left = 20;
                btnAdd.Top = 80;

                btnExit.Left = 20;
                btnExit.Top = 105;

                lblSecondSell.Text = "Роли";

               
                lblSecondSell.Visible = true;

               
                txtSecondSell.Visible = true;
            }
            else if (boxItem == "Транспорт")
            {
                this.Height = 200;

                btnAdd.Left = 150;
                btnAdd.Top = 90;

                btnExit.Left = 150;
                btnExit.Top = 115;

                lblFirstSell.Text = "Тип доставки";
                lblSecondSell.Text = "Транспорт";

               
                lblFirstSell.Visible = true;
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
                    cmbFirstSell.Text = "";

                    reader1.Close();
                }
            }

            else if (boxItem == "ТипТовара")
            {

                this.Width = 250;
                this.Height = 200;
                lblSecondSell.Left = 10;
                lblSecondSell.Top = 20;

                txtSecondSell.Left = 20;
                txtSecondSell.Top = 40;

                
                cmbFirstSell.Width = 150;
                

                btnAdd.Left = 20;
                btnAdd.Top = 80;

                btnExit.Left = 20;
                btnExit.Top = 105;

                lblSecondSell.Text = "Тип товара";
                lblSecondSell.Visible = true;


                cmbFirstSell.Visible = true;

                SqlConnection conn = new SqlConnection(Properties.Settings.Default.connectionString);
                conn.Open();

                // Параметризованный запрос для безопасности и читаемости кода
                SqlCommand typeCommand = new SqlCommand("SELECT typeGoodsID, typeGood FROM TypeGoods", conn);
                SqlDataReader reader1 = typeCommand.ExecuteReader();

                List<Categories> lstCategories1 = new List<Categories>();

                while (reader1.Read())
                {
                    lstCategories1.Add(new Categories(Convert.ToInt32(reader1["typeGoodsID"]), reader1["typeGood"].ToString())); // Исправлено название столбца
                }

                reader1.Close();
                conn.Close();

                cmbFirstSell.DataSource = lstCategories1;
                cmbFirstSell.DisplayMember = "name"; // Установка отображаемого поля
                cmbFirstSell.ValueMember = "id"; // Установка поля значения
                cmbFirstSell.Text = "";
            }
            else if (boxItem == "ТипДоставки")
            {

                this.Width = 250;
                this.Height = 200;
                lblSecondSell.Left = 20;
                lblSecondSell.Top = 25;

                txtSecondSell.Left = 20;
                txtSecondSell.Top = 40;

                btnAdd.Left = 20;
                btnAdd.Top = 65;

                btnExit.Left = 20;
                btnExit.Top = 90;

                lblSecondSell.Text = "Тип Доставки";

               
                lblSecondSell.Visible = true;

                
                txtSecondSell.Visible = true;
            }
            else if (boxItem == "Пользователи")
            {
              
                lblFirstSell.Text = "ФИО";
                lblSecondSell.Text = "Роли";
                lblThirdSell.Text = "Логин";
                lblFourthSell.Text = "Пароль";

              
                lblFirstSell.Visible = true;
                lblSecondSell.Visible = true;
                lblThirdSell.Visible = true;
                lblFourthSell.Visible = true;

                
                txtFirstSell.Visible = true;
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
                    cmbSecondSell.Text = "";

                    reader1.Close();
                }

            }
            else if (boxItem == "Склады")
            {
                this.Width = 350;
                this.Height = 200;
                lblSecondSell.Left = 15;
                lblSecondSell.Top = 25;

                txtSecondSell.Left = 20;
                txtSecondSell.Top = 40;

                txtSecondSell.Width = 300;

                btnAdd.Left = 20;
                btnAdd.Top = 80;

                btnExit.Left = 20;
                btnExit.Top = 105;

                lblSecondSell.Text = "Адрес";

               
                lblSecondSell.Visible = true;

               
                txtSecondSell.Visible = true;
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

        private void comboBox5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

    public class Categories
    {
        public int id { get; set; }
        public string name { get; set; }

        public Categories(int id, string name)
        {
            this.id = id;
            this.name = name;
        }
    }
}
