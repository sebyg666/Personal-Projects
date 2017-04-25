using System;
using System.Drawing;
using System.Reflection;
using System.Windows.Forms;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace InstaWarp2
{
    public class Updatable
    {
        /// <summary>
        /// The name of your application as you want it displayed on the update form
        /// </summary>
        public string ApplicationName
        {
            get { return "InstaWarp2"; }
        }
        /// <summary>
        /// An identifier string to use to identify your application in the update.xml
        /// Should be the same as your appId in the update.xml
        /// </summary>
        public string ApplicationID
        {
            get { return "InstaWarp2"; }
        }
        /// <summary>
        /// The current assembly
        /// </summary>
        public Assembly ApplicationAssembly
        {
            get { return Assembly.GetExecutingAssembly(); }
        }
        /// <summary>
        /// The application's icon to be displayed in the top left
        /// </summary>
        public Uri UpdateXmlLocation 
        { 
            get 
            {
                return new Uri("https://dl.dropboxusercontent.com/u/12827052/Instawarp%20Updater%20Folder/update.xml"); 
            } 
        }
    }
}
