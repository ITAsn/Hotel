using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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

namespace HotelP.Shop
{
//Page for watch information about hotel room
    public partial class ShopAbout : Page
    {
        HotelBaseEntities db = new HotelBaseEntities();
        HotelRooms company = new HotelRooms();
       
        public ShopAbout()
        {

            InitializeComponent();
            int IDRoom = App.IDRoom;
            company = db.HotelRooms.Find(IDRoom);//Take information from SQL
            try
            {
                if (company.ImageRoom != null)
                {
                    Im.Source = App.ByteToImage(company.ImageRoom);
                }
                IdB.Text = company.IDRoom.ToString();
                 CostName.Text = company.Cost.ToString();
                 Count.Text = company.RoomsCount.ToString();
                 Com.Text = company.Coments;
                  
            }
            catch
            {

            }
        }

        private void Button_Click(object sender, RoutedEventArgs e) //From ShopAbout to ShopBuy
        {
          
            App.HRoom = company;
            App.MainFrame.NavigationService.Navigate((new Uri("/Shop/ShopBuy.xaml", UriKind.Relative)));
        }
    }
}
