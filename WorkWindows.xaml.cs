using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;


namespace AutoTrade
{

    public partial class WorkWindows : Window
    {
        SqlConnection SqlServer = new SqlConnection("Data Source=SAMSUNG\\SQLEXPRESS;Initial Catalog=Company;Integrated Security=True");

        public WorkWindows()
        {
            InitializeComponent();
        }

        private async void button_Click(object sender, RoutedEventArgs e)
        {
            var cmd = new SqlCommand() { Connection = SqlServer };

            cmd.CommandText = "dbo.AddNewClient";
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add("@Name", System.Data.SqlDbType.Char).Value = NameText.Text;
            cmd.Parameters.Add("@Last_name", System.Data.SqlDbType.Char).Value = Last_nameText.Text;
            cmd.Parameters.Add("@Patronymic", System.Data.SqlDbType.Char).Value = PatText.Text;
            cmd.Parameters.Add("@Birthday", System.Data.SqlDbType.DateTime).Value = ClientDate.DisplayDate.Date;
            cmd.Parameters.Add("@Sex", System.Data.SqlDbType.Bit).Value = SexComboBox.SelectedIndex;
            cmd.Parameters.Add("@PasportId", System.Data.SqlDbType.Char).Value = PasportText.Text;

            SqlServer.Open();
            await cmd.ExecuteNonQueryAsync();
            MessageBox.Show("Клиент успешно добавлен");
            SqlServer.Close();
        }

        string ChekSex(bool Sex)
        {
            if (Sex) return "M";
            else return "Ж"; 

        }

        void UpdateAutoTable()
        {
            var dataSet = new DataSet();
            var adapter = new SqlDataAdapter();
            var cmd = new SqlCommand() { Connection = SqlServer };

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = " Select * from dbo.AutoInfoView";
            adapter.SelectCommand = cmd;
            SqlServer.Open();

            dataGrid_Copy.Items.Clear();
            adapter.Fill(dataSet);
            foreach (DataRow row in dataSet.Tables[0].Rows)
            {
                var auto = new AutoClass()
                {
                    Serial = row[0].ToString(),
                 //   BuildDate = (DateTime)row[1],
                 //   Prise = (int)row[2],
                 //   Distanse = (int)row[3],
                    Brand = row[4].ToString(),
                    Company = row[5].ToString(),
                    Model = row[6].ToString(),
                    AutoId = row[8].ToString(),
                };
                dataGrid_Copy.Items.Add(auto);
            }
            SqlServer.Close();
        }

        void UpdateCLientTable()
        {
            var dataSet = new DataSet();
            var adapter = new SqlDataAdapter();
            var cmd = new SqlCommand() { Connection = SqlServer };

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = " Select * from dbo.ClientView";
            adapter.SelectCommand = cmd;
            SqlServer.Open();

            dataGrid_Copy1.Items.Clear();
            adapter.Fill(dataSet);
            foreach (DataRow row in dataSet.Tables[0].Rows)
            {
                var client = new ClientClass()
                {
                     
                    Name = row[0].ToString(),
                    LastName = row[1].ToString(),
                    Patronymic = row[2].ToString(),
                    Pasport = row[3].ToString(),
                    Birthday = (DateTime)row[4],
                    Sex = ChekSex((bool)row[5]),
                    ClientId = row[6].ToString(),

                };
                dataGrid_Copy1.Items.Add(client);
            }
            SqlServer.Close();

        }

        private void dataGrid_Copy_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {

            expander.IsExpanded = false;
            var item = dataGrid_Copy.SelectedItem as AutoClass;
            if (item != null)
            {
                AutoText.Text = string.Format("{0} {1} {2} , {3,YYYY} года выпуска с пробегом {4} Km за {5} Рублей", item.Company, item.Brand, item.Model, item.BuildDate, item.Distanse, item.Prise);
            }
            else
            {
                AutoText.Text = " ";
            }
            DeelClass.IdSelectAuto = int.Parse(item.AutoId);

        }

        private void TabItem_Selected(object sender, RoutedEventArgs e)
        {
            UpdateAutoTable();
            UpdateCLientTable();
            expander.IsExpanded = false;
            expander_Copy.IsExpanded = true;

        }

        private void dataGrid_Copy1_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            expander.IsExpanded = true;
            expander_Copy.IsExpanded = false;

            var item = dataGrid_Copy1.SelectedItem as ClientClass;
            if (item != null)
            {
                ClientText.Text = string.Format("{0} {1} {2} собирается купить ", item.LastName, item.Name, item.Patronymic);
            }
            else
            {
                ClientText.Text = " ";
            }
            DeelClass.IdSelectClient = int.Parse(item.ClientId);

        }

        private async void CreateDeelButton_Click(object sender, RoutedEventArgs e)
        {
            string result;
            if (DeelClass.IdSelectClient == 0)
            {
                MessageBox.Show("Неверно выбран Клиент");
                return;
            }
            if (DeelClass.IdSelectAuto == 0)
            {
                MessageBox.Show("Неверно выбран Автомобиль");
                return;
            }
            
                var cmd = new SqlCommand() { Connection = SqlServer };

                cmd.CommandText = "dbo.CreateDeel";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("@id_worker", System.Data.SqlDbType.Int).Value = DeelClass.IdActiveWorker = 1;
                cmd.Parameters.Add("@id_client", System.Data.SqlDbType.Int).Value = DeelClass.IdSelectClient;
                cmd.Parameters.Add("@id_auto", System.Data.SqlDbType.Int).Value = DeelClass.IdSelectAuto;

                SqlServer.Open();
                try
                {
                    await cmd.ExecuteNonQueryAsync();
                    result = "Сделка успешно совершена!";
                }
                catch (SqlException ex)
                {
                    result = ex.Message;
                }
                SqlServer.Close();
                MessageBox.Show(result);

                UpdateAutoTable();
                UpdateCLientTable();

            
        }
    }
}
