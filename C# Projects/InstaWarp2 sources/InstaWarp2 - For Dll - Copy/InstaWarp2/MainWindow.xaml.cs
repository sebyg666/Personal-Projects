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
using System.Reflection;
using System.ComponentModel;
using System.Drawing;
using System.IO;
using System.Net;
using System.Diagnostics;
using System.Threading;
using Core;

namespace InstaWarp2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public string currentPath;
        public string coreVersion;

        public MainWindow()
        {
            InitializeComponent();
            CoreWindow coreW = new CoreWindow();           
        }
        

        private void MainWindow_MouseDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
