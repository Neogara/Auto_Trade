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
            //   
            //    // Проверить логин и пас 
            //    // узнать админ ли это 
                WorkerClass.LoginIn(LoginText.Text, PasswordText.Password);

            //    //if (admin)
            //    //{
            ViewTabItem(new TabItem[] {
                     WorkPage.AddClientItem,
                     WorkPage.AddDeelsItem,
                     WorkPage.ViewAllDeelsItem,
                     WorkPage.ViewAllManagerItem,
                     WorkPage.ViewDeelsItem,
                     WorkPage.WorkWithManagerItem,
                     WorkPage.ViewAutoItem
                                        });
            //    WorkPage.Show();

            //    return;
            //}

            //if (manager)
            //{
            //ViewTabItem(new TabItem[]
            //{
            //    WorkPage.AddClientItem,
            //    WorkPage.AddDeelsItem,
            //    WorkPage.ViewDeelsItem,
            //    WorkPage.ViewAutoItem
            //});
            //WorkPage.Show();
            // return ; 
            //}

            MessageBox.Show("Не существующая связка логин-пароль");
        }

        private void ViewTabItem(TabItem[] ViewsTabitem)
        {
            //WorkPage.AddClientItem.Visibility = Visibility.Collapsed;
            //WorkPage.AddDeelsItem.Visibility = Visibility.Collapsed;
            //WorkPage.ViewAllDeelsItem.Visibility = Visibility.Collapsed;
            //WorkPage.ViewAllManagerItem.Visibility = Visibility.Collapsed;
            //WorkPage.ViewDeelsItem.Visibility = Visibility.Collapsed;
            //WorkPage.WorkWithManagerItem.Visibility = Visibility.Collapsed;
            //WorkPage.ViewAutoItem.Visibility = Visibility.Collapsed;

            //for (int i = 0; i <= ViewsTabitem.Length - 1; i++)
            //{
            //    ViewsTabitem[i].Visibility = Visibility.Visible;
            //}
            //WorkPage.tabControl.SelectedValue = ViewsTabitem[0];
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {

            ViewTabItem(new TabItem[] { WorkPage.ViewAutoItem });
            WorkPage.Show();
            this.Hide();

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
