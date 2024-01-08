using System;
using System.Collections.Generic;
using System.Linq;
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

namespace HotelP.Checker
{
    //The page for finding the order
    public partial class Finder : Page
    {
        public Finder()
        {
            InitializeComponent();
        }
        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }
        private void Button_Click(object sender, RoutedEventArgs e)//After entering the information, go to the order search
        {
            try
            {
                
              
                App.Cod = CodeText.Text;
                App.Nom = Convert.ToInt32(NomberText.Text);
                App.MainFrame.NavigationService.Navigate((new Uri("/Checker/Shower.xaml", UriKind.Relative)));

            }
            catch
            {

            }
          
        }
    }
}
