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

namespace HotelP.Checker
{
   //Page show information about order
    public partial class Shower : Page
    {

        String CodeText = null;
        int NomberText = 0;
        HotelBaseEntities db = new HotelBaseEntities();
        public Shower()
        {
            InitializeComponent();
            try
            {
                CodeText = App.Cod;
                NomberText = App.Nom;
                Bookings company = db.Bookings.Find(NomberText);
                if (company != null)
                {
                    if (company.HotelRooms.ImageRoom != null)
                    {
                        Im.Source = App.ByteToImage(company.HotelRooms.ImageRoom);
                    }
                    String[] EmailPhone = company.EmailOrPhone.ToString().Split(';');
                    IdB.Text = company.IDRoom.ToString();
                    CostName.Text = company.HotelRooms.Cost.ToString();
                    Count.Text = company.HotelRooms.RoomsCount.ToString();
                    NomText.Text = EmailPhone[0];
                    EmailText.Text = EmailPhone[1];
                    InWhen.Text = company.BookingIn.ToString();
                    OutWhen.Text = company.BookingOut.ToString();
                    Com.Text = company.HotelRooms.Coments;
                }
                    
            }                        
            catch
            {

            }
          
        }
    }
}
