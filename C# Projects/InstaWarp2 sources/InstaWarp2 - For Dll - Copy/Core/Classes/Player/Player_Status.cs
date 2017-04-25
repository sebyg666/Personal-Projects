namespace Core.Classes.Player
{
    using System;
    using System.Threading;

    /// <summary>
    /// Player (Partial Class)
    /// 
    /// Status Hacks
    /// Contains definitions and properties used for status
    /// hacks that can be set on the 
    /// </summary>
    public partial class Player
    {
        /// <summary>
        /// Thread delegate to handle player status hacks.
        /// </summary>
        public  void EnableStatusHack()
        {
            // Loop while the status hack is enabled..
            while (UseStatusHack && !Globals.Instance.IsClosing)
            {
                // Adjust player status..
                if (IsDetectingPlayer && AutoDisableStatusHack)
                    Status = 0;
                else
                    Status = StatusMode;
                
                // Sleep to prevent CPU raping..
                Thread.Sleep(10);
            }

            // Reset player status..
            Status = 0;
            StatusMode = 0;
        }

        /// <summary>
        /// Gets or sets the Status hack usage flag.
        /// </summary>
        public  bool UseStatusHack { get; set; }

        /// <summary>
        /// Gets or sets the Status auto-disable flag.
        /// </summary>
        public  bool AutoDisableStatusHack { get; set; }

        /// <summary>
        /// Gets or sets the player status mode.
        /// </summary>
        public  Int32 StatusMode { get; set; }
    }
}