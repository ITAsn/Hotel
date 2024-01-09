using HotelP.Checker;
using HotelP.Shop;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Imaging;



namespace HotelP
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : System.Windows.Application
    {
        public static Frame MainFrame;//Global frame for all classes
       public static ImageSource ByteToImage(byte[] imageData)// Conveter SQL Image to WPF image
        {
            var bitmap = new BitmapImage();
            MemoryStream ms = new MemoryStream(imageData);
            bitmap.BeginInit();
            bitmap.StreamSource = ms;
            bitmap.EndInit();

            return (ImageSource)bitmap;
        }
        public static int IDRoom; //IDRoom for ShopAbout page
        public static HotelRooms HRoom;//Hotel Room for ShopBuy page
        public static String Cod;//Order's key
        public static int Nom;//Order's nomber
        App()
        {
            System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("en-EN");
        }
    }
}
