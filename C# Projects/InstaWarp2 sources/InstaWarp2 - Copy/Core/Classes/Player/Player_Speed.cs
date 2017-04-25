namespace Core.Classes.Player
{
    using System.Threading;

    /// <summary>
    /// Player (Partial Class)
    /// 
    /// Speed Hacks
    /// Contains definitions and properties used for speed hacks.
    /// </summary>
    public partial class Player
    {
        /// <summary>
        /// Thread delegate to handle player speed hacks.
        /// </summary>
        public  void EnableSpeedHack()
        {
            // Loop while the speed hack is enabled..
            while (UseSpeedHack && !Globals.Instance.IsClosing)
            {
                if (IsDetectingPlayer && AutoDisableSpeedHack)
                    Speed = SpeedAmountDisabled;
                else
                    Speed = SpeedAmount;

                // Sleep to prevent CPU raping..
                Thread.Sleep(10);
            }

            // Reset speed variables..
            Speed = SpeedAmountDisabled;
            SpeedAmount = 4.0f;
        }

        /// <summary>
        /// Gets or sets the speed hack usage flag.
        /// </summary>
        public  bool UseSpeedHack { get; set; }

        /// <summary>
        /// Gets or sets the player speed hack amount.
        /// </summary>
        public  float SpeedAmount { get; set; }

        /// <summary>
        /// Gets or sets the player speed hack amount when disabled.
        /// </summary>
        public  float SpeedAmountDisabled { get; set; }

        /// <summary>
        /// Gets or sets the Status auto-disable flag.
        /// </summary>
        public  bool AutoDisableSpeedHack { get; set; }
    }
}