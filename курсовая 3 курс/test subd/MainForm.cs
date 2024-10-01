using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Runtime.Remoting.Contexts;
using Microsoft.SqlServer.Server;
using static System.Windows.Forms.DataFormats;
using System.Data.Common;
using System.Diagnostics.Eventing.Reader;
using System.Reflection.Emit;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using System.Security.Cryptography;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Menu;


namespace test_subd
{

    public partial class MainForm : Form
    {

        SqlConnection connect;
        int roleForm;
        int userID;

        public MainForm(SqlConnection cnct, int rl, int uID)
        {
            userID = uID;
            connect = cnct;
            roleForm = rl;
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            dataGridView1.CellDoubleClick += DataGridViewCellDoubleClick;
            if (roleForm == 2 || roleForm == 3 || roleForm == 4 || roleForm == 6 || roleForm == 7 || roleForm == 10)
            {
                addString.Visible = false;
                delString.Visible = false;
                EditStr.Visible = false;
                cmbTables.Items.RemoveAt(10);
                cmbTables.Items.RemoveAt(7);
                cmbTables.Items.RemoveAt(6);
                cmbTables.Items.RemoveAt(5);
                cmbTables.Items.RemoveAt(4);
                cmbTables.Items.RemoveAt(3);
                cmbTables.Items.RemoveAt(2);
                cmbTables.Items.RemoveAt(1);
                cmbTables.Items.RemoveAt(0);
            }   
            else if (roleForm == 5 || roleForm == 8 || roleForm == 9)
            {
                delString.Visible = false;
                cmbTables.Items.RemoveAt(5);
                cmbTables.Items.RemoveAt(4);

            }
                SqlConnection sqlConnect = new SqlConnection(Properties.Settings.Default.connectionString); // тут надо вставить переменную  

            sqlConnect.Open();
            SqlCommand logRequst = new SqlCommand();
            logRequst.CommandText = $"SELECT * FROM _Товары";

            logRequst.Connection = sqlConnect;


            // SqlAdapter - прослойка между источником данных и базой данных
            SqlDataAdapter adapter = new SqlDataAdapter(logRequst);
            DataSet dataSet = new DataSet();
            // заполняем источник данных полученными из адаптера записями
            adapter.Fill(dataSet);
            dataGridView1.DataSource = dataSet.Tables[0];
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;

            lblCount.Text = Convert.ToString(dataSet.Tables[0].Rows.Count); //считаем строчки

            sqlConnect.Close();
            dataGridView1.Columns[0].Visible = false;
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void txtbSearch_TextChanged(object sender, EventArgs e)
        {
            var columnNames = dataGridView1.Columns.Cast<DataGridViewColumn>()
                    .Select(x => "[" + x.HeaderText + "]")
                    .ToList();

            // Создаем строку фильтрации
            string filterExpression = string.Empty;
            foreach (var columnName in columnNames)
            {
                if (!string.IsNullOrEmpty(filterExpression))
                    filterExpression += " OR ";

                filterExpression += $"CONVERT({columnName}, 'System.String') LIKE '%{txtbSearch.Text}%'";
            }

    // Применяем фильтр к строкам DGV1
    (dataGridView1.DataSource as DataTable).DefaultView.RowFilter = filterExpression;

            // Подсчитываем количество отфильтрованных строк
            int rowCount = (dataGridView1.DataSource as DataTable).DefaultView.Count;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;

            // Выводим количество найденных строк в label1
            lblCount.Text = rowCount.ToString();
        }

       

        public void RefreshData()
        {
            // Создаем подключение к базе данных
            using (SqlConnection sqlConnect = new SqlConnection(Properties.Settings.Default.connectionString))
            {
                // Открываем подключение
                sqlConnect.Open();

                // Создаем команду SQL для выполнения запроса
                SqlCommand logRequst = new SqlCommand();
                logRequst.Connection = sqlConnect;
                logRequst.CommandText = $"SELECT * FROM _{cmbTables.SelectedItem.ToString()}";

                // Создаем адаптер данных
                SqlDataAdapter adapter = new SqlDataAdapter(logRequst);

                // Создаем набор данных
                DataSet dataSet = new DataSet();

                // Заполняем набор данных данными из адаптера
                adapter.Fill(dataSet);

                // Привязываем данные к DataGridView на форме 2
                dataGridView1.DataSource = dataSet.Tables[0];
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;

                // Обновляем текст метки с количеством строк
                lblCount.Text = dataSet.Tables[0].Rows.Count.ToString();
            }
        }

        private void cmbTables_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection sqlConnect = new SqlConnection(Properties.Settings.Default.connectionString);
            SqlCommand logRequst = new SqlCommand();
            logRequst.CommandText = $"SELECT * FROM _{cmbTables.SelectedItem.ToString()}";

            logRequst.Connection = sqlConnect;


            // SqlAdapter - прослойка между источником данных и базой данных
                SqlDataAdapter adapter = new SqlDataAdapter(logRequst);
                DataSet dataSet = new DataSet();
                // заполняем источник данных полученными из адаптера записями
                adapter.Fill(dataSet);

                dataGridView1.DataSource = dataSet.Tables[0];
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;

            lblCount.Text = Convert.ToString(dataSet.Tables[0].Rows.Count); //считаем строчки

  
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            // Создаем экземпляр первой формы
            Form frmAuthorization = new frmAuthorization();

            // Показываем первую форму
            frmAuthorization.Show();

            // Закрываем текущую форму (вторую форму)
            this.Close();

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void addString_Click(object sender, EventArgs e)
        {
            string boxItem = cmbTables.SelectedItem.ToString(); 
            this.Hide();
            //Form fm = Application.OpenForms["Form3"];
            AddForm fm = new AddForm(connect, roleForm, boxItem);
            fm.ShowDialog();
        }

        private void delString_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Вы не выбрали строку для удаления", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // Получаем выбранную строку
            DataGridViewRow selectedRow = dataGridView1.SelectedRows[0];


                // Формируем текст для подтверждения удаления
                string confirmationText = $"Вы действительно хотите удалить из таблицы ";

                // Получаем значения всех столбцов выбранной строки и добавляем их к тексту подтверждения
                for (int i = 0; i < selectedRow.Cells.Count; i++)
                {
                    confirmationText += $"{selectedRow.Cells[i].Value.ToString()}";
                    if (i < selectedRow.Cells.Count - 1)
                        confirmationText += " - ";
                }

                // Показываем окно подтверждения
                DialogResult result = MessageBox.Show(confirmationText, "Подтверждение удаления", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                // Если пользователь подтвердил удаление, выполняем операцию
                if (result == DialogResult.Yes)
                {
                    try
                    {
                        using (SqlConnection sqlConnect = new SqlConnection(Properties.Settings.Default.connectionString))
                        {
                            sqlConnect.Open();
                            SqlCommand logRequest = new SqlCommand();
                            logRequest.Connection = sqlConnect;

                            string columnName = dataGridView1.Columns[0].HeaderText;
                            string condition = selectedRow.Cells[0].Value.ToString();
                            string tableName = cmbTables.SelectedItem.ToString();

                        if (cmbTables.SelectedItem.ToString() == "Товары")
                        {
                            logRequest.CommandText = $"DELETE FROM Goods WHERE goodID = {selectedRow.Cells[0].Value.ToString()}";
                            logRequest.ExecuteNonQuery();
                            logRequest.CommandText = "SELECT * FROM _Товары";
                        }
                        if (cmbTables.SelectedItem.ToString() == "Контейнер")
                        {
                            logRequest.CommandText = $"DELETE FROM Container WHERE containerID = {selectedRow.Cells[0].Value.ToString()}";
                            logRequest.ExecuteNonQuery();
                            logRequest.CommandText = "SELECT * FROM _Контейнер";
                        }
                        if (cmbTables.SelectedItem.ToString() == "Доставки")
                        {
                            logRequest.CommandText = $"DELETE FROM Delivery WHERE deliveryID = {selectedRow.Cells[0].Value.ToString()}";
                            logRequest.ExecuteNonQuery();
                            logRequest.CommandText = "SELECT * FROM _Доставки";
                        }
                        if (cmbTables.SelectedItem.ToString() == "Водители")
                        {
                            logRequest.CommandText = $"DELETE FROM EmployeeDriver WHERE employeeDriverID = {selectedRow.Cells[0].Value.ToString()}";
                            logRequest.ExecuteNonQuery();
                            logRequest.CommandText = "SELECT * FROM _Водители";
                        }
                        if (cmbTables.SelectedItem.ToString() == "Фирмы")
                        {
                            logRequest.CommandText = $"DELETE FROM FirmsGoods WHERE fgid = {selectedRow.Cells[0].Value.ToString()}";
                            logRequest.ExecuteNonQuery();
                            logRequest.CommandText = "SELECT * FROM _Фирмы";
                        }
                        if (cmbTables.SelectedItem.ToString() == "Заказы")
                        {
                            logRequest.CommandText = $"DELETE FROM Orders WHERE orderid = {selectedRow.Cells[0].Value.ToString()}";
                            logRequest.ExecuteNonQuery();
                            logRequest.CommandText = "SELECT * FROM _Заказы";
                        }
                        if (cmbTables.SelectedItem.ToString() == "Роли")
                        {
                            logRequest.CommandText = $"DELETE FROM Roles WHERE RolesID = {selectedRow.Cells[0].Value.ToString()}";
                            logRequest.ExecuteNonQuery();
                            logRequest.CommandText = "SELECT * FROM _Роли";
                        }
                        if (cmbTables.SelectedItem.ToString() == "Транспорт")
                        {
                            logRequest.CommandText = $"DELETE FROM Transport WHERE transportID = {selectedRow.Cells[0].Value.ToString()}";
                            logRequest.ExecuteNonQuery();
                            logRequest.CommandText = "SELECT * FROM _Транспорт";
                        }
                        if (cmbTables.SelectedItem.ToString() == "ТипТовара")
                        {
                            logRequest.CommandText = $"DELETE FROM TypeGoods WHERE typeGoodsID = {selectedRow.Cells[0].Value.ToString()}";
                            logRequest.ExecuteNonQuery();
                            logRequest.CommandText = "SELECT * FROM _ТипТовара";
                        }
                        if (cmbTables.SelectedItem.ToString() == "ТипДоставки")
                        {
                            logRequest.CommandText = $"DELETE FROM Typeofdelivery WHERE typeDeliveryID = {selectedRow.Cells[0].Value.ToString()}";
                            logRequest.ExecuteNonQuery();
                            logRequest.CommandText = "SELECT * FROM _ТипДоставки";
                        }
                        if (cmbTables.SelectedItem.ToString() == "Пользователи")
                        {
                            logRequest.CommandText = $"DELETE FROM Users WHERE userID = {selectedRow.Cells[0].Value.ToString()}";
                            logRequest.ExecuteNonQuery();
                            logRequest.CommandText = "SELECT * FROM _Пользователи";
                        }
                        if (cmbTables.SelectedItem.ToString() == "Склады")
                        {
                            logRequest.CommandText = $"DELETE FROM Warehouses WHERE warehouseID = {selectedRow.Cells[0].Value.ToString()}";
                            logRequest.ExecuteNonQuery();
                            logRequest.CommandText = "SELECT * FROM _Склады";
                        }
                        
                        // SqlAdapter - прослойка между источником данных и базой данных
                        SqlDataAdapter adapter = new SqlDataAdapter(logRequest);
                        DataSet dataSet = new DataSet();
                        // заполняем источник данных полученными из адаптера записями
                        adapter.Fill(dataSet);

                        dataGridView1.DataSource = dataSet.Tables[0];
                        dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;

                        lblCount.Text = Convert.ToString(dataSet.Tables[0].Rows.Count); //считаем строчки
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show($"Ошибка удаления: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                       
                    }
                }
        }

        private void EditStr_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Вы не выбрали строку для редактирования", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // Получаем выбранную строку
            DataGridViewRow selectedRow = dataGridView1.SelectedRows[0];

            // Формируем текст для подтверждения удаления
            string confirmationText = $"Вы действительно хотите редактировать запись: ";

            // Получаем значения всех столбцов выбранной строки и добавляем их к тексту подтверждения
            for (int i = 0; i < selectedRow.Cells.Count; i++)
            {
                confirmationText += $"{selectedRow.Cells[i].Value.ToString()}";
                if (i < selectedRow.Cells.Count - 1)
                    confirmationText += " - ";
            }

            // Показываем окно подтверждения
            DialogResult result = MessageBox.Show(confirmationText, "Подтверждение редактирования", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            // Если пользователь подтвердил удаление, выполняем операцию
            if (result == DialogResult.Yes)
            { 

                string boxItem = cmbTables.SelectedItem.ToString();
            string condition = selectedRow.Cells[0].Value.ToString();
            this.Hide();
            try
            {
                EditForm fm = new EditForm(connect, roleForm, boxItem, condition);
                fm.ShowDialog();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка редактирования: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            }
        }

        private void DataGridViewCellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (roleForm == 1 || roleForm == 5 || roleForm == 8 || roleForm == 9)
            {
                // Получаем выбранную строку
                DataGridViewRow selectedRow = dataGridView1.CurrentRow;

                // Формируем текст для подтверждения удаления
                string confirmationText = $"Вы действительно хотите редактировать запись: ";

                // Получаем значения всех столбцов выбранной строки и добавляем их к тексту подтверждения
                for (int i = 0; i < selectedRow.Cells.Count; i++)
                {
                    confirmationText += $"{selectedRow.Cells[i].Value.ToString()}";
                    if (i < selectedRow.Cells.Count - 1)
                        confirmationText += " - ";
                }
                DialogResult result = MessageBox.Show(confirmationText, "Подтверждение редактирования", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                if (result == DialogResult.Yes)
                {

                    string boxItem = cmbTables.SelectedItem.ToString();
                    // Получение значения из 1 столбца (индексация начинается с 0)
                    string condition = selectedRow.Cells[0].Value.ToString();

                    this.Hide();

                    EditForm fm = new EditForm(connect, roleForm, boxItem, condition);
                    fm.ShowDialog();
                }
            }
        }

        private void textBoxColumn_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnDoOrder_Click(object sender, EventArgs e)
        {
            if (cmbTables.SelectedItem?.ToString() != "Товары")
            {
                MessageBox.Show("Заказ можно совершить только выбрав товар", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else {
                if (dataGridView1.SelectedRows.Count == 0)
                {
                    MessageBox.Show("Вы не выбрали товар", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                else { 
                // Получаем выбранную строку
                DataGridViewRow selectedRow = dataGridView1.SelectedRows[0];

            // Формируем текст для подтверждения удаления
            string confirmationText = $"Вы действительно хотите заказать: ";

            string goodID = selectedRow.Cells[0].Value.ToString();

            // Получаем значения всех столбцов выбранной строки и добавляем их к тексту подтверждения
            for (int i = 0; i < selectedRow.Cells.Count; i++)
            {


                confirmationText += $"{selectedRow.Cells[i].Value.ToString()}";
                if (i < selectedRow.Cells.Count - 1)
                    confirmationText += " - ";
            }

            // Показываем окно подтверждения
            DialogResult result = MessageBox.Show(confirmationText, "Оформление заказа", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (result == DialogResult.Yes)
            {
                string labelText = "Введите количество товара:";
                using (InputDialog inputDialog = new InputDialog(labelText))
                {
                    if (inputDialog.ShowDialog() == DialogResult.OK)
                    {
                        // Получаем значения customerID, goodID и orderAmount
                        int customerID = userID; // Предполагается, что UID - переменная, содержащая customerID
                        decimal orderAmount;
                        if (!decimal.TryParse(inputDialog.EnteredText, out orderAmount))
                        {
                            MessageBox.Show("Пожалуйста, введите корректное число.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            return;
                        }

                        // Подключение к базе данных и выполнение запроса
                        try
                        {
                            using (SqlConnection sqlConnect = new SqlConnection(Properties.Settings.Default.connectionString))
                            {
                                sqlConnect.Open();
                                SqlCommand command = new SqlCommand();
                                command.Connection = sqlConnect;

                                // Получаем максимальное значение userID с учетом указанных RoleID
                                command.CommandText = "SELECT MAX(userID) FROM Users WHERE roles IN (5, 8, 9)";
                                int maxUserID = (int)command.ExecuteScalar();

                                // Выбираем случайный employeeID из диапазона от 1 до maxUserID
                                Random random = new Random();
                                int employeeID = random.Next(1, maxUserID + 1);

                                // Вставляем новую запись в таблицу Orders
                                command.CommandText = "INSERT INTO Orders (employeeID, customerID, goodID, orderAmount) VALUES (@EmployeeID, @CustomerID, @GoodID, @OrderAmount)";
                                command.Parameters.AddWithValue("@EmployeeID", employeeID);
                                command.Parameters.AddWithValue("@CustomerID", customerID);
                                command.Parameters.AddWithValue("@GoodID", goodID);
                                command.Parameters.AddWithValue("@OrderAmount", orderAmount);
                                command.ExecuteNonQuery();

                                MessageBox.Show("Вы успешно сделали заказ");
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show($"Ошибка добавления заказа: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                            }
                        }
                    }
                }
            }
        }

        private void btnCheckOrder_Click(object sender, EventArgs e)
        {
            this.Hide();
            CheckOrder fm = new CheckOrder(userID, connect);
            fm.ShowDialog();
        }

        private void lblCount_Click(object sender, EventArgs e)
        {

        }
    }
    /*
private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
--{
(dataGridView1.DataSource as DataTable).DefaultView.RowFilter = $"Date > {dateTimePicker1.Value} AND Date < {dateTimePicker2}";
}

private void dateTimePicker2_ValueChanged(object sender, EventArgs e)
{
(dataGridView1.DataSource as DataTable).DefaultView.RowFilter = $"Date > {dateTimePicker1.Value} AND Date < {dateTimePicker2}";
}
*/
}