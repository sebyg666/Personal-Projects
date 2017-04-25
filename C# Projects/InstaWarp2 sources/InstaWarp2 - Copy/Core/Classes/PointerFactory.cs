
namespace Core.Classes
{
    using System;
    using System.Collections.Generic;
    using System.Diagnostics;
    using System.Linq;
    using System.Windows;
    using System.Threading.Tasks;

    public class PointerFactory
    {
        /// <summary>
        /// Internal singleton instance of this class.
        /// </summary>
        /// 

        /// <summary>
        /// Internal pointer table.
        /// </summary>
        public Dictionary<String, IntPtr> dico = new Dictionary<String, IntPtr>();

        /// <summary>
        /// Private Constructor
        /// </summary>
        public PointerFactory()
        {
        }

        /// <summary>
        /// Updates the internal pointer list.
        /// </summary>
        /// <returns></returns>
        public bool UpdateFactory(string name, Process playerProcess)
        {
            // Validate current process..
            if (playerProcess == null || playerProcess.HasExited)
                return false;
            
            // Locate FFXiMain.dll..
            var ffxiMain = (from ProcessModule m in playerProcess.Modules
                            where m.ModuleName.ToLower() == "ffximain.dll"
                            select m).SingleOrDefault();

            if (ffxiMain == null)
                return false;

            // Prepare signature scanner..
            var sigScan = new SigScan(
                playerProcess, ffxiMain.BaseAddress, ffxiMain.ModuleMemorySize
                );

            // Loop each signature and rescan..
            if (Globals.Instance.Config != null)
            {
                foreach (var p in Globals.Instance.Config.Signatures)
                {
                    // Attempt to locate signature..
                    var pointer = sigScan.FindPattern(Helpers.HexStringToArray(p.Pattern), p.Mask, p.Offset);
                    if (pointer == IntPtr.Zero)
                    {

                        return false;
                    }

                    // Add pointer to pointer table..
                    string newName = "";
                    newName = p.Name + name;
                    Debug.Write("Pointer name = " + newName + " || ");
                    //Task.Delay(100).Wait();
                    //Execute.OnUIThread(() =>
                    //{
                    //    foreach (Window window in System.Windows.Application.Current.Windows)
                    //    {
                    //        if (window.GetType() == typeof(MainWindow))
                    //        {

                    //            (window as MainWindow).loadingTextBox.Text = "Creating pointers: " + newName;
                    //        }
                    //    }
                    //});
                    dico.Add(newName, pointer);
                }
            }

            return true;
        }

        /// <summary>
        /// Returns a pointer from the pointer factory with the given name.
        /// </summary>
        /// <param name="strPointerName"></param>
        /// <returns></returns>
        public IntPtr this[String strPointerName]
        {
            get
            {
                return dico.ContainsKey(strPointerName) ? dico[strPointerName] : IntPtr.Zero;
            }
        }
    }
}
