using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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

namespace HotelP.Shop
{
//Hotels room shower. 
    public partial class ShopMenu : Page
    {
        HotelBaseEntities db = new HotelBaseEntities();
        List<HotelRooms> ar;
        public ShopMenu()
        {
            InitializeComponent();
            CountCombo.Items.Add("Выбрать");
            CountCombo.Items.Add(1);
            CountCombo.Items.Add(2);
            CountCombo.Items.Add(3);
            CountCombo.Items.Add(4);
            ar = db.HotelRooms.ToList();

            CountCombo.SelectedIndex = 0;
            
           
            //for(int i=0;i<ar.Count;i++)
            //    listView.Items.Add(ar[i]);
           
        }

     

        private void ListBoxItem_MouseDoubleClick(object sender, MouseButtonEventArgs e)//From ShopMenu to ShopAbout
        {
            try { 
            ListBoxItem listBox = (ListBoxItem)sender;
            StackPanel stackPanel =(StackPanel) listBox.Content;
            int co = 0;
            foreach(var a in stackPanel.Children)
            {
                if (co == 1)
                {
                    int co1 = 0;
                    StackPanel stackPanel1 = (StackPanel)a;
                    foreach (var a1 in stackPanel1.Children)
                    {
                        if (co1 == 1)
                        {
                            TextBlock textBlock = (TextBlock)a1;
                            App.IDRoom = Convert.ToInt32(textBlock.Text);



                            App.MainFrame.NavigationService.Navigate((new Uri("/Shop/ShopAbout.xaml", UriKind.Relative)));
                        }
                        co1++;
                    }
                }
                co++;
            }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        int cou = 0;
        void CheckPass()//If the filter values change, the list is updated
        {
            try { 
            if (listView!=null)
            {
                int c1=1;
                bool c11 = !String.IsNullOrWhiteSpace(CountCombo.Text);
                int c2=99999999;
                string city="";
                
                if (!String.IsNullOrWhiteSpace(Cost1.Text)&&Cost1.Text!="0")
                {
                    c1 = Convert.ToInt32(Cost1.Text);
                }
                if (!String.IsNullOrWhiteSpace(Cost2.Text) && Cost2.Text != "0")
                {
                    c2 = Convert.ToInt32(Cost2.Text);
                }
                if (!String.IsNullOrWhiteSpace(City.Text))
                {
                   city =City.Text;
                }
                
                listView.Items.Clear();

                if (cou!=0)
                    for (int i = 0; i < ar.Count; i++)
                        if (ar[i].RoomsCount == cou && ar[i].Cost <= c2 && ar[i].Cost >= c1 && ar[i].Hotels.Location.Contains(city))
                            listView.Items.Add(ar[i]);
                        else
                        {

                        }
                else
                {
                    for (int i = 0; i < ar.Count; i++)
                        if (ar[i].Cost <= c2 && ar[i].Cost >= c1 && ar[i].Hotels.Location.Contains(city))

                            listView.Items.Add(ar[i]);
                        else
                        {

                        }
                }






                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void CountCombo_SelectionChanged(object sender, SelectionChangedEventArgs e)

        {
            try
            {
                cou = (int)e.AddedItems[0];
            }
            catch
            {
                cou = 0;
            }
            
            CheckPass();
        }

        private void Cost1_TextChanged(object sender, TextChangedEventArgs e)
        {
            CheckPass();
        }
        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void City_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            CheckPass();
        }
    }
}
