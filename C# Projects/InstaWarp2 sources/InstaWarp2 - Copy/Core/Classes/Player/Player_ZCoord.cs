
namespace Core.Classes.Player
{
    using System.Threading;

    /// <summary>
    /// Player (Partial Class)
    /// 
    /// ZCoord Hack
    /// Contains definitions and properties used for hacking
    /// the players Z Coord. 
    /// </summary>
    public partial class Player
    {
        /// <summary>
        /// Thread delegate to handle player GM Flag hacks.
        /// </summary>
        public  void EnableZCoordHack()
        {
            // Loop while the Z Coord hack is enabled..
            while (UseZCoordHack && !Globals.Instance.IsClosing)
            {
                // Sleep to prevent CPU raping..
                Thread.Sleep(1);

                // Skip if we are detected and auto-disabled..
                if (IsDetectingPlayer && AutoDisablePositionHacks)
                    continue;

                // Set the player Z Coord..
                ZCoord = LockedZCoord;
            }

            // Reset the locked coord..
            LockedZCoord = 0.0f;
        }

        /// <summary>
        /// Gets or sets the Z Coord hack usage flag.
        /// </summary>
        public  bool UseZCoordHack { get; set; }

        /// <summary>
        /// Gets or sets the Z Coord to lock the player to.
        /// </summary>
        public  float LockedZCoord { get; set; }

        /// <summary>
        /// Gets or sets the position hack auto-disable flag.
        /// </summary>
        public  bool AutoDisablePositionHacks { get; set; }
    }
}