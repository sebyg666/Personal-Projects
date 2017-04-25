
namespace Core.Classes
{

    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class playerList
    {
        /// <summary>
        /// Internal singleton instance of this class.
        /// </summary>
        private static playerList m_Instance;

        /// <summary>
        /// Internal pointer table.
        /// </summary>
        public List<Player.Player> m_PlayerList; 

        /// <summary>
        /// Private Constructor
        /// </summary>
        private playerList()
        {
            this.m_PlayerList = new List<Player.Player>();
        }

        /// <summary>
        /// Gets the instance of this class.
        /// </summary>
        public static playerList Instance
        {
            get { return m_Instance ?? (m_Instance = new playerList()); }
        }
    }
}
