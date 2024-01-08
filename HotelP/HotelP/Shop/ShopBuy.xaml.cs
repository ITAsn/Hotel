using System;
using System.Collections.Generic;
using System.Linq;
using System.Resources;
using System.Text;
using System.Text.RegularExpressions;
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
using static System.Data.Entity.Infrastructure.Design.Executor;

using HotelP.Properties;

namespace HotelP.Shop
{
//Page to book hotel room. User need enter his phone and email.
    public partial class ShopBuy : Page
    {
        HotelBaseEntities db = new HotelBaseEntities();
        HotelRooms HotelRoom = null;
        public ShopBuy()
        {
            InitializeComponent();
            HotelRoom = db.HotelRooms.Find(App.HRoom.IDRoom);
           
            RoomNum.Content = Properties.Resources.ResourceManager.GetString("LabelRoomNumber") + HotelRoom.IDRoom.ToString();
            RoomCost.Content = Properties.Resources.ResourceManager.GetString("LabelCost") + HotelRoom.Cost.ToString();
            DataIn.DisplayDateStart = DateTime.Today;//Checking booked dates and blocking days
            DataOut.DisplayDateStart = DateTime.Today;
            String[] BookingNotTime = HotelRoom.TakedTimes.Split(';');
            for(int i = 0; i < BookingNotTime.Length; i++)
            {
                if (!String.IsNullOrEmpty(BookingNotTime[i]))
                {
                    DateTime myDate = DateTime.ParseExact(BookingNotTime[i], "dd.MM.yyyy", System.Globalization.CultureInfo.InvariantCulture);
                    DataIn.BlackoutDates.Add(new CalendarDateRange(myDate, myDate));
                    DataOut.BlackoutDates.Add(new CalendarDateRange(myDate, myDate));
                }
            }
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)//Booking
        {
            try
            {

            
            if(DataIn.SelectedDate==null|| DataOut.SelectedDate == null)
            {
                MessageBox.Show(Properties.Resources.ResourceManager.GetString("MessBChooseDate"), Properties.Resources.ResourceManager.GetString("MessBWarning") , MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {//Enter info to sql
                DateTime dateStart = DataIn.SelectedDate.Value.Date;
                DateTime dateEnd = DataOut.SelectedDate.Value.Date;
                HotelRoom.TakedTimes += dateStart.Date.ToString().Remove(10, 8) + ";";
                DateTime date = dateStart;
                Random rnd = new Random();
                int Num = rnd.Next(10, 100000000);
                bool can = false;
                while(!can)
                if (db.Bookings.Find(Num)==null)
                {
                    can = true;
                }
                else Num= rnd.Next(10, 10000000);
                String cod = rnd.Next(1000, 100000).ToString();
                while (date != dateEnd)
                {
                    HotelRoom.TakedTimes += date.Date.ToString().Remove(10,8) + ";";
                    date = date.AddDays(1);
                }
                HotelRoom.TakedTimes += dateEnd.Date.ToString().Remove(10, 8) + ";";
                
                Bookings bookings = new Bookings() 
                {
                    IDBooking=Num,
                    IDRoom=HotelRoom.IDRoom,
                    EmailOrPhone=PhoneText.Text+";"+EmailText.Text,
                    KeyRoom=cod,
                    BookingWhen=DateTime.Today,
                    BookingIn=dateStart,
                    BookingOut=dateEnd
                };
                db.Bookings.Add(bookings);
                db.SaveChanges();
                string lN = Properties.Resources.ResourceManager.GetString("LabelNomber");
                string lC = Properties.Resources.ResourceManager.GetString("LabelNomber");
                string lR = Properties.Resources.ResourceManager.GetString("LabelRemeber");
                
                MessageBox.Show(lN+Num+".\n"+lC+cod+lR);
                


                App.MainFrame.NavigationService.Navigate((new Uri("/Shop/Shop.xaml", UriKind.Relative)));
            }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)//Only numbers
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void DataIn_SelectedDateChanged(object sender, SelectionChangedEventArgs e)//Checking booked dates and blocking days again
        {
            try { 
            DataOut.SelectedDate = null;
            DataOut.DisplayDateStart = DataIn.SelectedDate;
            CalendarDateRange[] calendarDates = DataOut.BlackoutDates.ToArray();
            DateTime dateTime = DataIn.SelectedDate.Value.Date;
            for (int i = 0; i < calendarDates.Length; i++)
            {
                if (dateTime < calendarDates[i].Start) {
                    dateTime = calendarDates[i].Start;
                    break;
                }
            }
            DataOut.DisplayDateEnd = null;
            if(dateTime!= DataIn.SelectedDate.Value.Date)
            DataOut.DisplayDateEnd = dateTime;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
