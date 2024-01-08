using HotelP.AdminMenu;
using HotelP.Checker;
using HotelP.Shop;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace HotelP
{
  //Global window for program
    public partial class MainWindow : Window
    {
        HotelBaseEntities db = new HotelBaseEntities();
        public MainWindow()
        {
            InitializeComponent();
            App.MainFrame = myFrame;//global frame
           
        }
       
        private void Button_Click(object sender, RoutedEventArgs e)//Button back
        {
           
            try
            {
                App.MainFrame.NavigationService.GoBack();
                
            }
            catch
            {
                MessageBox.Show(Properties.Resources.ResourceManager.GetString("MessageCB"));
            }
          
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)//To show shop
        {
            try
            {
   ShopMenu shop = new ShopMenu();
            App.MainFrame.NavigationService.Navigate(shop);

            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
         
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)//To find a order
        {
            try { 
            Finder finder = new Finder();
            App.MainFrame.NavigationService.Navigate(finder);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)// To watch about programm
        {
            try { 
            Default2 default2 = new Default2();
         
            App.MainFrame.NavigationService.Navigate(default2);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Button_Click_4(object sender, RoutedEventArgs e)//To watch admin menu
        {
            try
            {

                WhatYouWant youWant = new WhatYouWant();
                App.MainFrame.NavigationService.Navigate(youWant);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void CultureRU(object sender, RoutedEventArgs e)//Change language on rus
        {
            try { 
            System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("ru-RU");
            MainWindow mainWindow = new MainWindow();
            mainWindow.myFrame.Navigate(myFrame.NavigationService.Content);
            mainWindow.Show();

            Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void CultureEN(object sender, RoutedEventArgs e)//Change language on eng
        {
            try { 
            System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("");
          
            MainWindow mainWindow = new MainWindow();
            mainWindow.myFrame.Navigate(myFrame.NavigationService.Content);
            
            mainWindow.Show();
           
            Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
