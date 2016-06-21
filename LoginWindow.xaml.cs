using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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

namespace AutoTrade
{
    /// <summary>
    /// Логика взаимодействия для Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        WorkWindows WorkPage = new WorkWindows();

        public Window1()
        {
            InitializeComponent();

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

            var request = WorkerClass.LoginIn(LoginText.Text, PasswordText.Password);
            if (request != "Done")
            {
                MessageBox.Show(request);
                return;
            }

            switch (WorkerClass.UserType)
            {
                case 1:
                    {
                        ViewTabItem(new TabItem[]{
                                WorkPage.AddClientItem,
                                WorkPage.AddDeelsItem,
                                WorkPage.ViewDeelsItem,
                                WorkPage.ViewAutoItem
                                });
                        break;

                    }

                case 2:
                    {
                        ViewTabItem(new TabItem[] {
                                WorkPage.AddClientItem,
                                WorkPage.AddDeelsItem,
                                WorkPage.ViewAllDeelsItem,
                                WorkPage.ViewAllManagerItem,
                                WorkPage.ViewDeelsItem,
                                WorkPage.WorkWithManagerItem,
                                WorkPage.ViewAutoItem,
                                WorkPage.AddAuto,
                                WorkPage.ViewAllLogs
                                });
                        break;
                    }
                default:
                    {
                        MessageBox.Show("Недопустимые права доступа ");
                        return;
                    }
            }
            
            WorkPage.Title = string.Format("{0} {1}", WorkerClass.LastNameWorker, WorkerClass.NameWorker);
            WorkPage.Show();
            this.Close();
        }

        private void ViewTabItem(TabItem[] ViewsTabitem)
        {
            WorkPage.AddClientItem.Visibility = Visibility.Collapsed;
            WorkPage.AddDeelsItem.Visibility = Visibility.Collapsed;
            WorkPage.ViewAllDeelsItem.Visibility = Visibility.Collapsed;
            WorkPage.ViewAllManagerItem.Visibility = Visibility.Collapsed;
            WorkPage.ViewDeelsItem.Visibility = Visibility.Collapsed;
            WorkPage.WorkWithManagerItem.Visibility = Visibility.Collapsed;
            WorkPage.ViewAutoItem.Visibility = Visibility.Collapsed;
            WorkPage.AddAuto.Visibility = Visibility.Collapsed;
            WorkPage.ViewAllLogs.Visibility = Visibility.Collapsed;
            for (int i = 0; i <= ViewsTabitem.Length - 1; i++)
            {
                ViewsTabitem[i].Visibility = Visibility.Visible;
            }
            WorkPage.tabControl.SelectedValue = ViewsTabitem[0];
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {

            var request = WorkerClass.LoginIn("Public_user", "123");
            if (request == "Done")
            {
                ViewTabItem(new TabItem[] { WorkPage.ViewAutoItem });
                WorkPage.Show();
                this.Close();
            }
            else MessageBox.Show(request);
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Window_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }
    }
}
