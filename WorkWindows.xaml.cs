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


namespace AutoTrade
{
   
    public partial class WorkWindows : Window
    {
        SqlConnection SqlServer = new SqlConnection("Data Source=SAMSUNG\\SQLEXPRESS;Initial Catalog=Company;Integrated Security=True");

        public WorkWindows()
        {
            InitializeComponent();
            SqlServer.Open();
            
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
            int x;
             x = await cmd.ExecuteNonQueryAsync();
            MessageBox.Show("Клиент успешно добавлен",(x).ToString());
            SqlServer.Close();
        }
    }
}
