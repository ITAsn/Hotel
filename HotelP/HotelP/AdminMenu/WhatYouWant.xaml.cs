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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace HotelP.AdminMenu
{
 //Admin menu for create rooms and watch booking.
    public partial class WhatYouWant : Page
    {
        public WhatYouWant()
        {
            InitializeComponent();
        }
        private void CreateButton(object sender, RoutedEventArgs e)
        {
            RoomCreater roomCreater = new RoomCreater();
            App.MainFrame.Navigate(roomCreater);
        }

        private void WatchBook(object sender, RoutedEventArgs e)
        {
            BookingShower bookingShower = new BookingShower();
            App.MainFrame.Navigate(bookingShower);
        }
    }
}
