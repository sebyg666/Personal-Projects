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
using System.Xml;
using System.Xml.Serialization;

namespace InstaWarp2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public string currentPath;
        public string coreVersion;
        public bool firstRun = true;

        public MainWindow()
        {
            InitializeComponent();
            string version = Assembly.GetExecutingAssembly().GetName().Version.ToString();
            this.LauncherV.Text = "Launcher Version:\n" + version;

            GetCoreVersion();

            this.CoreV.Text = "Core:\n" + coreVersion;
            this.UpdateText.Text = "Connecting to server";
           
        }
        
        public string GetCoreVersion()
        {
            //currentPath = Directory.GetCurrentDirectory();
            //currentPath = System.IO.Path.Combine(Directory.GetCurrentDirectory(), "Core.dll");
            //if (File.Exists(currentPath))
            //{
            //    File.Delete(currentPath);
            //}
            string destFile = System.IO.Path.Combine(Directory.GetCurrentDirectory(), "Core.dll");
            if (File.Exists(destFile))
            {
                FileVersionInfo myFileVersionInfo = FileVersionInfo.GetVersionInfo(destFile);
                coreVersion = myFileVersionInfo.FileVersion;
                return coreVersion;
            }
            else
            {
                coreVersion = "0.0.0.0";
                return coreVersion;
            }
        }

        private void MainWindow_MouseDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            
                DoExeUpdate();
           
                
            
        }

        #region Updater

        /// <summary>
        /// Holds the program-to-update's info
        /// </summary>
        private Updatable applicationInfo;

        /// <summary>
        /// Thread to find core updates
        /// </summary>
        private BackgroundWorker bgWorker;

        /// <summary>
        /// Thread to find Exe update
        /// </summary>
        private BackgroundWorker bgWorker2;

        /// <summary>
        /// Checks for an update for the program passed.
        /// If there is an update, a dialog asking to download will appear
        /// </summary>
        public void DoCoreUpdate()
        {
            Debug.Write("\n| DoCoreUpdate |\n");
            Updatable applicationInfo = new Updatable();
            this.applicationInfo = applicationInfo;

            // Set up backgroundworker
            this.bgWorker = new BackgroundWorker();
            this.bgWorker.DoWork += new DoWorkEventHandler(bgWorker_DoWork);
            this.bgWorker.RunWorkerCompleted += new RunWorkerCompletedEventHandler(bgWorker_RunWorkerCompleted);

            if (!this.bgWorker.IsBusy)
                this.bgWorker.RunWorkerAsync(this.applicationInfo);
        }

        /// <summary>
        /// Checks for an update for the program passed.
        /// If there is an update, a dialog asking to download will appear
        /// </summary>
        public void DoExeUpdate()
        {
            Debug.Write("\n| DoExeUpdate |\n");
            Updatable applicationInfo = new Updatable();
            this.applicationInfo = applicationInfo;

            // Set up backgroundworker
            this.bgWorker2 = new BackgroundWorker();
            this.bgWorker2.DoWork += new DoWorkEventHandler(bgWorker2_DoWork);
            this.bgWorker2.RunWorkerCompleted += new RunWorkerCompletedEventHandler(bgWorker2_RunWorkerCompleted);

            if (!this.bgWorker2.IsBusy)
                this.bgWorker2.RunWorkerAsync(this.applicationInfo);
        }

        /// <summary>
        /// Checks for/parses update.xml on server
        /// </summary>
        private void bgWorker_DoWork(object sender, DoWorkEventArgs ee)
        {
            Updatable application = (Updatable)ee.Argument;

            // Check for update on server
            if (!Update.ExistsOnServer(application.CoreUpdateXmlLocation))
                ee.Cancel = true;
            else               // Parse update xml
            {
                Update.Parse(application.CoreUpdateXmlLocation);
                ee.Result = UpDateFile.Instance;
            }
        }

        /// <summary>
        /// Checks for/parses update.xml on server
        /// </summary>
        private void bgWorker2_DoWork(object sender, DoWorkEventArgs ee)
        {
            Updatable application = (Updatable)ee.Argument;

            // Check for update on server
            if (!Update.ExistsOnServer(application.ExeUpdateXmlLocation))
                ee.Cancel = true;
            else               // Parse update xml
            {
                Update.Parse(application.ExeUpdateXmlLocation);
                ee.Result = UpDateFile.Instance;
            }
        }

        /// <summary>
        /// After the background worker is done, prompt to update if there is one
        /// </summary>
        private void bgWorker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs ee)
        {
            // If there is a file on the server
            if (!ee.Cancelled)
            {
                checkFiles();
            }
        }

        /// <summary>
        /// After the background worker is done, prompt to update if there is one
        /// </summary>
        private void bgWorker2_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs ee)
        {
            // If there is a file on the server
            if (!ee.Cancelled)
            {
                checkFiles();
            }
        }

        public async Task checkFiles()
        {
            for (int i = 0; i < UpDateFile.Instance.File.files.Count; i++)
            {
                Uri location = null;
                var file = UpDateFile.Instance.File.files[i];

                fileName = file.Name;

                if (file.Type == "dll")
                {
                    if (Update.IsNewerThan(GetDllVersion(file.Name), file.Version))
                    {
                        string uri = UpDateFile.Instance.GetUrl() + file.Name;
                        location = new Uri(uri);
                    }
                    else
                        continue;
                        
                }
                else if (file.Type == "xml")
                {
                    if (Update.IsNewerThan(GetXmlVersion(file.Name), file.Version))
                    {
                        string uri = UpDateFile.Instance.GetUrl() + file.Name;
                        location = new Uri(uri);
                        fileName = file.Name;
                    }
                    else
                        continue;
                }
                else if (file.Type == "txt")
                {
                    if (Update.IsNewerThan(GetTxtVersion(file.Name), file.Version))
                    {
                        string uri = UpDateFile.Instance.GetUrl() + file.Name;
                        location = new Uri(uri);
                        fileName = file.Name;
                    }
                    else
                        continue;
                }
                else if (file.Type == "exe")
                {
                    if (Update.IsNewerThan(GetExeVersion(file.Name), file.Version))
                    {
                        string uri = UpDateFile.Instance.GetUrl() + file.Name;
                        location = new Uri(uri);
                        fileName = file.Name;
                    }
                    else
                        continue;
                        
                }
                else
                    continue;

                tempFile = System.IO.Path.GetTempFileName();
                await DownloadUpdate(location, file.Name);
                //UpdateApplication(string tempFilePath, string currentPath, string fileN);
            }
            if (fileName != applicationInfo.ApplicationName + ".exe")
            {
               
                Dispatcher.BeginInvoke((Action)(() =>
                {
                    this.progressBar.IsIndeterminate = true;
                    this.UpdateText.Text = "Update Complete";
                }));
                loadCore();
            }
            if (firstRun == true)
                DoCoreUpdate();
            firstRun = false;
            
        }

        public async Task DownloadUpdate(Uri location, string name )
        {
            // In the Real World, we would actually do something...
            // For this example, we're just going to (asynchronously) wait 100ms.
            webClient = new WebClient();
            webClient.DownloadProgressChanged += new DownloadProgressChangedEventHandler(webClient_DownloadProgressChanged);
            webClient.DownloadFileCompleted += new AsyncCompletedEventHandler(webClient_DownloadFileCompleted);
            try
            {
                await webClient.DownloadFileTaskAsync(location, this.tempFile);
            }
            catch (Exception ex)
            {
                string strErrorMsg = "Something went wrong while updating " + name + "! Error was:\r\n\r\n" + ex.ToString();
                System.Windows.MessageBox.Show(strErrorMsg, "Error", MessageBoxButton.OK, MessageBoxImage.Asterisk);
            }
        }
        /// <summary>
        /// Hack to close program, delete original, move the new one to that location
        /// </summary>
        /// <param name="tempFilePath">The temporary file's path</param>
        /// <param name="currentPath">The path of the current application</param>
        /// <param name="newPath">The new path for the new file</param>
        /// <param name="launchArgs">The launch arguments</param>
        public async Task UpdateApplication(string tempFilePath, string fileN)
        {
            Debug.Write("\n| UpdateApp " + fileN + " |\n");
            string directory = UpDateFile.Instance.GetDirectory(fileN);
            if (directory == "base")
                directory = System.IO.Path.Combine(Directory.GetCurrentDirectory(), fileN);
            else
                directory = System.IO.Path.Combine(Directory.GetCurrentDirectory(), directory, fileN);

            if (UpDateFile.Instance.GetDirectory(fileN) != "base")
            {
                try
                {
                    string subPath = System.IO.Path.Combine(Directory.GetCurrentDirectory(), UpDateFile.Instance.GetDirectory(fileN));
                    bool IsExists = System.IO.Directory.Exists(subPath);
                    if (!IsExists)
                        System.IO.Directory.CreateDirectory(subPath);
                }
                catch (Exception ex)
                {
                    string strErrorMsg = "Could not delete " + fileName + "! Error was:\r\n\r\n" + ex.ToString();
                    System.Windows.MessageBox.Show(strErrorMsg, "Error", MessageBoxButton.OK, MessageBoxImage.Asterisk);
                }
                
            }
            Updatable applicationInfo = new Updatable();
            this.applicationInfo = applicationInfo;
            string appName = Assembly.GetExecutingAssembly().GetName().Name;
            if (appName == applicationInfo.ApplicationName && fileN == appName + ".exe")
            {
                 try
                {
                    string argument = "/C choice /C Y /N /D Y /T 3 & Del /F /Q \"{0}\" & choice /C Y /N /D Y /T 1 & Move /Y \"{1}\" \"{2}\" & Start \"\" /D \"{3}\" \"{4}\" ";

                    ProcessStartInfo Info = new ProcessStartInfo();
                    Info.Arguments = String.Format(argument, directory, TempFilePath, directory, System.IO.Path.GetDirectoryName(directory), System.IO.Path.GetFileName(directory));
                    Info.WindowStyle = ProcessWindowStyle.Hidden;
                    Info.CreateNoWindow = true;
                    Info.FileName = "cmd.exe";
                    Process.Start(Info);
                    Dispatcher.BeginInvoke((Action)(() =>
                    {
                        this.Close();
                    }));
                }
                 catch (Exception ex)
                 {
                     string strErrorMsg = "Could not delete " + fileName + "! Error was:\r\n\r\n" + ex.ToString();
                     System.Windows.MessageBox.Show(strErrorMsg, "Error", MessageBoxButton.OK, MessageBoxImage.Asterisk);
                 }

            }
            else
            {
                try
                {
                    System.IO.File.Copy(tempFilePath, directory, true);
                }
                catch (Exception ex)
                {
                    string strErrorMsg = "Could not delete " + fileName + "! Error was:\r\n\r\n" + ex.ToString();
                    System.Windows.MessageBox.Show(strErrorMsg, "Error", MessageBoxButton.OK, MessageBoxImage.Asterisk);
                }
            }
        }

        public async Task Wait(int i)
        {
            await Task.Delay(i);
        }

        public async Task loadCore()
        {
            var destFile = System.IO.Path.Combine(Directory.GetCurrentDirectory(), "Core.dll");
            await Wait(1000);
            this.UpdateText.Text = "Loading InstaWarp";
            await CreateCore(destFile);
            await Wait(3000);
            this.Close();
        }

        public async Task CreateCore(string destFile)
        {
            Assembly assembly;
            assembly = Assembly.LoadFrom(destFile);
            Type t = assembly.GetType("Core.CoreWindow");
            var o = Activator.CreateInstance(t);
        }

        #endregion

        #region GetFileVersions
        public string GetDllVersion(string fileName)
        {
            string directory = UpDateFile.Instance.GetDirectory(fileName);
            if (directory == "base")
                directory = System.IO.Path.Combine(Directory.GetCurrentDirectory(), fileName);
            else
                directory = System.IO.Path.Combine(Directory.GetCurrentDirectory() + directory, fileName);

            string dllVersion;
            if (File.Exists(directory))
            {
                FileVersionInfo myFileVersionInfo = FileVersionInfo.GetVersionInfo(directory);
                dllVersion = myFileVersionInfo.FileVersion;
                return dllVersion;
            }
            else
            {
                dllVersion = "0.0.0.0";
                return dllVersion;
            }
        }

        public string GetXmlVersion(string fileName)
        {
            string directory = UpDateFile.Instance.GetDirectory(fileName);
            if (directory == "base")
                directory = System.IO.Path.Combine(Directory.GetCurrentDirectory(), fileName);
            else
                directory = System.IO.Path.Combine(Directory.GetCurrentDirectory() + directory, fileName);
            string XmlVersion;
            if (File.Exists(directory))
            {
                XmlDocument doc = new XmlDocument();
                doc.Load(directory);

                XmlNode VersionNode = doc.DocumentElement.SelectSingleNode("//FileVersion[@fileName='" + fileName + "']");

                if (VersionNode == null)
                {
                    XmlVersion = "0.0.0.0";
                    return XmlVersion;
                }
                    

                XmlVersion = VersionNode["Version"].InnerText;
                return XmlVersion;
            }
            else
            {
                XmlVersion = "0.0.0.0";
                return XmlVersion;
            }
        }

        public string GetTxtVersion(string fileName)
        {
            string directory = UpDateFile.Instance.GetDirectory(fileName);
            if (directory == "base")
                directory = System.IO.Path.Combine(Directory.GetCurrentDirectory(), fileName);
            else
                directory = System.IO.Path.Combine(Directory.GetCurrentDirectory() + directory, fileName);
            string TxtVersion;
            if (File.Exists(directory))
            {
                var lines = File.ReadAllLines(directory);
                if (lines[0].Contains("version"))
                {
                    string[] splitString = lines[0].Split('=');
                    TxtVersion = splitString[1];
                    return TxtVersion;
                }
                TxtVersion = "0.0.0.0";
                return TxtVersion;
            }
            else
            {
                TxtVersion = "0.0.0.0";
                return TxtVersion;
            }
        }

        public string GetExeVersion(string fileName)
        {
            string directory = UpDateFile.Instance.GetDirectory(fileName);
            if(directory == "base")
                directory = System.IO.Path.Combine(Directory.GetCurrentDirectory(), fileName);
            else
                directory = System.IO.Path.Combine(Directory.GetCurrentDirectory() + directory, fileName);

            string ExeVersion;
            if (File.Exists(directory))
            {
                ExeVersion = Assembly.GetExecutingAssembly().GetName().Version.ToString();
                return ExeVersion;
            }
            else
            {
                ExeVersion = "0.0.0.0";
                return ExeVersion;
            }
        }

        #endregion

        #region Update Download

        /// <summary>
        /// The web client to download the update
        /// </summary>
        private WebClient webClient;

        /// <summary>
        /// A temp file name to download to
        /// </summary>
        private string tempFile;

        /// <summary>
        /// Gets the temp file path for the downloaded file
        /// </summary>
        /// 
        internal string TempFilePath
        {
            get { return this.tempFile; }
        }

        private string fileName = "";
        /// <summary>
        /// Creates a new SharpUpdateDownloadForm
        /// </summary>

        /// <summary>
        /// Downloads file from server
        /// </summary>
        private void webClient_DownloadProgressChanged(object sender, DownloadProgressChangedEventArgs e)
        {
            // Update progressbar on download
           Dispatcher.BeginInvoke((Action)(() =>
            {
                this.UpdateText.Text = String.Format("Downloading {0}: {1} / {2}", fileName, FormatBytes(e.BytesReceived, 1, true), FormatBytes(e.TotalBytesToReceive, 1, true));
                this.progressBar.Value = e.ProgressPercentage;  
            }));
                
                
        }

        private void webClient_DownloadFileCompleted(object sender, AsyncCompletedEventArgs e)
        {
                // set the progressbar to marquee
            DoUpdateApplication(TempFilePath,fileName);
        }

        public async Task DoUpdateApplication(string TempFilePath, string fileName) 
        {
            await UpdateApplication(TempFilePath, fileName);
        }

        #endregion

        #region byte conversion
        /// <summary>
        /// Formats the byte count to closest byte type
        /// </summary>
        /// <param name="bytes">The amount of bytes</param>
        /// <param name="decimalPlaces">How many decimal places to show</param>
        /// <param name="showByteType">Add the byte type on the end of the string</param>
        /// <returns>The bytes formatted as specified</returns>
        private string FormatBytes(long bytes, int decimalPlaces, bool showByteType)
        {
            double newBytes = bytes;
            string formatString = "{0";
            string byteType = "B";

            if (newBytes < 1024)
            {
                // Check if best size in B
                byteType = "B";
            }
            // Check if best size in KB
            else if (newBytes > 1024 && newBytes < 1048576)
            {
                // Check if best size in KB
                newBytes /= 1024;
                byteType = "KB";
            }
            else if (newBytes > 1048576 && newBytes < 1073741824)
            {
                // Check if best size in MB
                newBytes /= 1048576;
                byteType = "MB";
            }
            else
            {
                // Best size in GB
                newBytes /= 1073741824;
                byteType = "GB";
            }

            // Show decimals
            if (decimalPlaces > 0)
                formatString += ":0.";

            // Add decimals
            for (int i = 0; i < decimalPlaces; i++)
                formatString += "0";

            // Close placeholder
            formatString += "}";

            // Add byte type
            if (showByteType)
                formatString += byteType;

            return String.Format(formatString, newBytes);
        }

        #endregion

    }
}
