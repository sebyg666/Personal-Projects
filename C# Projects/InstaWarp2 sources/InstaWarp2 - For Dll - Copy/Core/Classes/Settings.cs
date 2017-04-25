namespace Core.Classes
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Xml.Serialization;

    public class Settings
    {
        public Settings()
        {
            this.ExcludedPlayers = new List<String>();
            this.ExcludedZones = new List<Int32>();
        }

        /// <summary>
        /// Always on top configuration setting.
        /// </summary>
        public bool AlwaysOnTop { get; set; }

        /// <summary>
        /// Minimize to tray configuration setting.
        /// </summary>
        public bool MinimizeToTray { get; set; }

        /// <summary>
        /// Gets or sets the delay between zoning and reactiving tools.
        /// </summary>
        public int ZoneDelay { get; set; }

        /// <summary>
        /// List of excluded players when checking for detected players.
        /// </summary>
        [XmlArray]
        [XmlArrayItem(ElementName = "Exclude")]
        public List<String> ExcludedPlayers { get; set; }

        /// <summary>
        /// List of excluded zones when checking for detected players.
        /// </summary>
        [XmlArray]
        [XmlArrayItem(ElementName = "Exclude")]
        public List<Int32> ExcludedZones { get; set; }

    }
}
