namespace Core.Classes.Player
{
    using System.Threading;

    /// <summary>
    /// Player (Partial Class)
    /// 
    /// GM Flag Hacks
    /// Contains definitions and properties used for GM Flag mode
    /// hacks that can be set on the 
    /// </summary>
    public partial class Player
    {
        /// <summary>
        /// Thread delegate to handle player GM Flag hacks.
        /// </summary>
        public  void EnableFlagHack()
        {
            // Loop while the GM Flag hack is enabled..
            while (UseGMFlag && !Globals.Instance.IsClosing)
            {
                // Set player GM Flag..
                GMFlag = 1;

                // Sleep to prevent CPU raping..
                Thread.Sleep(10);
            }

            // Reset player GM Flag..
            GMFlag = 0;
        }

        /// <summary>
        /// Gets or sets the GM flag usage flag.
        /// </summary>
        public  bool UseGMFlag { get; set; }
    }
}