namespace Core
{

    #region "== using Classes"
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.IO;
    using System.Diagnostics;
    using System.Threading;
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
    using System.Windows.Forms;
    using System.Drawing;
    using System.Drawing.Design;
    using Classes;
    using Classes.Player;
    using Delay;
    using System.Xml;
    using System.Xml.Serialization;
    using System.Windows.Interop;
    using FFACETools;

    #endregion

    #region Template parts
    [TemplatePart(Name = "PART_zoneIDLabel", Type = typeof(System.Windows.Controls.Label))]
    [TemplatePart(Name = "PART_zoneNameLabel", Type = typeof(System.Windows.Controls.Label))]
    [TemplatePart(Name = "PART_WPViewer", Type = typeof(System.Windows.Controls.ListBox))]
    [TemplatePart(Name = "PART_btDelete", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_CurLocTextBox", Type = typeof(System.Windows.Controls.TextBox))]
    [TemplatePart(Name = "PART_btCreateCurLoc", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_ManLocTextBox", Type = typeof(System.Windows.Controls.TextBox))]
    [TemplatePart(Name = "PART_ManualCo_Ordinates_x", Type = typeof(System.Windows.Controls.TextBox))]
    [TemplatePart(Name = "PART_ManualCo_Ordinates_y", Type = typeof(System.Windows.Controls.TextBox))]
    [TemplatePart(Name = "PART_ManualCo_Ordinates_z", Type = typeof(System.Windows.Controls.TextBox))]
    [TemplatePart(Name = "PART_btCreateManLoc", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_mainTab", Type = typeof(System.Windows.Controls.TabControl))]
    [TemplatePart(Name = "PART_warpMulty", Type = typeof(System.Windows.Controls.MenuItem))]
    [TemplatePart(Name = "PART_CurLocStack", Type = typeof(System.Windows.Controls.Border))]
    [TemplatePart(Name = "PART_ManLocStack", Type = typeof(System.Windows.Controls.Border))]
    [TemplatePart(Name = "PART_Expander0", Type = typeof(System.Windows.Controls.Expander))]
    [TemplatePart(Name = "PART_Expander1", Type = typeof(System.Windows.Controls.Expander))]
    [TemplatePart(Name = "PART_Expander2", Type = typeof(System.Windows.Controls.Expander))]
    [TemplatePart(Name = "PART_Expander3", Type = typeof(System.Windows.Controls.Expander))]
    [TemplatePart(Name = "PART_Expander4", Type = typeof(System.Windows.Controls.Expander))]
    [TemplatePart(Name = "PART_MaintStatus", Type = typeof(System.Windows.Controls.MenuItem))]
    [TemplatePart(Name = "PART_GMFlag", Type = typeof(System.Windows.Controls.MenuItem))]
    [TemplatePart(Name = "PART_JAWait0", Type = typeof(System.Windows.Controls.MenuItem))]
    [TemplatePart(Name = "PART_UseExclusions", Type = typeof(System.Windows.Controls.MenuItem))]
    [TemplatePart(Name = "PART_TopMost", Type = typeof(System.Windows.Controls.MenuItem))]
    [TemplatePart(Name = "PART_chkBoxEnableSpeed", Type = typeof(System.Windows.Controls.CheckBox))]
    [TemplatePart(Name = "PART_CurrentSpeedSlider", Type = typeof(System.Windows.Controls.Slider))]
    [TemplatePart(Name = "PART_lbCurrentSpeed", Type = typeof(System.Windows.Controls.Label))]
    [TemplatePart(Name = "PART_DisabledSpeedSlider", Type = typeof(System.Windows.Controls.Slider))]
    [TemplatePart(Name = "PART_AutoDisableSpeedHack", Type = typeof(System.Windows.Controls.CheckBox))]
    [TemplatePart(Name = "PART_lbDisabledSpeed", Type = typeof(System.Windows.Controls.Label))]
    [TemplatePart(Name = "PART_btNW", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_btN", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_btNE", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_btUP", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_btW", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_btE", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_btDN", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_btSW", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_btS", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_btSE", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_LockZCoord", Type = typeof(System.Windows.Controls.CheckBox))]
    [TemplatePart(Name = "PART_AutoDisablePosiHack", Type = typeof(System.Windows.Controls.CheckBox))]
    [TemplatePart(Name = "PART_DetectStatus", Type = typeof(System.Windows.Controls.Label))]

    #endregion

    /// <summary>
    /// Interaction logic for CoreWindow.xaml
    /// </summary>
    public partial class CoreWindow : Window
    {
        #region Private Parts

        public System.Windows.Controls.Label part_zoneIDLabel;
        public System.Windows.Controls.Label part_zoneNameLabel;
        public System.Windows.Controls.ListBox part_WPViewer;
        public System.Windows.Controls.Button part_btDelete;
        public System.Windows.Controls.TextBox part_CurLocTextBox;
        public System.Windows.Controls.Button part_btCreateCurLoc;
        public System.Windows.Controls.TextBox part_ManLocTextBox;
        public System.Windows.Controls.TextBox part_ManualCo_Ordinates_x;
        public System.Windows.Controls.TextBox part_ManualCo_Ordinates_y;
        public System.Windows.Controls.TextBox part_ManualCo_Ordinates_z;
        public System.Windows.Controls.Button part_btCreateManLoc;
        public System.Windows.Controls.TabControl part_mainTab;
        public System.Windows.Controls.MenuItem part_warpMulty;
        public System.Windows.Controls.Border part_CurLocStack;
        public System.Windows.Controls.Border part_ManLocStack;
        public System.Windows.Controls.Expander part_Expander0;
        public System.Windows.Controls.Expander part_Expander1;
        public System.Windows.Controls.Expander part_Expander2;
        public System.Windows.Controls.Expander part_Expander3;
        public System.Windows.Controls.Expander part_Expander4;
        public System.Windows.Controls.MenuItem part_MaintStatus;
        public System.Windows.Controls.MenuItem part_GMFlag;
        public System.Windows.Controls.MenuItem part_JAWait0;
        public System.Windows.Controls.MenuItem part_UseExclusions;
        public System.Windows.Controls.MenuItem part_TopMost;
        public System.Windows.Controls.CheckBox part_chkBoxEnableSpeed;
        public System.Windows.Controls.Slider part_CurrentSpeedSlider;
        public System.Windows.Controls.Label part_lbCurrentSpeed;
        public System.Windows.Controls.Slider part_DisabledSpeedSlider;
        public System.Windows.Controls.CheckBox part_AutoDisableSpeedHack;
        public System.Windows.Controls.Label part_lbDisabledSpeed;
        public System.Windows.Controls.Button part_btNW;
        public System.Windows.Controls.Button part_btN;
        public System.Windows.Controls.Button part_btNE;
        public System.Windows.Controls.Button part_btUP;
        public System.Windows.Controls.Button part_btW;
        public System.Windows.Controls.Button part_btE;
        public System.Windows.Controls.Button part_btDN;
        public System.Windows.Controls.Button part_btSW;
        public System.Windows.Controls.Button part_btS;
        public System.Windows.Controls.Button part_btSE;
        public System.Windows.Controls.CheckBox part_LockZCoord;
        public System.Windows.Controls.CheckBox part_AutoDisablePosiHack;
        public System.Windows.Controls.Label part_DetectStatus;

        #endregion

        public List<int> zIDList = new List<int>();
        public List<Process> engagedProcess = new List<Process>();

        public CoreWindow()
        {
            InitializeComponent();
            firstRun = true;
            this.Show();

            Execute.InitializeWithDispatcher();
            MinimizeToTray.Enable(this);
            this.m_ProcessList = new List<ProcessEntry>();

            try
            {
                // Attempt to deserialize configuration file..
                using (var reader = new StreamReader(System.AppDomain.CurrentDomain.BaseDirectory + "/Resources/Configuration.xml"))
                {
                    var serializer = new XmlSerializer(typeof(Configuration));
                    Globals.Instance.Config = (Configuration)serializer.Deserialize(reader);
                }
                using (var reader = new StreamReader(System.AppDomain.CurrentDomain.BaseDirectory + "/Resources/Settings.xml"))
                {
                    var serializer = new XmlSerializer(typeof(Core.Classes.Settings));
                    Globals.Instance.Stngs = (Core.Classes.Settings)serializer.Deserialize(reader);
                }

            }
            catch (Exception ex)
            {
                string strErrorMsg = "Configuration file is missing or invalid! Cannot start InstaWarp! Error was:\r\n\r\n" + ex.ToString();
                System.Windows.MessageBox.Show(strErrorMsg, "Error", MessageBoxButton.OK, MessageBoxImage.Asterisk);
                return;
            }
            Dispatcher.BeginInvoke((Action)(() =>
            {
                part_TopMost.IsChecked = Globals.Instance.Stngs.AlwaysOnTop;
                Globals.Instance.IsClosing = false;
                System.Windows.Application.Current.Exit += (sender, args) =>
                {
                    // Inform the application we are closing..
                    Globals.Instance.IsClosing = true;
                    for (int i = 0; i < playerList.Instance.m_PlayerList.Count; i++)
                    {
                        playerList.Instance.m_PlayerList[i].playerExit = true;
                        if (playerList.Instance.m_PlayerList[i].JAWait0Thread != null)
                        {
                            Debug.Write("| **********  closing JAWait0 thread " + Thread.CurrentThread.ManagedThreadId + " for " + playerList.Instance.m_PlayerList[i].Name + " ************* |");
                            playerList.Instance.m_PlayerList[i].UseJAWait0 = false;
                            playerList.Instance.m_PlayerList[i].JAWait0Thread.Join();
                        }
                    }
                    isClosing = true;
                };
            }));

            var scanThread = new Thread(() =>
            {
                Debug.Write("| **********  New getProcess() thread " + Thread.CurrentThread.ManagedThreadId + " ************* |");
                while (!isClosing)
                {
                    //Permanently loop to check for log in's and outs, crashes, quits etc while the app is running
                    Thread.Sleep(200);
                    getProcessList();
                }
            })
            {
                IsBackground = true
            };
            scanThread.Start();
        }

        #region "== Character Creation Thread"
        /// <summary>
        /// Create Character and a new thread for it to loop on
        /// </summary>
        /// <param name="process"></param>
        public void launchCharacterCreation(Process process, FFACE _FFace)
        {
            //Create new PointerFactory for this Character
            PointerFactory pointFactory = new PointerFactory();
            pointFactory.UpdateFactory(process.MainWindowTitle, process);
            //After Splash has been updated with loaded info, Close it

            Dispatcher.BeginInvoke((Action)(() =>
            {
                if (firstRun == true)
                {
                    firstRun = false;
                }
            }));
            //Create the actuall player and allocate its Globals, PointerFactory and the Player Name as backup 
            Player player = new Player();
            //FFACE _FFACE = new FFACE(process.Id);
            player.process = process;
            player.pointerFactory = pointFactory;
            player.BackupName = player.Name;
            playerList.Instance.m_PlayerList.Add(player);
            player.ZoneChanged += player_ZoneChanged;



            //Load per character settings if they exist
            #region "== Load per character files"

            if (File.Exists("Resources\\" + player.Name + ".xml"))
            {
                try
                {
                    string path3 = "Resources\\" + player.Name + ".xml";
                    Dispatcher.BeginInvoke((Action)(() =>
                    {
                        Save info = new Save();
                        XmlLoad<Save> loadXml = new XmlLoad<Save>();
                        info = loadXml.LoadData(path3);

                        player.UseExclusions = info.UseExclusions;

                        player.UseGMFlag = info.UseGMFlag;
                        if (player.UseGMFlag)
                        {
                            //PART_GMFlag_Checked(this, null);
                            var flagThread = new Thread(() =>
                            {
                                Debug.Write("| **********  New UseGMFlag thread " + Thread.CurrentThread.ManagedThreadId + " ************* |");
                                player.EnableFlagHack();
                            })
                            {
                                IsBackground = true
                            };
                            flagThread.Start();
                        }

                        player.UseJAWait0 = info.UseJAWait0;
                        if (player.UseJAWait0)
                        {
                            //PART_JAWait0_Checked(this, null);
                            player.JAWait0Thread = new Thread(() =>
                            {
                                Debug.Write("| **********  New JAWait0Hack thread " + Thread.CurrentThread.ManagedThreadId + " ************* |");
                                player.EnableJAWait0Hack();
                            })
                            {
                                IsBackground = true
                            };
                            player.JAWait0Thread.Start();
                        }
                        player.UseSpeedHack = info.UseSpeedHack;
                        if (player.UseSpeedHack)
                        {
                            //PART_chkBoxEnableSpeed_Checked(this, null);
                            var speedThread = new Thread(() =>
                            {
                                Debug.Write("| **********  New SpeedHack thread " + Thread.CurrentThread.ManagedThreadId + " ************* |");
                                player.EnableSpeedHack();
                            })
                            {
                                IsBackground = true
                            };
                            speedThread.Start();
                        }

                        player.AutoDisableSpeedHack = info.AutoDisableSpeedHack;

                        player.SpeedAmount = info.SpeedAmount;
                        player.SpeedAmountDisabled = info.SpeedAmountDisabled;
                    }));
                }
                catch (Exception ex)
                {
                    System.Windows.MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                }
            }
            #endregion

            var scanThread = new Thread(() =>
            {

                Debug.Write("| **********  new thread: " + process.MainWindowTitle + ", ID: " + Thread.CurrentThread.ManagedThreadId + " ************* |");
                while (_FFace.Player.GetLoginStatus == LoginStatus.Loading || _FFace.Player.GetLoginStatus == LoginStatus.LoggedIn)
                {
                    Thread.Sleep(100);
                    string slct = process.MainWindowTitle.ToString();
                    string[] splitString = slct.Split(' ');

                    // Break loop if process is missing or if the player has logged out, quit or crashed
                    if (process == null || process.HasExited || player.playerExit || _FFace.Player.GetLoginStatus == LoginStatus.CharacterLoginScreen)
                    {
                        break;
                    }

                    // Display player name the app is attached to and zone ID

                    Dispatcher.BeginInvoke((Action)(() =>
                    {
                        // Scan for detections..
                        player.ScanForPlayers();

                        //Find currently selected tab
                        if (mainTab_selection == process.MainWindowTitle.ToString())
                        {
                            //Update current zone ID for currently selected character
                            part_zoneIDLabel.Content = player.GetZoneId();

                            //Update the Current Speed Label for currently selected player
                            part_lbCurrentSpeed.Content = string.Format("{0} ({1}%)", player.Speed.ToString(), ((player.Speed * 100) / 4));

                            // Display detection status..
                            if (player.IsDetectingPlayer)
                            {
                                if (part_DetectStatus != null)
                                {
                                    part_DetectStatus.Foreground = System.Windows.Media.Brushes.Red;
                                    part_DetectStatus.Content = player.DetectedPlayerName;
                                }
                            }
                            else
                            {
                                if (part_DetectStatus != null)
                                {
                                    part_DetectStatus.Foreground = System.Windows.Media.Brushes.Lime;
                                    part_DetectStatus.Content = "Undetected";
                                }
                            }
                        }
                        if (part_mainTab.SelectedItem == null)
                        {
                            mainTab_selection = null;
                            this.PART_mainTab_SelectionChanged(this, null);
                        }
                    }));
                }
            });
            scanThread.Start();

        }

        #endregion

        void player_ZoneChanged(object sender, ZoneChangedEventArgs e)
        {
            UpdateViewer(e.Player, e.ZoneID);
            //this.PART_mainTab_SelectionChanged(this, null);
            //System.Windows.MessageBox.Show("ZoneChanged: " + e.ZoneID + " \nPlayer Name: " + e.PlayerName , "Error", MessageBoxButton.OK, MessageBoxImage.Asterisk);
        }

        #region "== Check process' for log in and out"

        /// <summary>
        /// Iterate through list to find if the process exists
        /// </summary>
        public bool isProcessEngaged(List<Process> l, Process p)
        {
            for (int i = 0; i < l.Count; i++)
            {
                if (l[i].Id == p.Id)
                {
                    return true;
                }
            }
            return false;
        }


        /// <summary>
        /// Iterate through list to find if the process exists
        /// </summary>
        public bool isCharacterCreated(List<Player> l, Process p)
        {
            for (int i = 0; i < l.Count; i++)
            {
                if (l[i].process.Id == p.Id)
                {
                    return true;
                }
            }
            return false;
        }

        /// <summary>
        /// Check all process' via the Windows title to see what stage of log in or out the window is at
        /// </summary>
        public void searchForLogin(Process process, FFACE _FFace)
        {
            try
            {
                //Use FFACE to get loggin status of process
                if (_FFace.Player.GetLoginStatus == LoginStatus.LoggedIn || _FFace.Player.GetLoginStatus == LoginStatus.Loading)
                {
                    if (part_mainTab != null && _FFace.Player.GetLoginStatus == LoginStatus.LoggedIn)
                    {
                        if (!isCharacterCreated(playerList.Instance.m_PlayerList, process) && isProcessEngaged(engagedProcess, process))
                        {
                            Debug.Write("\n------------ Mainwindow Title: " + process.MainWindowTitle + " ---------------\n");
                            //Engage the process, get the players name via the window's title and create a new tab with it
                            Dispatcher.BeginInvoke((Action)(() =>
                            {
                                TabItem tab = new TabItem();
                                part_mainTab.Items.Add(tab);
                                tab.Header = _FFace.Player.Name;
                            }));
                            //launch the character creation method
                            launchCharacterCreation(process, _FFace);
                        }
                    }
                }
                else
                {
                    //if game window is at login screen and a player was previously created on this process then delete the following
                    if (part_mainTab != null)
                    {
                        if (firstRun == true)
                        {
                            Execute.OnUIThread(() =>
                            {
                                firstRun = false;
                            });
                        }
                        if (engagedProcess.Count > 0 && playerList.Instance.m_PlayerList.Count == 0)
                        {
                            Execute.OnUIThread(() =>
                            {
                                part_zoneNameLabel.Content = "Log in Screen";
                                part_zoneIDLabel.Content = "X";
                                part_lbCurrentSpeed.Content = string.Format("{0} ({1}%)", 4, 100);
                            });

                        }
                        // This finds logging out to loggin screen and cleans the process
                        if (isProcessEngaged(engagedProcess, process) && isCharacterCreated(playerList.Instance.m_PlayerList, process) && _FFace.Player.GetLoginStatus == LoginStatus.CharacterLoginScreen)
                        {
                            CleanProcess(process, false);
                        }
                        // If we are at loggin screen and process is clean update status (if only 1 process running)
                        else if (isProcessEngaged(engagedProcess, process) && !isCharacterCreated(playerList.Instance.m_PlayerList, process) && _FFace.Player.GetLoginStatus == LoginStatus.CharacterLoginScreen)
                        {
                            if (engagedProcess.Count() == 1)
                            {
                                Dispatcher.BeginInvoke((Action)(() =>
                                {
                                    part_DetectStatus.Foreground = System.Windows.Media.Brushes.Blue;
                                    part_DetectStatus.Content = "Waiting for log in....";
                                }));
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show(ex.Message, "!Error", MessageBoxButton.OK, MessageBoxImage.Asterisk);
            }
        }

        public void CleanProcess(Process process, bool b)
        {
            //Check each process and tab to find out which process / player / tab logged out
            Dispatcher.BeginInvoke((Action)(() =>
            {
                GetChild getChild = new GetChild();
                foreach (var tb in getChild.FindVisualChildren<TabItem>(this))
                {
                    for (int i = 0; i < playerList.Instance.m_PlayerList.Count; i++)
                    {
                        if (playerList.Instance.m_PlayerList[i].process.Id == process.Id)
                        {
                            for (int j = 0; j < engagedProcess.Count; j++)
                            {
                                if (engagedProcess[j].Id == process.Id)
                                {
                                    if (tb.Header.ToString() == playerList.Instance.m_PlayerList[i].BackupName.ToString())
                                    {
                                        playerList.Instance.m_PlayerList[i].playerExit = true;
                                        //Cancel all running threads / hacks before deleting the player's entries
                                        playerList.Instance.m_PlayerList[i].UseGMFlag = false;
                                        if (playerList.Instance.m_PlayerList[i].JAWait0Thread != null)
                                        {
                                            playerList.Instance.m_PlayerList[i].UseJAWait0 = false;
                                            playerList.Instance.m_PlayerList[i].JAWait0Thread.Join();
                                        }
                                        playerList.Instance.m_PlayerList[i].UseSpeedHack = false;
                                        playerList.Instance.m_PlayerList[i].UseStatusHack = false;
                                        playerList.Instance.m_PlayerList[i].UseZCoordHack = false;
                                        playerList.Instance.m_PlayerList[i].UseExclusions = false;
                                        playerList.Instance.m_PlayerList[i].AutoDisableSpeedHack = false;
                                        playerList.Instance.m_PlayerList[i].SpeedAmount = 4;
                                        playerList.Instance.m_PlayerList[i].SpeedAmountDisabled = 4;

                                        //delete the players process from active list
                                        playerList.Instance.m_PlayerList.RemoveAt(i);

                                        if (playerList.Instance.m_PlayerList.Count == 0 && engagedProcess.Count > 0)
                                        {
                                            part_GMFlag.IsChecked = false;
                                            part_JAWait0.IsChecked = false;
                                            part_chkBoxEnableSpeed.IsChecked = false;
                                            part_CurrentSpeedSlider.Value = 1;
                                            part_DisabledSpeedSlider.Value = 1;
                                            part_AutoDisableSpeedHack.IsChecked = false;
                                            part_UseExclusions.IsChecked = false;
                                            part_zoneNameLabel.Content = "Log in Screen";
                                            part_zoneIDLabel.Content = "X";
                                            part_lbCurrentSpeed.Content = string.Format("{0} ({1}%)", 4, 100);
                                            part_WPViewer.ItemsSource = null;
                                        }

                                        //Delete the players Tab
                                        part_mainTab.Items.Remove(tb);
                                        if (b)
                                        {
                                            //remove player as an engaged process
                                            engagedProcess.RemoveAt(j);
                                        }
                                    }
                                    else if (tb.Header.ToString() == string.Empty || process.HasExited)
                                    {
                                        playerList.Instance.m_PlayerList[i].playerExit = true;
                                        //Cancel all running threads / hacks before deleting the player's entries
                                        playerList.Instance.m_PlayerList[i].UseGMFlag = false;
                                        if (playerList.Instance.m_PlayerList[i].JAWait0Thread != null)
                                        {
                                            playerList.Instance.m_PlayerList[i].UseJAWait0 = false;
                                            playerList.Instance.m_PlayerList[i].JAWait0Thread.Join();
                                        }
                                        playerList.Instance.m_PlayerList[i].UseSpeedHack = false;
                                        playerList.Instance.m_PlayerList[i].UseStatusHack = false;
                                        playerList.Instance.m_PlayerList[i].UseZCoordHack = false;
                                        playerList.Instance.m_PlayerList[i].UseExclusions = false;
                                        playerList.Instance.m_PlayerList[i].AutoDisableSpeedHack = false;
                                        playerList.Instance.m_PlayerList[i].SpeedAmount = 4;
                                        playerList.Instance.m_PlayerList[i].SpeedAmountDisabled = 4;

                                        //delete the players process from active list
                                        playerList.Instance.m_PlayerList.RemoveAt(i);

                                        if (playerList.Instance.m_PlayerList.Count == 0 && engagedProcess.Count > 0)
                                        {
                                            part_GMFlag.IsChecked = false;
                                            part_JAWait0.IsChecked = false;
                                            part_chkBoxEnableSpeed.IsChecked = false;
                                            part_CurrentSpeedSlider.Value = 1;
                                            part_DisabledSpeedSlider.Value = 1;
                                            part_AutoDisableSpeedHack.IsChecked = false;
                                            part_UseExclusions.IsChecked = false;
                                            part_zoneNameLabel.Content = "Log in Screen";
                                            part_zoneIDLabel.Content = "X";
                                            part_lbCurrentSpeed.Content = string.Format("{0} ({1}%)", 4, 100);
                                            part_WPViewer.ItemsSource = null;
                                        }

                                        //Delete the players Tab
                                        part_mainTab.Items.Remove(tb);
                                        if (b)
                                        {
                                            //remove player as an engaged process
                                            engagedProcess.RemoveAt(j);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }));
        }

        #endregion

        #region "== Main_tab is initialized check and alphabatise list content"
        private void PART_mainTab_Initialized(object sender, EventArgs e)
        {
            part_mainTab = GetTemplateChild("PART_mainTab") as System.Windows.Controls.TabControl;
        }

        private void part_WPViewer_CollectionChanged(object sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            if (e.Action == System.Collections.Specialized.NotifyCollectionChangedAction.Add)
            {
                //part_WPViewer.Items.SortDescriptions.Add(new System.ComponentModel.SortDescription("", System.ComponentModel.ListSortDirection.Ascending));
            }
        }
        #endregion

        #region "== Template Children Setters"

        public override void OnApplyTemplate()
        {
            base.OnApplyTemplate();
            //initialise all parts of the application
            part_zoneIDLabel = GetTemplateChild("PART_zoneIDLabel") as System.Windows.Controls.Label;
            part_zoneNameLabel = GetTemplateChild("PART_zoneNameLabel") as System.Windows.Controls.Label;
            part_WPViewer = GetTemplateChild("PART_WPViewer") as System.Windows.Controls.ListBox;
            part_btDelete = GetTemplateChild("PART_btDelete") as System.Windows.Controls.Button;
            part_CurLocTextBox = GetTemplateChild("PART_CurLocTextBox") as System.Windows.Controls.TextBox;
            part_btCreateCurLoc = GetTemplateChild("PART_btCreateCurLoc") as System.Windows.Controls.Button;
            part_ManLocTextBox = GetTemplateChild("PART_ManLocTextBox") as System.Windows.Controls.TextBox;
            part_ManualCo_Ordinates_x = GetTemplateChild("PART_ManualCo_Ordinates_x") as System.Windows.Controls.TextBox;
            part_ManualCo_Ordinates_y = GetTemplateChild("PART_ManualCo_Ordinates_y") as System.Windows.Controls.TextBox;
            part_ManualCo_Ordinates_z = GetTemplateChild("PART_ManualCo_Ordinates_z") as System.Windows.Controls.TextBox;
            part_btCreateManLoc = GetTemplateChild("PART_btCreateManLoc") as System.Windows.Controls.Button;
            part_warpMulty = GetTemplateChild("PART_warpMulty") as System.Windows.Controls.MenuItem;
            part_CurLocStack = GetTemplateChild("PART_CurLocStack") as System.Windows.Controls.Border;
            part_ManLocStack = GetTemplateChild("PART_ManLocStack") as System.Windows.Controls.Border;
            part_Expander0 = GetTemplateChild("PART_Expander0") as System.Windows.Controls.Expander;
            part_Expander1 = GetTemplateChild("PART_Expander1") as System.Windows.Controls.Expander;
            part_Expander2 = GetTemplateChild("PART_Expander2") as System.Windows.Controls.Expander;
            part_Expander3 = GetTemplateChild("PART_Expander3") as System.Windows.Controls.Expander;
            part_Expander4 = GetTemplateChild("PART_Expander4") as System.Windows.Controls.Expander;
            part_MaintStatus = GetTemplateChild("PART_MaintStatus") as System.Windows.Controls.MenuItem;
            part_GMFlag = GetTemplateChild("PART_GMFlag") as System.Windows.Controls.MenuItem;
            part_JAWait0 = GetTemplateChild("PART_JAWait0") as System.Windows.Controls.MenuItem;
            part_UseExclusions = GetTemplateChild("PART_UseExclusions") as System.Windows.Controls.MenuItem;
            part_TopMost = GetTemplateChild("PART_TopMost") as System.Windows.Controls.MenuItem;
            part_chkBoxEnableSpeed = GetTemplateChild("PART_chkBoxEnableSpeed") as System.Windows.Controls.CheckBox;
            part_CurrentSpeedSlider = GetTemplateChild("PART_CurrentSpeedSlider") as System.Windows.Controls.Slider;
            part_lbCurrentSpeed = GetTemplateChild("PART_lbCurrentSpeed") as System.Windows.Controls.Label;
            part_DisabledSpeedSlider = GetTemplateChild("PART_DisabledSpeedSlider") as System.Windows.Controls.Slider;
            part_AutoDisableSpeedHack = GetTemplateChild("PART_AutoDisableSpeedHack") as System.Windows.Controls.CheckBox;
            part_lbDisabledSpeed = GetTemplateChild("PART_lbDisabledSpeed") as System.Windows.Controls.Label;
            part_btNW = GetTemplateChild("PART_btNW") as System.Windows.Controls.Button;
            part_btN = GetTemplateChild("PART_btN") as System.Windows.Controls.Button;
            part_btNE = GetTemplateChild("PART_btNE") as System.Windows.Controls.Button;
            part_btUP = GetTemplateChild("PART_btUP") as System.Windows.Controls.Button;
            part_btW = GetTemplateChild("PART_btW") as System.Windows.Controls.Button;
            part_btE = GetTemplateChild("PART_btE") as System.Windows.Controls.Button;
            part_btDN = GetTemplateChild("PART_btDN") as System.Windows.Controls.Button;
            part_btSW = GetTemplateChild("PART_btSW") as System.Windows.Controls.Button;
            part_btS = GetTemplateChild("PART_btS") as System.Windows.Controls.Button;
            part_btSE = GetTemplateChild("PART_btSE") as System.Windows.Controls.Button;
            part_LockZCoord = GetTemplateChild("PART_LockZCoord") as System.Windows.Controls.CheckBox;
            part_AutoDisablePosiHack = GetTemplateChild("PART_AutoDisablePosiHack") as System.Windows.Controls.CheckBox;
            part_DetectStatus = GetTemplateChild("PART_DetectStatus") as System.Windows.Controls.Label;

            //Alphabetise all entries in the warp list
            ((System.Collections.Specialized.INotifyCollectionChanged)part_WPViewer.Items).CollectionChanged += part_WPViewer_CollectionChanged;
            part_WPViewer.Items.SortDescriptions.Add(new System.ComponentModel.SortDescription("", System.ComponentModel.ListSortDirection.Ascending));
        }

        #endregion

        #region "== Process scanning"
        /// <summary>
        /// Scans for processes
        /// </summary>

        private List<ProcessEntry> m_ProcessList;

        public bool firstRun { get; set; }
        public class ProcessEntry
        {
            /// <summary>
            /// Default Constructor
            /// </summary>
            /// <param name="p"></param>
            public ProcessEntry(Process p)
            {
                this.Process = p;
            }

            /// <summary>
            /// Gets or sets the process of this entry.
            /// </summary>
            public Process Process { get; set; }
        }

        /// <summary>
        /// Iterator that returns true or false if the process exists in the ProcessEntry list
        /// </summary>
        public bool isProcessInList(List<ProcessEntry> l, Process p)
        {
            for (int i = 0; i < l.Count; i++)
            {
                if (l[i].Process.Id == p.Id)
                {
                    return true;
                }
            }
            return false;
        }

        /// <summary>
        /// 1# Check for any running process,
        /// 2# if they exist, which state are they in (eg. pol viewer or login screen or fully logged in)
        /// </summary>
        public void getProcessList()
        {
            //Find all PlayOnline processes..
            var procs = (from p in Process.GetProcessesByName("pol")
                         select p);

            // If there are no processes running, close the splash and check if processes were previously engaged
            if (procs.Count() == 0)
            {
                // Iterate through any previously engaged processes and delete them
                if (this.m_ProcessList.Count > 0)
                {
                    for (int i = 0; i < this.m_ProcessList.Count; i++)
                    {
                        CleanProcess(this.m_ProcessList[i].Process, true);
                        this.m_ProcessList.RemoveAt(i);
                    }
                }

                //update spalsh and status label
                Dispatcher.BeginInvoke((Action)(() =>
                {
                    if (firstRun == true)
                    {
                        firstRun = false;
                    }
                    part_DetectStatus.Foreground = System.Windows.Media.Brushes.Blue;
                    part_DetectStatus.Content = "Waiting for FFXI instance....";
                }));
            }

            // Locate all valid processes..
            foreach (var p in procs)
            {
                try
                {
                    // Check if FFXiMain.dll is loaded..
                    if (!(from ProcessModule m in p.Modules
                          where m.ModuleName.ToLower() == "ffximain.dll"
                          select m).Any())
                    {
                        // If the process has been engaged but we are in pol viewer, the process needs to be cleaned
                        if (isProcessInList(this.m_ProcessList, p))
                        {
                            for (int i = 0; i < this.m_ProcessList.Count; i++)
                            {
                                if (p.Id == this.m_ProcessList[i].Process.Id)
                                {
                                    CleanProcess(this.m_ProcessList[i].Process, true);
                                    this.m_ProcessList.RemoveAt(i);
                                }
                            }
                        }
                        //update spalsh and status label
                        Dispatcher.BeginInvoke((Action)(() =>
                        {
                            if (firstRun == true)
                            {
                                firstRun = false;
                            }
                            if (this.m_ProcessList.Count == 0)
                            {
                                part_DetectStatus.Foreground = System.Windows.Media.Brushes.Blue;
                                part_DetectStatus.Content = "Waiting for FFXI instance....";
                            }
                        }));
                    }
                    // If FFXIMain.dll is not loaded then we are in pol viewer
                    else
                    {
                        //add process to list
                        if (!isProcessInList(this.m_ProcessList, p))
                        {
                            this.m_ProcessList.Add(new ProcessEntry(p));
                            engagedProcess.Add(p);
                        }
                        //Use iterator to check if process has been alocated to already.
                        if (procs.Count() != engagedProcess.Count)
                        {
                            foreach (Process process in engagedProcess)
                            {
                                if (process == null || process.HasExited)
                                {
                                    CleanProcess(process, true);
                                }
                            }
                        }
                        FFACE _FFace = new FFACE(p.Id);
                        searchForLogin(p, _FFace);
                    }
                }
                catch //(Exception ex)
                {
                    //System.Windows.MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                    for (int i = 0; i < this.m_ProcessList.Count; i++)
                    {
                        if (p.Id == this.m_ProcessList[i].Process.Id)
                        {
                            CleanProcess(this.m_ProcessList[i].Process, true);
                            this.m_ProcessList.RemoveAt(i);
                        }
                    }
                }
            }
            if (procs.Count() != engagedProcess.Count)
            {
                foreach (Process process in engagedProcess)
                {
                    if (process == null || process.HasExited)
                    {
                        CleanProcess(process, true);
                    }
                }
            }
        }


        #endregion

        #region "== buttom processing"
        /// <summary>
        /// Event of Contols processing
        /// </summary>
        /// 

        private void PART_Expander1_Expanded(object sender, RoutedEventArgs e)
        {
            part_btDelete.Visibility = Visibility.Visible;
        }

        private void PART_Expander2_Expanded(object sender, RoutedEventArgs e)
        {
            part_btDelete.Visibility = Visibility.Visible;
        }

        private void PART_Expander1_Collapsed(object sender, RoutedEventArgs e)
        {
            if (part_Expander2.IsExpanded == false)
                part_btDelete.Visibility = Visibility.Collapsed;
        }

        private void PART_Expander2_Collapsed(object sender, RoutedEventArgs e)
        {
            if (part_Expander1.IsExpanded == false)
                part_btDelete.Visibility = Visibility.Collapsed;
        }

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void CloseCommandHandler(object sender, ExecutedRoutedEventArgs e)
        {
            Globals.Instance.IsClosing = true;
            isClosing = true;
            this.Close();
        }

        private void closeMenuButton_Click(object sender, RoutedEventArgs e)
        {
            Globals.Instance.IsClosing = true;
            isClosing = true;
            this.Close();
        }
        private bool isClosing
        {
            get;
            set;
        }
        private void Minimize_button_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
            var settings = new Settings();
            settings.ShowDialog();
        }

        private void PART_TopMost_Checked(object sender, RoutedEventArgs e)
        {
            try
            {
                // Open configuration file for writing..
                using (var writer = new StreamWriter(System.AppDomain.CurrentDomain.BaseDirectory + "\\Resources\\Settings.xml"))
                {
                    // Attempt to save the configuration file..
                    var serializer = new XmlSerializer(typeof(Core.Classes.Settings));
                    if (Globals.Instance.Stngs.AlwaysOnTop == false)
                    {
                        Globals.Instance.Stngs.AlwaysOnTop = true;
                    }
                    serializer.Serialize(writer, Globals.Instance.Stngs);

                }
            }
            catch (Exception ex)
            {
                // Failed to save.. announce the error..
                System.Windows.MessageBox.Show(ex.ToString(), "Failed to save Settings file..", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }

        private void PART_TopMost_Unchecked(object sender, RoutedEventArgs e)
        {
            try
            {
                // Open configuration file for writing..
                using (var writer = new StreamWriter(System.AppDomain.CurrentDomain.BaseDirectory + "\\Resources\\Settings.xml"))
                {
                    // Attempt to save the configuration file..
                    var serializer = new XmlSerializer(typeof(Core.Classes.Settings));
                    if (Globals.Instance.Stngs.AlwaysOnTop == true)
                    {
                        Globals.Instance.Stngs.AlwaysOnTop = false;
                    }
                    serializer.Serialize(writer, Globals.Instance.Stngs);

                }
            }
            catch (Exception ex)
            {
                // Failed to save.. announce the error..
                System.Windows.MessageBox.Show(ex.ToString(), "Failed to save Settings file..", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            part_Expander0.IsExpanded = !part_Expander0.IsExpanded;
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            part_Expander1.IsExpanded = !part_Expander1.IsExpanded;
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            part_Expander2.IsExpanded = !part_Expander2.IsExpanded;
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            part_Expander3.IsExpanded = !part_Expander3.IsExpanded;
        }

        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            part_Expander4.IsExpanded = !part_Expander4.IsExpanded;
        }

        #endregion

        #region "== Main Tab Selection processing"

        public void UpdateViewer(Player player, short ZID)
        {
            GetChild getChild = new GetChild();
            foreach (var tab in getChild.FindVisualChildren<TabItem>(this))
            {
                if (part_mainTab.SelectedItem == tab)
                {
                    if (tab.Header.ToString() == player.BackupName)
                    {
                        //Create file paths to be read for currently selected character
                        string filename = ZID.ToString() + ".txt";
                        string path = System.AppDomain.CurrentDomain.BaseDirectory + @"\Zones\" + filename;
                        string path2 = System.AppDomain.CurrentDomain.BaseDirectory + @"\Zones\Zones.txt";

                        //Check and fill the warp display with saved Co-Ordinates for currently selected character in said Zone ID
                        if (File.Exists(path))
                        {
                            part_WPViewer.Items.Clear();
                            List<string> lines = File.ReadAllLines(path).ToList();
                            lines.Sort();
                            foreach (var line in lines)
                            {
                                part_WPViewer.Items.Add(new TextBlock() { Text = line, Margin = new Thickness(2), Width = part_WPViewer.Width});
                            }
                            //part_WPViewer.ItemsSource = File.ReadAllLines(path);
                        }
                        else
                        {
                            part_WPViewer.Items.Clear();
                        }

                        //Update current zone Name using the Zone ID for currently selected character
                        if (File.Exists(path2))
                        {
                            string[] readText = File.ReadAllLines(path2);
                            foreach (string s in readText)
                            {
                                string[] splitString1 = s.Split(',');
                                string[] splitAgain = splitString1[0].Split('=');

                                if (splitAgain[1] == ZID.ToString())
                                {
                                    string[] splitAgain1 = splitString1[1].Split('=');
                                    part_zoneNameLabel.Content = splitAgain1[1];
                                }
                                
                            }
                        }
                    }
                }
            }

        }
        /// <summary>
        /// tab switch event and processing
        /// </summary>
        /// 

        private void PART_mainTab_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            GetChild getChild = new GetChild();
            foreach (var tab in getChild.FindVisualChildren<TabItem>(this))
            {

                if (part_mainTab.SelectedItem == tab)
                {
                    //check which tab is currently selected and apply settings for that character
                    string str = tab.Header.ToString();
                    mainTab_selection = str;
                    foreach (Player player in playerList.Instance.m_PlayerList)
                    {
                        if (tab.Header.ToString() == player.Name)
                        {
                            part_GMFlag.IsChecked = player.UseGMFlag;
                            part_JAWait0.IsChecked = player.UseJAWait0;
                            part_chkBoxEnableSpeed.IsChecked = player.UseSpeedHack;

                            var speed = (player.SpeedAmount * 2) - 7;
                            part_CurrentSpeedSlider.Value = Convert.ToInt32(speed);

                            var speed2 = (player.SpeedAmountDisabled * 2) - 7;
                            part_DisabledSpeedSlider.Value = Convert.ToInt32(speed2);
                            part_lbDisabledSpeed.Content = player.SpeedAmountDisabled.ToString();

                            part_AutoDisableSpeedHack.IsChecked = player.AutoDisableSpeedHack;
                            part_UseExclusions.IsChecked = player.UseExclusions;
                            part_AutoDisablePosiHack.IsChecked = player.AutoDisablePositionHacks;
                            part_LockZCoord.IsChecked = player.UseZCoordHack;

                            UpdateViewer(player, player.GetZoneId());
                        }
                    }
                }
                if (part_mainTab.SelectedItem == null)
                {
                    part_mainTab.SelectedItem = tab;
                }
            }
        }
        private string mainTab_selection
        {
            get;

            set;

        }
        #endregion

        #region "== Warp Hack Handlers"

        /// <summary>
        /// Warp Character / 's to selected location
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void PART_WPViewer_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (part_WPViewer.SelectedItem != null || part_WPViewer.SelectedItem.ToString() != "" && part_warpMulty != null)
            {
                //Check if user wants to warp all characters in same zone
                if (part_warpMulty.IsChecked == false)
                {
                    //warp the player currently selected
                    GetChild getChild = new GetChild();
                    string selected = "";
                    foreach (var tb in getChild.FindVisualChildren<TextBlock>(this))
                    {
                        if(part_WPViewer.SelectedItem == tb)
                            selected = tb.Text;
                    }
                    
                    foreach (var p in this.m_ProcessList)
                    {
                        foreach (Player player in playerList.Instance.m_PlayerList)
                        {
                            if (mainTab_selection == player.Name)
                            {
                                //Find position from selected item
                                string slct = selected.ToString();
                                string[] splitString = slct.Split('|');
                                float Xpos = Convert.ToSingle(splitString[1]);
                                float Ypos = Convert.ToSingle(splitString[2]);
                                float Zpos = Convert.ToSingle(splitString[3]);
                                //warp to position
                                player.WarpToPosition(Xpos, Ypos, Zpos);
                            }
                        }
                    }
                }
                else
                {
                    //warp all characters in the same zone
                    GetChild getChild = new GetChild();
                    string selected = "";
                    foreach (var tb in getChild.FindVisualChildren<TextBlock>(this))
                    {
                        if (part_WPViewer.SelectedItem == tb)
                            selected = tb.Text;
                    }

                    foreach (Player player in playerList.Instance.m_PlayerList)
                    {
                        if (player.GetZoneId().ToString() == part_zoneIDLabel.Content.ToString())
                        {
                            //Find position from selected item
                            string slct = selected.ToString();
                            string[] splitString = slct.Split('|');
                            float Xpos = Convert.ToSingle(splitString[1]);
                            float Ypos = Convert.ToSingle(splitString[2]);
                            float Zpos = Convert.ToSingle(splitString[3]);
                            //warp each player to position
                            player.WarpToPosition(Xpos, Ypos, Zpos);
                        }
                    }
                }

            }
        }

        /// <summary>
        /// Delete entry from warp position viewer and its assosiated file
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void PART_btDelete_Click(object sender, RoutedEventArgs e)
        {

            if (part_WPViewer.SelectedItem != null)
            {
                GetChild getChild = new GetChild();
                string selected = "";
                foreach (var tb in getChild.FindVisualChildren<TextBlock>(this))
                {
                    if (part_WPViewer.SelectedItem == tb)
                        selected = tb.Text;
                }
                string line_to_delete = selected;
                string filename = part_zoneIDLabel.Content.ToString() + ".txt";
                string path = System.AppDomain.CurrentDomain.BaseDirectory + @"\Zones\" + filename;

                var tempFile = System.IO.Path.GetTempFileName();
                var linesToKeep = File.ReadLines(path).Where(l => l != line_to_delete);

                File.WriteAllLines(tempFile, linesToKeep);

                File.Delete(path);
                File.Move(tempFile, path);
                this.PART_mainTab_SelectionChanged(this, null);

            }
            //part_WPViewer.Items.SortDescriptions.Add(new System.ComponentModel.SortDescription("", System.ComponentModel.ListSortDirection.Ascending));
        }

        /// <summary>
        /// As name suggests
        /// </summary>
        public class InformationToSave
        {
            public string location { get; set; }
        }

        /// <summary>
        /// Add players Current Location to the warp Viewer and also save it for future use
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void PART_btCreateCurLoc_Click(object sender, RoutedEventArgs e)
        {
            float x = 0, y = 0, z = 0;
            string filename = part_zoneIDLabel.Content.ToString() + ".txt";
            string path = System.AppDomain.CurrentDomain.BaseDirectory + @"\Zones\" + filename;

            foreach (var p in this.m_ProcessList)
            {
                foreach (Player player in playerList.Instance.m_PlayerList)
                {
                    if (mainTab_selection == player.Name)
                    {
                        //Find currently selected player and get its current loaction
                        player.GetCurrentLocation(out x, out y, out z);
                        Math.Round(x, 3);
                        Math.Round(y, 3);
                        Math.Round(z, 3);
                    }
                }
            }
            if (part_CurLocTextBox.Text != "")
            {
                try
                {
                    InformationToSave info = new InformationToSave();
                    //Create format to save the location
                    info.location = "\"" + part_CurLocTextBox.Text.ToString() + "\" | " + x + " | " + y + " | " + z;
                    part_CurLocTextBox.Clear();

                    //If the file exists, append the location to it Else create the file and add the location 
                    if (File.Exists(path))
                    {
                        using (StreamWriter sw = File.AppendText(path))
                        {
                            sw.WriteLine(info.location);
                        }
                        //part_WPViewer.ItemsSource = File.ReadAllLines(path);
                        //part_WPViewer.Items.SortDescriptions.Add(new System.ComponentModel.SortDescription("", System.ComponentModel.ListSortDirection.Ascending));
                    }
                    else
                    {
                        using (StreamWriter sw = File.CreateText(path))
                        {
                            sw.WriteLine(info.location);
                        }
                        //part_WPViewer.ItemsSource = File.ReadAllLines(path);
                    }
                    this.PART_mainTab_SelectionChanged(this, null);
                }
                catch (Exception ex)
                {
                    System.Windows.MessageBox.Show(ex + "/n Must entre a name for the given waypoint creation!", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                System.Windows.MessageBox.Show(" Must entre a name for the given waypoint creation!", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        /// <summary>
        /// Create Location to add to viewer bassed on Co-ordinates manually inputted by user
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void PART_btCreateManLoc_Click(object sender, RoutedEventArgs e)
        {
            float x, y, z;
            string filename = part_zoneIDLabel.Content.ToString() + ".txt";
            string path = System.AppDomain.CurrentDomain.BaseDirectory + @"\Zones\" + filename;

            x = Convert.ToSingle(part_ManualCo_Ordinates_x.Text);
            y = Convert.ToSingle(part_ManualCo_Ordinates_y.Text);
            z = Convert.ToSingle(part_ManualCo_Ordinates_z.Text);


            if (part_ManLocTextBox.Text != "" && part_ManualCo_Ordinates_x.Text != "" && part_ManualCo_Ordinates_y.Text != "" && part_ManualCo_Ordinates_z.Text != "")
            {
                try
                {

                    InformationToSave info = new InformationToSave();

                    info.location = "\"" + part_ManLocTextBox.Text.ToString() + "\" | " + x + " | " + y + " | " + z;
                    part_ManLocTextBox.Clear();
                    part_ManualCo_Ordinates_x.Clear();
                    part_ManualCo_Ordinates_y.Clear();
                    part_ManualCo_Ordinates_z.Clear();

                    if (File.Exists(path))
                    {
                        using (StreamWriter sw = File.AppendText(path))
                        {
                            sw.WriteLine(info.location);
                        }
                        //part_WPViewer.ItemsSource = File.ReadAllLines(path);
                        //part_WPViewer.Items.SortDescriptions.Add(new System.ComponentModel.SortDescription("", System.ComponentModel.ListSortDirection.Ascending));
                    }
                    else
                    {
                        using (StreamWriter sw = File.CreateText(path))
                        {
                            sw.WriteLine(info.location);
                        }
                        //part_WPViewer.ItemsSource = File.ReadAllLines(path);
                    }
                    this.PART_mainTab_SelectionChanged(this, null);
                }
                catch (Exception ex)
                {
                    System.Windows.MessageBox.Show(ex + " /nMust entre a Name and Co-ordinates for the given Manual waypoint creation!", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
                System.Windows.MessageBox.Show(" Must entre a Name and Co-ordinates for the given waypoint creation!", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
        }
        #endregion

        #region "== Status Hack Handlers"
        private void PART_MaintStatus_Checked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    if (player.UseStatusHack == false)
                    {
                        // Set if we are using the status hack..
                        player.UseStatusHack = true;

                        var statusThread = new Thread(() =>
                        {
                            player.EnableStatusHack();
                            Debug.Write("| **********  New StatusHack thread " + Thread.CurrentThread.ManagedThreadId + " ************* |");
                        })
                        {
                            IsBackground = true
                        };
                        statusThread.Start();

                        // Adjust status mode if required..
                        if (player.UseStatusHack)
                        {
                            // Set status mode..
                            player.StatusMode = 31;
                        }
                    }
                }
            }
        }

        private void PART_MaintStatus_Unchecked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {

                    // Set if we are using the status hack..
                    player.UseStatusHack = false;

                    // Adjust status mode if required..
                    if (!player.UseStatusHack)
                    {
                        // Set status mode..
                        player.StatusMode = 0;
                    }
                }
            }
        }
        #endregion

        #region "== GM Flag Handlers"
        private void PART_GMFlag_Checked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    if (player.UseGMFlag == false)
                    {
                        player.UseGMFlag = true;

                        var flagThread = new Thread(() =>
                        {
                            Debug.Write("| **********  New UseGMFlag thread " + Thread.CurrentThread.ManagedThreadId + " ************* |");
                            player.EnableFlagHack();
                        })
                        {
                            IsBackground = true
                        };
                        flagThread.Start();
                    }
                }
            }
        }

        private void PART_GMFlag_Unchecked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.UseGMFlag = false;
                }
            }
        }
        #endregion

        #region "== JAWait0 Hack Handlers"
        private void PART_JAWait0_Checked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    // Cancel the current thread..
                    if (player.JAWait0Thread != null)
                    {
                        player.UseJAWait0 = false;
                        player.JAWait0Thread.Join();
                    }

                    player.UseJAWait0 = true;

                    player.JAWait0Thread = new Thread(() =>
                    {
                        Debug.Write("| **********  New JAWait0Hack thread " + Thread.CurrentThread.ManagedThreadId + " ************* |");
                        player.EnableJAWait0Hack();
                    })
                    {
                        IsBackground = true
                    };
                    player.JAWait0Thread.Start();
                }
            }
        }

        private void PART_JAWait0_Unchecked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.UseJAWait0 = false;
                }
            }
        }
        #endregion

        #region "== Exclusion Handler"
        private void PART_UseExclusions_Checked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.UseExclusions = true;
                }
            }
        }

        private void PART_UseExclusions_Unchecked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.UseExclusions = false;
                }
            }
        }
        #endregion

        #region "== Speed Hack Handlers"
        private void PART_chkBoxEnableSpeed_Checked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    if (player.UseSpeedHack == false)
                    {
                        player.UseSpeedHack = true;

                        var speedThread = new Thread(() =>
                        {
                            Debug.Write("| **********  New SpeedHack thread " + Thread.CurrentThread.ManagedThreadId + " ************* |");
                            player.EnableSpeedHack();
                        })
                        {
                            IsBackground = true
                        };
                        speedThread.Start();
                    }
                }
            }
        }

        private void PART_chkBoxEnableSpeed_Unchecked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.UseSpeedHack = false;
                    part_CurrentSpeedSlider.Value = 1;
                    player.SpeedAmount = 4.0f;
                }
            }
        }

        private void PART_AutoDisableSpeedHack_Checked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.AutoDisableSpeedHack = true;
                }
            }
        }

        private void PART_AutoDisableSpeedHack_Unchecked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.AutoDisableSpeedHack = false;
                }
            }
        }

        private void PART_CurrentSpeedSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    var speedMult = part_CurrentSpeedSlider.Value * 0.5f;
                    var speed = 4.0f + (speedMult - 0.5f);

                    player.SpeedAmount = (float)speed;
                }
            }
        }

        private void PART_DisabledSpeedSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    var speedMult = part_DisabledSpeedSlider.Value * 0.5f;
                    var speed = 4.0f + (speedMult - 0.5f);

                    player.SpeedAmountDisabled = (float)speed;

                    part_lbDisabledSpeed.Content = speed.ToString();
                }
            }
        }
        #endregion

        #region "== Position Adjustment Hacks"
        private void PART_btNW_Click(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.AdjustPosition(Player.PositionDirection.NW, 1.0f);
                }
            }
        }

        private void PART_btN_Click(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.AdjustPosition(Player.PositionDirection.N, 1.0f);
                }
            }
        }

        private void PART_btNE_Click(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.AdjustPosition(Player.PositionDirection.NE, 1.0f);
                }
            }
        }

        private void PART_btUP_Click(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.AdjustPosition(Player.PositionDirection.Up, 1.0f);
                    if (part_LockZCoord.IsChecked == true)
                        player.LockedZCoord -= 1.0f;
                }
            }
        }

        private void PART_btW_Click(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.AdjustPosition(Player.PositionDirection.W, 1.0f);
                }
            }
        }

        private void PART_btE_Click(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.AdjustPosition(Player.PositionDirection.E, 1.0f);
                }
            }
        }

        private void PART_btDN_Click(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.AdjustPosition(Player.PositionDirection.Down, 1.0f);
                    if (part_LockZCoord.IsChecked == true)
                        player.LockedZCoord += 1.0f;
                }
            }
        }

        private void PART_btSW_Click(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.AdjustPosition(Player.PositionDirection.SW, 1.0f);
                }
            }
        }

        private void PART_btS_Click(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.AdjustPosition(Player.PositionDirection.S, 1.0f);
                }
            }
        }

        private void PART_btSE_Click(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.AdjustPosition(Player.PositionDirection.SE, 1.0f);
                }
            }
        }

        private void PART_LockZCoord_Checked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    // Enable the Z Coord hack thread..
                    player.UseZCoordHack = true;

                    // Set the Z Coord to lock to..
                    player.LockedZCoord = player.ZCoord;

                    // Start Z Coord lock thread..
                    var coordThread = new Thread(player.EnableZCoordHack)
                    {
                        IsBackground = true
                    };
                    coordThread.Start();

                }
            }
        }

        private void PART_LockZCoord_Unchecked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.UseZCoordHack = false;
                }
            }
        }

        private void PART_AutoDisablePosiHack_Checked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.AutoDisablePositionHacks = true;
                }
            }
        }

        private void PART_AutoDisablePosiHack_Unchecked(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {
                    player.AutoDisablePositionHacks = false;
                }
            }
        }
        #endregion

        #region "== Save button"

        /// <summary>
        /// Save settings for currently selected player
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void PART_saveSettings_Click(object sender, RoutedEventArgs e)
        {
            foreach (Player player in playerList.Instance.m_PlayerList)
            {
                if (mainTab_selection == player.Name)
                {

                    try
                    {

                        Save info = new Save();

                        info.UseGMFlag = player.UseGMFlag;
                        info.UseJAWait0 = player.UseJAWait0;
                        info.AutoDisableJAWait0Hack = player.AutoDisableJAWait0Hack;
                        info.UseSpeedHack = player.UseSpeedHack;
                        info.SpeedAmount = player.SpeedAmount;
                        info.SpeedAmountDisabled = player.SpeedAmountDisabled;
                        info.AutoDisableSpeedHack = player.AutoDisableSpeedHack;
                        info.UseExclusions = player.UseExclusions;
                        info.AutoDisablePositionHacks = player.AutoDisablePositionHacks;

                        XmlSave.SaveData(info, "Resources\\" + player.Name + ".xml");

                    }
                    catch (Exception ex)
                    {
                        System.Windows.MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Exclamation);
                    }
                }
            }
        }
        #endregion

    }
}
