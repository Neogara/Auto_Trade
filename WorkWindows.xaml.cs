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

        public WorkWindows()
        {
            InitializeComponent();
            
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            var SqlServer = new SqlConnection(WorkerClass.SqlConnect);
            var cmd = new SqlCommand() { Connection = SqlServer };
            try
            {


                cmd.CommandText = "dbo.AddNewClient";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add("@Name", System.Data.SqlDbType.Char).Value = NameText.Text;
                cmd.Parameters.Add("@Last_name", System.Data.SqlDbType.Char).Value = Last_nameText.Text;
                cmd.Parameters.Add("@Patronymic", System.Data.SqlDbType.Char).Value = PatText.Text;
                cmd.Parameters.Add("@Birthday", System.Data.SqlDbType.DateTime).Value = ClientDate.DisplayDate.Date;
                cmd.Parameters.Add("@Sex", System.Data.SqlDbType.Bit).Value = SexComboBox.SelectedIndex;
                cmd.Parameters.Add("@PasportId", System.Data.SqlDbType.Char).Value = PasportText.Text;

                SqlServer.Open();
                cmd.ExecuteNonQuery();
                MessageBox.Show("Клиент успешно добавлен");
            }
            catch (Exception ex)
            {
                MessageBox.Show(string.Format("Произошла ошибка \"{0}\"", ex.Message));
            }
            finally
            { SqlServer.Close(); }


        }

        string ChekSex(bool Sex)
        {
            if (Sex) return "M";
            else return "Ж";

        }

        void UpdateTablesOfDellWorker(ListView ListData)
        {
            var SqlServer = new SqlConnection(WorkerClass.SqlConnect);
            var dataSet = new DataSet();
            var adapter = new SqlDataAdapter();
            var cmd = new SqlCommand() { Connection = SqlServer };

            cmd.CommandText = "dbo.OpenViewDeels";
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@Worker_user", System.Data.SqlDbType.VarChar).Value = WorkerClass.UserWorker;
            adapter.SelectCommand = cmd;
            SqlServer.Open();

            ListData.Items.Clear();
            try
            {
                adapter.Fill(dataSet);
                foreach (DataRow Row in dataSet.Tables[0].Rows)
                {
                    var Table = new WorkerDeelsClass()
                    {
                        DateDeel = (DateTime)Row[1],

                        Serial = Row[2].ToString(),
                        Company = Row[3].ToString(),
                        Brand = Row[4].ToString(),
                        Model = Row[5].ToString(),
                        BuildDate = (DateTime)Row[6],

                        NameClient = Row[7].ToString(),
                        LastNameClient = Row[8].ToString(),
                        PasportId = Row[9].ToString(),

                        Price = (long)Row[10]
                    };

                    ListData.Items.Add(Table);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(string.Format("Произошла ошибка \"{0}\"", ex.Message));
            }
            finally { SqlServer.Close(); }

        }

        void UpdateTablesAllDels(ListView ListData)
        {
            var SqlServer = new SqlConnection(WorkerClass.SqlConnect);
            var dataSet = new DataSet();
            var adapter = new SqlDataAdapter();
            var cmd = new SqlCommand() { Connection = SqlServer };

            cmd.CommandText = "Select * from dbo.ViewDeels";
            cmd.CommandType = System.Data.CommandType.Text;
            adapter.SelectCommand = cmd;
            try
            {
                SqlServer.Open();

                ListData.Items.Clear();
                adapter.Fill(dataSet);
                adapter.SelectCommand = cmd;
                foreach (DataRow Row in dataSet.Tables[0].Rows)
                {
                    var Table = new WorkerDeelsClass()
                    {

                        DateDeel = (DateTime)Row[1],

                        Serial = Row[2].ToString(),
                        Company = Row[3].ToString(),
                        Brand = Row[4].ToString(),
                        Model = Row[5].ToString(),
                        BuildDate = (DateTime)Row[6],

                        NameClient = Row[7].ToString(),
                        LastNameClient = Row[8].ToString(),
                        PasportId = Row[9].ToString(),

                        Price = (int)Row[10],
                        NameWorker = Row[12].ToString(),
                        LastNameWOrker = Row[13].ToString(),
                        Patronomic = Row[14].ToString()
                    };

                    ListData.Items.Add(Table);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(string.Format("Произошла ошибка \"{0}\"", ex.Message));
            }
            finally { SqlServer.Close(); }

        }

        void UpdateAutoTable(ListView ListData)
        {
            var SqlServer = new SqlConnection(WorkerClass.SqlConnect);
            var dataSet = new DataSet();
            var adapter = new SqlDataAdapter();
            var cmd = new SqlCommand() { Connection = SqlServer };

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = " Select * from dbo.AutoInfoView";
            adapter.SelectCommand = cmd;
            try
            {
                SqlServer.Open();

                ListData.Items.Clear();
                adapter.Fill(dataSet);
                foreach (DataRow row in dataSet.Tables[0].Rows)
                {
                    var auto = new AutoClass()
                    {
                        Serial = row[0].ToString(),
                        BuildDate = (DateTime)row[1],
                        Prise = (long)row[2],
                        Distanse = (int)row[3],
                        Brand = row[4].ToString(),
                        Company = row[5].ToString(),
                        Model = row[6].ToString(),
                        AutoId = row[8].ToString(),
                    };

                    ListData.Items.Add(auto);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(string.Format("Произошла ошибка \"{0}\"", ex.Message));
            }
            finally { SqlServer.Close(); }
        }

        void UpdateCLientTable()
        {
            var SqlServer = new SqlConnection(WorkerClass.SqlConnect);
            var dataSet = new DataSet();
            var adapter = new SqlDataAdapter();
            var cmd = new SqlCommand() { Connection = SqlServer };

            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = " Select * from dbo.Client";
            adapter.SelectCommand = cmd;
            try
            {
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
                        ClientId = row[4].ToString(),
                        Birthday = (DateTime)row[5],
                        Sex = ChekSex((bool)row[6]),
                       

                    };
                    dataGrid_Copy1.Items.Add(client);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(string.Format("Произошла ошибка \"{0}\"", ex.Message));
            }
            finally { SqlServer.Close(); }
        }

        void UpdateAllWorkers(ListView ListData)
        {

            var SqlServer = new SqlConnection(WorkerClass.SqlConnect);
            var dataSet = new DataSet();
            var adapter = new SqlDataAdapter();
            var cmd = new SqlCommand() { Connection = SqlServer };

            cmd.CommandText = "Select * from dbo.Worker";
            cmd.CommandType = System.Data.CommandType.Text;
            adapter.SelectCommand = cmd;
            try
            {
                SqlServer.Open();

                ListData.Items.Clear();
                adapter.Fill(dataSet);
                adapter.SelectCommand = cmd;
                foreach (DataRow Row in dataSet.Tables[0].Rows)
                {
                    var worker = new WorkerInfoClass()
                    {
                        NameWorker = Row[0].ToString(),
                        LastNameWorker = Row[1].ToString(),
                        Patronomic = Row[2].ToString(),
                        UserType = (int)Row[3],
                        UserWorker = Row[4].ToString(),

                    };
                    ListData.Items.Add(worker);

                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(string.Format("Произошла ошибка \"{0}\"", ex.Message));
            }
            finally { SqlServer.Close(); }
        }

        private void dataGrid_Copy_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {

            expander.IsExpanded = false;
            var item = dataGrid_Copy.SelectedItem as AutoClass;
            if (item != null)
            {
                AutoText.Text = string.Format("{0} {1} {2} , {3} года выпуска с пробегом {4} Km за {5} Рублей", item.Company, item.Brand, item.Model, item.BuildDate.Year, item.Distanse, item.Prise);
            }
            else
            {
                AutoText.Text = " ";
            }
            DeelClass.IdSelectAuto = int.Parse(item.AutoId);

        }

        private void TabItem_Selected(object sender, RoutedEventArgs e)
        {
            UpdateAutoTable(dataGrid_Copy);
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

        private void CreateDeelButton_Click(object sender, RoutedEventArgs e)
        {
            var SqlServer = new SqlConnection(WorkerClass.SqlConnect);
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

            cmd.Parameters.Add("@Worker_user", System.Data.SqlDbType.VarChar).Value = WorkerClass.UserWorker;
            cmd.Parameters.Add("@id_client", System.Data.SqlDbType.Int).Value = DeelClass.IdSelectClient;
            cmd.Parameters.Add("@id_auto", System.Data.SqlDbType.Int).Value = DeelClass.IdSelectAuto;
            try
            {
                SqlServer.Open();

                cmd.ExecuteNonQuery();
                MessageBox.Show ("Сделка успешно совершена!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(string.Format("Произошла ошибка \"{0}\" ", ex.Message));
            }
            SqlServer.Close();
         
            UpdateAutoTable(dataGrid_Copy);
            UpdateCLientTable();


        }

        private void TabItem_Selected_1(object sender, RoutedEventArgs e)
        {
            UpdateAutoTable(dataGrid_Copy3);
        }

        private void TabItem_Selected_2(object sender, RoutedEventArgs e)
        {
            UpdateTablesOfDellWorker(dataGrid_Copy4);
        }

        private void TabItem_Selected_3(object sender, RoutedEventArgs e)
        {
            UpdateTablesAllDels(dataGrid_Copy5);
        }

        private void butto2n_Click(object sender, RoutedEventArgs e)
        {
            var SqlServer = new SqlConnection(WorkerClass.SqlConnect);
            var cmd = new SqlCommand() { Connection = SqlServer };

            cmd.CommandText = "dbo.CreateUser";
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add("@Name", System.Data.SqlDbType.VarChar).Value = NameTex2t.Text;
            cmd.Parameters.Add("@LastName", System.Data.SqlDbType.VarChar).Value = Last_2nameText.Text;
            cmd.Parameters.Add("@Pat", System.Data.SqlDbType.VarChar).Value = PatTe2xt.Text;
            cmd.Parameters.Add("@Username", System.Data.SqlDbType.VarChar).Value = LoginText.Text;
            cmd.Parameters.Add("@Password", System.Data.SqlDbType.VarChar).Value = PasswordText.Text;
            cmd.Parameters.Add("@Usertype", System.Data.SqlDbType.Int).Value = UserTypes.SelectedIndex + 1;
            try
            {
                SqlServer.Open();
                cmd.ExecuteNonQuery();
                MessageBox.Show("Рабочий успешно добавлен");
            }
            catch (Exception ex)
            {
                MessageBox.Show(string.Format("Произошла ошибка \"{0}\"", ex.Message));
            }
            finally { SqlServer.Close();}
            
        }

        private void TextDistanse_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!char.IsDigit(e.Text, e.Text.Length - 1))
            {
                e.Handled = true;
            }
        }

        private void ButtonAddAuto_Click(object sender, RoutedEventArgs e)
        {
            var SqlServer = new SqlConnection(WorkerClass.SqlConnect);
            var cmd = new SqlCommand() { Connection = SqlServer };

            cmd.CommandText = "dbo.addNewAuto";
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add("@Company", System.Data.SqlDbType.VarChar).Value = BrandBox.Text;
            cmd.Parameters.Add("@Brand", System.Data.SqlDbType.VarChar).Value = TextMark.Text;
            cmd.Parameters.Add("@Model", System.Data.SqlDbType.VarChar).Value = TextModel.Text;
            cmd.Parameters.Add("@Serial", System.Data.SqlDbType.VarChar).Value = TextSerial.Text;
            cmd.Parameters.Add("@Data", System.Data.SqlDbType.DateTime).Value = Date.DisplayDate.Date;
            cmd.Parameters.Add("@Distanse", System.Data.SqlDbType.Int).Value = int.Parse(TextDistanse.Text);
            cmd.Parameters.Add("@Price", System.Data.SqlDbType.BigInt).Value = Int64.Parse(TextPrice.Text);
            try {
                SqlServer.Open();
                cmd.ExecuteNonQuery();
                MessageBox.Show("Авто добавлено!");
            }
            catch (Exception ex)
            {
                MessageBox.Show(string.Format("Произошла ошибка \"{0}\"", ex.Message));
            }
            finally { SqlServer.Close(); }

        }

        private void ViewAllManagerItem_Selected(object sender, RoutedEventArgs e)
        {
            UpdateAllWorkers(dataGrid_Copy6);
        }

        private void TabItem_Selected_4(object sender, RoutedEventArgs e)
        {
            WorkerClass.LoginOut();
            Window1 LoginPage = new Window1();
            LoginPage.Show();
            this.Close();
            
        }
        public void UpdateLogs(ListView ListData)
        {
            var SqlServer = new SqlConnection(WorkerClass.SqlConnect);
        var dataSet = new DataSet();
        var adapter = new SqlDataAdapter();
        var cmd = new SqlCommand() { Connection = SqlServer };

            cmd.CommandText = "select * from Dbo.DataBaseLog Where Table_name like 'dbo.Deels' ";

            cmd.CommandType = System.Data.CommandType.Text;
            adapter.SelectCommand = cmd;
            SqlServer.Open();

            ListData.Items.Clear();
            try
            {
                adapter.Fill(dataSet);
                foreach (DataRow Row in dataSet.Tables[0].Rows)
                {
                    var Table = new LogClass()
                    {
                        User = Row[0].ToString(),
                        TableName = Row[1].ToString(),
                        Date = Row[2].ToString(),
                        Disc = Row[3].ToString()
                };

        ListData.Items.Add(Table);
                }
}
            catch (Exception ex)
            {
                MessageBox.Show(string.Format("Произошла ошибка \"{0}\"", ex.Message));
            }
            finally { SqlServer.Close(); }

        }
        private void ViewAllLogs_Selected(object sender, RoutedEventArgs e)
        {
            UpdateLogs(dataGrid_Log);
        }
    }
}


