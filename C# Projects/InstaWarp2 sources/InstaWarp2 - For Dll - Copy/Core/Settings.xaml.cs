
namespace Core
{
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
    using System.Windows.Shapes;
    using System.Windows.Interop;
    using Core.Classes;
    using Core.Classes.Player;
    using System.IO;
    using System.Xml.Serialization;

    [TemplatePart(Name = "PART_ExPlayerViewer", Type = typeof(System.Windows.Controls.ListBox))]
    [TemplatePart(Name = "PART_ExZoneViewer", Type = typeof(System.Windows.Controls.ListBox))]
    [TemplatePart(Name = "PART_playerToAdd", Type = typeof(System.Windows.Controls.TextBox))]
    [TemplatePart(Name = "PART_zoneToAdd", Type = typeof(System.Windows.Controls.TextBox))]
    [TemplatePart(Name = "PART_deletePlayer", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_addPlayer", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_deleteZone", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_addZone", Type = typeof(System.Windows.Controls.Button))]
    [TemplatePart(Name = "PART_zoneDelay", Type = typeof(System.Windows.Controls.TextBox))]
    [TemplatePart(Name = "PART_zoneDelayWaterMark", Type = typeof(System.Windows.Controls.TextBlock))]

    /// <summary>
    /// Interaction logic for Settings.xaml
    /// </summary>
    public partial class Settings : Window
    {
        public System.Windows.Controls.ListBox part_ExPlayerViewer;
        public System.Windows.Controls.ListBox part_ExZoneViewer;
        public System.Windows.Controls.TextBox part_playerToAdd;
        public System.Windows.Controls.TextBox part_zoneToAdd;
        public System.Windows.Controls.Button part_deletePlayer;
        public System.Windows.Controls.Button part_addPlayer;
        public System.Windows.Controls.Button part_deleteZone;
        public System.Windows.Controls.Button part_addZone;
        public System.Windows.Controls.TextBox part_zoneDelay;
        public System.Windows.Controls.TextBlock part_zoneDelayWaterMark;

        public Settings()
        {
            InitializeComponent();
        }

        #region "== Template Children Setters"

        public override void OnApplyTemplate()
        {
            base.OnApplyTemplate();
            //initialise all parts of the application
            part_ExPlayerViewer = GetTemplateChild("PART_ExPlayerViewer") as System.Windows.Controls.ListBox;
            part_ExZoneViewer = GetTemplateChild("PART_ExZoneViewer") as System.Windows.Controls.ListBox;
            part_playerToAdd = GetTemplateChild("PART_playerToAdd") as System.Windows.Controls.TextBox;
            part_zoneToAdd = GetTemplateChild("PART_zoneToAdd") as System.Windows.Controls.TextBox;
            part_deletePlayer = GetTemplateChild("PART_deletePlayer") as System.Windows.Controls.Button;
            part_addPlayer = GetTemplateChild("PART_addPlayer") as System.Windows.Controls.Button;
            part_deleteZone = GetTemplateChild("PART_deleteZone") as System.Windows.Controls.Button;
            part_addZone = GetTemplateChild("PART_addZone") as System.Windows.Controls.Button;
            part_zoneDelay = GetTemplateChild("PART_zoneDelay") as System.Windows.Controls.TextBox;
            part_zoneDelayWaterMark = GetTemplateChild("PART_zoneDelayWaterMark") as System.Windows.Controls.TextBlock;

            if (Globals.Instance.Stngs != null)
            {
                part_ExPlayerViewer.ItemsSource = Globals.Instance.Stngs.ExcludedPlayers;
                part_ExZoneViewer.ItemsSource = Globals.Instance.Stngs.ExcludedZones;
                part_zoneDelayWaterMark.Text = Globals.Instance.Stngs.ZoneDelay.ToString();
            }

            //Alphabetise all entries in the warp list
            ((System.Collections.Specialized.INotifyCollectionChanged)part_ExPlayerViewer.Items).CollectionChanged += part_ExPlayerViewer_CollectionChanged;
            part_ExPlayerViewer.Items.SortDescriptions.Add(new System.ComponentModel.SortDescription("", System.ComponentModel.ListSortDirection.Ascending));
            ((System.Collections.Specialized.INotifyCollectionChanged)part_ExZoneViewer.Items).CollectionChanged += part_ExZoneViewer_CollectionChanged;
            part_ExZoneViewer.Items.SortDescriptions.Add(new System.ComponentModel.SortDescription("", System.ComponentModel.ListSortDirection.Ascending));
        }

        private void part_ExPlayerViewer_CollectionChanged(object sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            if (e.Action == System.Collections.Specialized.NotifyCollectionChangedAction.Add)
            {
                // scroll the new item into view  
                part_ExPlayerViewer.Items.SortDescriptions.Add(new System.ComponentModel.SortDescription("", System.ComponentModel.ListSortDirection.Ascending));
            }
        }

        private void part_ExZoneViewer_CollectionChanged(object sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            if (e.Action == System.Collections.Specialized.NotifyCollectionChangedAction.Add)
            {
                // scroll the new item into view  
                part_ExZoneViewer.Items.SortDescriptions.Add(new System.ComponentModel.SortDescription("", System.ComponentModel.ListSortDirection.Ascending));
            }
        }

        #endregion

        private void closeMenuButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void CloseCommandHandler(object sender, ExecutedRoutedEventArgs e)
        {
            this.Close();
        }

        private void PART_saveSettings_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // Open configuration file for writing..
                using (var writer = new StreamWriter(System.AppDomain.CurrentDomain.BaseDirectory + "\\Resources\\Settings.xml"))
                {
                    // Attempt to save the configuration file..
                    var serializer = new XmlSerializer(typeof(Core.Classes.Settings));
                    if (part_zoneDelay.Text != "")
                    {
                        Globals.Instance.Stngs.ZoneDelay = Convert.ToInt32(part_zoneDelay.Text);
                    }
                    serializer.Serialize(writer, Globals.Instance.Stngs);

                }

                // Close this window..
                this.DialogResult = DialogResult;
                this.Close();
            }
            catch (Exception ex)
            {
                // Failed to save.. announce the error..
                MessageBox.Show(ex.ToString(), "Failed to save Settings file..", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void PART_deletePlayer_Click(object sender, RoutedEventArgs e)
        {
            // Obtain the selected player..
            var item = part_ExPlayerViewer.SelectedItem;
            if (item == null) return;
            // Delete the player..
            AdjustExcludedPlayer((String)item, true);
        }

        private void PART_addPlayer_Click(object sender, RoutedEventArgs e)
        {
            // Ensure the user entered text to add..
            if (!String.IsNullOrWhiteSpace(part_playerToAdd.Text))
            {
                // Add the player..
                AdjustExcludedPlayer(part_playerToAdd.Text);
            }

            part_playerToAdd.Text = string.Empty;
        }

        private void PART_deleteZone_Click(object sender, RoutedEventArgs e)
        {
            // Obtain the selected zone..
            var item = part_ExZoneViewer.SelectedItem;
            if (item == null) return;

            // Delete the zone..
            AdjustExcludedZone((Int32)item, true);
        }

        private void PART_addZone_Click(object sender, RoutedEventArgs e)
        {
            // Ensure the user entered text to add..
            if (String.IsNullOrWhiteSpace(part_zoneToAdd.Text))
                return;

            // Convert the string to an integer..
            var zoneId = 0;
            if (Int32.TryParse(part_zoneToAdd.Text, out zoneId))
            {
                // Add the zone..
                AdjustExcludedZone(zoneId);
            }

            part_zoneToAdd.Text = string.Empty;
        }

        /// <summary>
        /// Adds or removes players from the excluded player list. Used in order
        /// to rebind the data source to allow the listbox to properly refresh.
        /// </summary>
        /// <param name="strName"></param>
        /// <param name="bRemove"></param>
        private void AdjustExcludedPlayer(String strName, bool bRemove = false)
        {
            //foreach (Player player in playerList.Instance.m_PlayerList)
            //{
            // Attempt to remove the name if we just wish to remove it..
            if (bRemove)
                Globals.Instance.Stngs.ExcludedPlayers.Remove(strName);

            // Attempt to add the name if it is unique..
            else
            {
                // Determine if the name is unique to the list..
                var names = Globals.Instance.Stngs.ExcludedPlayers;
                var hasName = (from s in names
                               where s.ToLower() == part_ExPlayerViewer.Items.ToString()
                               select s).Any();

                if (!hasName) Globals.Instance.Stngs.ExcludedPlayers.Add(strName);
            }

            // Rebind the data source to refresh the list..
            part_ExPlayerViewer.ItemsSource = null;
            part_ExPlayerViewer.ItemsSource = Globals.Instance.Stngs.ExcludedPlayers;
            //}
        }

        /// <summary>
        /// Adds or removes zones from the excluded zones list. Used in order
        /// to rebind the data source to allow the listbox to properly refresh.
        /// </summary>
        /// <param name="nZoneId"></param>
        /// <param name="bRemove"></param>
        private void AdjustExcludedZone(Int32 nZoneId, bool bRemove = false)
        {
            //foreach (Player player in playerList.Instance.m_PlayerList)
            //{
            // Attempt to remove the zone if we just wish to remove it..
            if (bRemove)
                Globals.Instance.Stngs.ExcludedZones.Remove(nZoneId);

            // Attempt to add the zone if it is unique..
            else
            {
                if (!Globals.Instance.Stngs.ExcludedZones.Contains(nZoneId))
                    Globals.Instance.Stngs.ExcludedZones.Add(nZoneId);
            }

            // Rebind the data source to refresh the list..
            part_ExZoneViewer.ItemsSource = null;
            part_ExZoneViewer.ItemsSource = Globals.Instance.Stngs.ExcludedZones;
            //}
        }

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }
    }
}
