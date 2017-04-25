
namespace Core.Classes.Player
{
    using System.Threading;

    /// <summary>
    /// Player (Partial Class)
    /// 
    /// JAWait0
    /// Contains definitions and properties used for JAWait0
    /// hacks that can be set on the 
    /// </summary>
    public partial class Player
    {
        /// <summary>
        /// Thread delegate to handle player GM Flag hacks.
        /// </summary>
        public  void EnableJAWait0Hack()
        {
            // Enable JAWait0..
            var isJAWaitEnabled = true;
            EnableJAWait0();

            // Loop while the JAWait0 hack is enabled..
            while (UseJAWait0 && !Globals.Instance.IsClosing)
            {
                // Disable the hack..
                if (IsDetectingPlayer && AutoDisableJAWait0Hack && isJAWaitEnabled)
                {
                    isJAWaitEnabled = false;
                    DisableJAWait0();
                }

                // Enablet the hack..
                if (!IsDetectingPlayer && !isJAWaitEnabled)
                {
                    isJAWaitEnabled = true;
                    EnableJAWait0();
                }

                // Sleep to prevent CPU raping..
                Thread.Sleep(10);
            }

            // Ensure we are disabled..
            if (isJAWaitEnabled)
                DisableJAWait0();
        }

        /// <summary>
        /// Enables the JAWait0 hack.
        /// </summary>
        public  void EnableJAWait0()
        {
            var patch1 = Helpers.HexStringToArray(Globals.Instance.GetPatch("JAWAIT0_1").Enabled);
            var patch2 = Helpers.HexStringToArray(Globals.Instance.GetPatch("JAWAIT0_2").Enabled);

            Memory.Poke(process, pointerFactory["JAWAIT0_1" + process.MainWindowTitle], patch1);
            Memory.Poke(process, pointerFactory["JAWAIT0_2" + process.MainWindowTitle], patch2);
        }

        /// <summary>
        /// Disables the JAWait0 hack.
        /// </summary>
        public  void DisableJAWait0()
        {
            var patch1 = Helpers.HexStringToArray(Globals.Instance.GetPatch("JAWAIT0_1").Disabled);
            var patch2 = Helpers.HexStringToArray(Globals.Instance.GetPatch("JAWAIT0_2").Disabled);

            Memory.Poke(process, pointerFactory["JAWAIT0_1" + process.MainWindowTitle], patch1);
            Memory.Poke(process, pointerFactory["JAWAIT0_2" + process.MainWindowTitle], patch2);
        }

        /// <summary>
        /// Gets or sets the JAWait0 usage flag.
        /// </summary>
        public  bool UseJAWait0 { get; set; }

        /// <summary>
        /// Gets or sets the JAWait0 auto-disable flag.
        /// </summary>
        public  bool AutoDisableJAWait0Hack { get; set; }

        /// <summary>
        /// Internal thread object for the JAWait0 hack.
        /// </summary>
        internal  Thread JAWait0Thread { get; set; }
    }
}