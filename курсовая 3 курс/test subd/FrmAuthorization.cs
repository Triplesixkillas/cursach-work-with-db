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

namespace test_subd
{
    public partial class frmAuthorization : Form
    {

        static SqlConnection connect = new SqlConnection(Properties.Settings.Default.connectionString);


        public frmAuthorization()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btnConnect_Click(object sender, EventArgs e) // Войти
        {
            try
            {
                if (connect.State == ConnectionState.Closed)
                    connect.Open();
                

                int userID;

                // если процедуры нет 
                SqlCommand command = new SqlCommand($"Select * from [Users] where loginRules = '{tbLogin.Text}' and passwordRules = '{tbPassword.Text}' ", connect);
                

                // подготавливаем команду для чтения
                SqlDataReader dataReader = command.ExecuteReader();
                dataReader.Read();


                if (dataReader.HasRows) // если есть хоть одна строка 
                {
                    userID = dataReader.GetInt32(0);
                    MainForm fm = new MainForm(connect, dataReader.GetInt32(2), userID);
                    fm.ShowDialog();


                    this.Hide();
                }
                else
                    MessageBox.Show("Неверный логин или пароль");

                SqlCommand logRequst = new SqlCommand();
                connect.Close();
            }

            catch (Exception ex)
            {
                MessageBox.Show($"Не удалось создать подключение: {ex.Message}");
                return;
            }
        }
    }
}
