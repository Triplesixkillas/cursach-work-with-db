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

namespace test_subd
{

    public partial class Form4 : Form
    {

        SqlConnection connect;
        int roleForm;
        string boxItem;

        public Form4(SqlConnection cnct, int rl, string item)
        {
            connect = cnct;
            roleForm = rl;
            boxItem = item;
            InitializeComponent();
        }



        private void Form4_Load(object sender, EventArgs e)
        {
            label2.Text = boxItem;
            SqlConnection sqlConnection2 = new SqlConnection(Settings.Default.connectionString);
            sqlConnection2.Open();
            if (boxItem == "Container")
            {
                
                SqlDataReader sqlDataReader2 = new SqlCommand("Select containerID from Container", sqlConnection2).ExecuteReader();
                if (sqlDataReader2.HasRows)
                {
                    while (sqlDataReader2.Read())
                    {
                        comboBox1.Items.Add(Convert.ToInt32(sqlDataReader2["containerID"]));
                    }
                }
                sqlDataReader2.Close();
            }
            if (boxItem == "Delivery")
            {
                SqlDataReader sqlDataReader2 = new SqlCommand("Select deliveryID from Delivery", sqlConnection2).ExecuteReader();
                if (sqlDataReader2.HasRows)
                {
                    while (sqlDataReader2.Read())
                    {
                        comboBox1.Items.Add(Convert.ToInt32(sqlDataReader2["deliveryID"]));
                    }
                }
                sqlDataReader2.Close();
            }
            if (boxItem == "EmployeeDriver")
            {
                SqlDataReader sqlDataReader2 = new SqlCommand("Select employeeDriverID from Delivery", sqlConnection2).ExecuteReader();
                if (sqlDataReader2.HasRows)
                {
                    while (sqlDataReader2.Read())
                    {
                        comboBox1.Items.Add(Convert.ToInt32(sqlDataReader2["employeeDriverID"]));
                    }
                }
                sqlDataReader2.Close();
            }
            if (boxItem == "Users")
            {
                SqlDataReader sqlDataReader2 = new SqlCommand("Select userID from Users", sqlConnection2).ExecuteReader();
                if (sqlDataReader2.HasRows)
                {
                    while (sqlDataReader2.Read())
                    {
                        comboBox1.Items.Add(Convert.ToInt32(sqlDataReader2["userID"]));
                    }
                }
                sqlDataReader2.Close();
            }
            if (boxItem == "FirmsGoods")
            {
                SqlDataReader sqlDataReader2 = new SqlCommand("Select fgid from FirmsGoods", sqlConnection2).ExecuteReader();
                if (sqlDataReader2.HasRows)
                {
                    while (sqlDataReader2.Read())
                    {
                        comboBox1.Items.Add(Convert.ToInt32(sqlDataReader2["fgid"]));
                    }
                }
                sqlDataReader2.Close();
            }
            if (boxItem == "Goods")
            {
                SqlDataReader sqlDataReader2 = new SqlCommand("Select goodID from Goods", sqlConnection2).ExecuteReader();
                if (sqlDataReader2.HasRows)
                {
                    while (sqlDataReader2.Read())
                    {
                        comboBox1.Items.Add(Convert.ToInt32(sqlDataReader2["goodID"]));
                    }
                }
                sqlDataReader2.Close();
            }
            if (boxItem == "Roles")
            {
                SqlDataReader sqlDataReader2 = new SqlCommand("Select RolesID from Roles", sqlConnection2).ExecuteReader();
                if (sqlDataReader2.HasRows)
                {
                    while (sqlDataReader2.Read())
                    {
                        comboBox1.Items.Add(Convert.ToInt32(sqlDataReader2["RolesID"]));
                    }
                }
                sqlDataReader2.Close();
            }
            if (boxItem == "Orders")
            {
                SqlDataReader sqlDataReader2 = new SqlCommand("Select orderid from Orders", sqlConnection2).ExecuteReader();
                if (sqlDataReader2.HasRows)
                {
                    while (sqlDataReader2.Read())
                    {
                        comboBox1.Items.Add(Convert.ToInt32(sqlDataReader2["orderid"]));
                    }
                }
                sqlDataReader2.Close();
            }
            if (boxItem == "Transport")
            {
                SqlDataReader sqlDataReader2 = new SqlCommand("Select transportID from Transport", sqlConnection2).ExecuteReader();
                if (sqlDataReader2.HasRows)
                {
                    while (sqlDataReader2.Read())
                    {
                        comboBox1.Items.Add(Convert.ToInt32(sqlDataReader2["Transport"]));
                    }
                }
                sqlDataReader2.Close();
            }
            if (boxItem == "TypeGoods")
            {
                SqlDataReader sqlDataReader2 = new SqlCommand("Select typeGoodsID from TypeGoods", sqlConnection2).ExecuteReader();
                if (sqlDataReader2.HasRows)
                {
                    while (sqlDataReader2.Read())
                    {
                        comboBox1.Items.Add(Convert.ToInt32(sqlDataReader2["typeGoodsID"]));
                    }
                }
                sqlDataReader2.Close();
            }
            if (boxItem == "Typeofdelivery")
            {
                SqlDataReader sqlDataReader2 = new SqlCommand("Select typeDeliveryID from Typeofdelivery", sqlConnection2).ExecuteReader();
                if (sqlDataReader2.HasRows)
                {
                    while (sqlDataReader2.Read())
                    {
                        comboBox1.Items.Add(Convert.ToInt32(sqlDataReader2["typeDeliveryID"]));
                    }
                }
                sqlDataReader2.Close();
            }
            if (boxItem == "Warehouses")
            {
                SqlDataReader sqlDataReader2 = new SqlCommand("Select warehouseID from Warehouses", sqlConnection2).ExecuteReader();
                if (sqlDataReader2.HasRows)
                {
                    while (sqlDataReader2.Read())
                    {
                        comboBox1.Items.Add(Convert.ToInt32(sqlDataReader2["Warehouses"]));
                    }
                }
                sqlDataReader2.Close();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection = new SqlConnection(Settings.Default.connectionString);
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnection;

            if (boxItem == "Container")
            {
                sqlCommand.CommandText = $"DELETE [Container] WHERE containerID = ({comboBox1.SelectedIndex + 1})";
                
            }

            else if (boxItem == "Delivery")
            {
                sqlCommand.CommandText = $"DELETE [Delivery] WHERE deliveryID = ({comboBox1.SelectedIndex + 1})";
            }

            else if (boxItem == "EmployeeDriver")
            {
                sqlCommand.CommandText = $"DELETE [EmployeeDriver] WHERE employeeDriverID = ({comboBox1.SelectedIndex + 1})";
            }

            else if (boxItem == "Users")
            {
                sqlCommand.CommandText = $"DELETE [Users] WHERE userID = ({comboBox1.SelectedIndex + 1})";
            }

            else if (boxItem == "FirmsGoods")
            {
                sqlCommand.CommandText = $"DELETE [FirmsGoods] WHERE fgid = ({comboBox1.SelectedIndex + 1})";
            }

            else if (boxItem == "Goods")
            {
                sqlCommand.CommandText = $"DELETE [Goods] WHERE goodID = ({comboBox1.SelectedIndex + 1})";
            }

            else if (boxItem == "Roles")
            {
                sqlCommand.CommandText = $"DELETE [Roles] WHERE RolesID = ({comboBox1.SelectedIndex + 1})";
            }

            else if (boxItem == "Orders")
            {
                sqlCommand.CommandText = $"DELETE [Orders] WHERE orderid = ({comboBox1.SelectedIndex + 1})";
            }

            else if (boxItem == "Transport")
            {
                sqlCommand.CommandText = $"DELETE [Transport] WHERE transportID = ({comboBox1.SelectedIndex + 1})";
            }

            else if (boxItem == "TypeGoods")
            {
                sqlCommand.CommandText = $"DELETE [TypeGoods] WHERE typeGoodsID = ({comboBox1.SelectedIndex + 1})";
            }

            else if (boxItem == "Typeofdelivery")
            {
                sqlCommand.CommandText = $"DELETE [Typeofdelivery] WHERE typeDeliveryID = ({comboBox1.SelectedIndex + 1})";
            }

            else if (boxItem == "Warehouses")
            {
                sqlCommand.CommandText = $"DELETE [Warehouses] WHERE warehouseID = ({comboBox1.SelectedIndex + 1})";

            }

            sqlCommand.ExecuteNonQuery();
            MessageBox.Show("Запись успешно добавлена");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
            Application.OpenForms["Form2"].Show();
        }
    }
}
