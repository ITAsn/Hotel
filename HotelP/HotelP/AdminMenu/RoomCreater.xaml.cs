﻿using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
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
    /// <summary>
    /// Логика взаимодействия для RoomCreater.xaml
    /// </summary>
    public partial class RoomCreater : Page
    {
        HotelBaseEntities bd = new HotelBaseEntities();
        int idR = 0;
        public RoomCreater()
        {
            InitializeComponent();
            Random rnd = new Random();
            idR = rnd.Next(0, 100000);
            IdB.Text = idR.ToString();
            ComboLocation.Items.Add("Выбрать");
            ComboLocation.SelectedIndex = 0;
            DataGrid hotels=new DataGrid();
            hotels.ItemsSource=bd.Hotels.ToList();
            for(int i = 0; i <=hotels.Items.Count - 1; i++)
            {
                Hotels hotels1 = hotels.Items[i] as Hotels;
                if (hotels1 != null)
                {
               
                ComboLocation.Items.Add(hotels1.Location);
                }
                
            }
        }
        byte[] image_bytes=null;
        private void LoadImage(object sender, RoutedEventArgs e)//Load image for room
        {
            OpenFileDialog op = new OpenFileDialog();
            op.Title = "Select a picture";
            op.Filter = "All supported graphics|*.jpg;*.jpeg;*.png|" +
              "JPEG (*.jpg;*.jpeg)|*.jpg;*.jpeg|" +
              "Portable Network Graphic (*.png)|*.png";
            if (op.ShowDialog() == true)
            {
                image_bytes = File.ReadAllBytes(op.FileName);
                Im.Source = new BitmapImage(new Uri(op.FileName));
            }
        }

        private void CreateRoom(object sender, RoutedEventArgs e)
        {
            if (!String.IsNullOrWhiteSpace(CostName.Text)&&!String.IsNullOrWhiteSpace(Count.Text)&& !String.IsNullOrWhiteSpace(Count.Text) &&ComboLocation.SelectedIndex!=0 && !String.IsNullOrWhiteSpace(Com.Text))
            {
                try
                {
                    Random rnd = new Random();

                    bool ok = false;
                    if (bd.HotelRooms.Find(idR) != null)
                        while (ok)
                        {
                            idR = rnd.Next(0, 100000);
                            IdB.Text = idR.ToString();
                        }
                    HotelRooms hotelRooms = new HotelRooms()
                    {
                        IDRoom = idR,
                        IDHotel = ComboLocation.SelectedIndex - 1,
                        Cost = Convert.ToInt32(CostName.Text),
                        Coments = Com.Text,
                        RoomsCount = Convert.ToInt32(Count.Text),
                        TakedTimes = DateTime.Today.Date.ToString(),
                        ImageRoom = image_bytes
                    };
                    bd.HotelRooms.Add(hotelRooms);
                    bd.SaveChanges();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            
        }
    }
}
