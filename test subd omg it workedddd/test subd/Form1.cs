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
                MessageBox.Show("Подключение установлено");



                // если процедуры нет 
                SqlCommand command = new SqlCommand($"Select * from [Users] where loginRules = '{tbLogin.Text}' and passwordRules = '{tbPassword.Text}' ", connect);

                // подготавливаем команду для чтения
                SqlDataReader dataReader = command.ExecuteReader();
                dataReader.Read();


                if (dataReader.HasRows) // если есть хоть одна строка 
                {
                    Form2 fm = new Form2(connect, dataReader.GetInt32(2));
                    fm.ShowDialog();


                    this.Hide();
                }
                else
                    MessageBox.Show("Неверный логин или пароль");

                SqlCommand logRequst = new SqlCommand();
            }

            catch (Exception ex)
            {
                MessageBox.Show($"Не удалось создать подключение: {ex.Message}");
                return;
            }




            /* если создана процедура CheckLogin

            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "CheckLogin";
            command.Parameters.AddWithValue("@user_login", tbLogin.Text);
            command.Parameters.AddWithValue("@user_password", tbPassword.Text); */





        }
    }
}
