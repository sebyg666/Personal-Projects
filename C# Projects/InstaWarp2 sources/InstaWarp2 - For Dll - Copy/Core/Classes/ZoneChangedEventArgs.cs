using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Classes
{
    public class ZoneChangedEventArgs : EventArgs
    {
        public short ZoneID { get; set; }
        public string PlayerName { get; set; }
        public Player.Player Player { get; set; }
    }
}
