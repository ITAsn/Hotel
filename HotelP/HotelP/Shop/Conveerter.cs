using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media.Imaging;
using System.Windows.Media;
using System.Windows.Data;
using System.Globalization;

namespace HotelP
{
    public class ByteArrayToBitmapImageConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
           
            var bitmapImage = new System.Windows.Media.Imaging.BitmapImage();
            
            var rawImageData = value as byte[];
           
            if (rawImageData == null)
            {
                bitmapImage.BeginInit();
                bitmapImage.UriSource = new Uri(@"/HotelP;component/Photo/Unknow.png", UriKind.Relative);
                bitmapImage.EndInit();
                return bitmapImage;
            }



            var stream = new MemoryStream(rawImageData);
            bitmapImage.BeginInit();
            bitmapImage.StreamSource = stream;
            bitmapImage.EndInit();
            return bitmapImage;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
