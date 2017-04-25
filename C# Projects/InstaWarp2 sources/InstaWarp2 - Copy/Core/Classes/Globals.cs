
namespace Core.Classes
{
    using System;
    using System.Diagnostics;
    using System.Threading;

    public class Globals
    {
        /// <summary>
        /// Internal singleton instance of this class.
        /// </summary>
        private static Globals m_Instance = new Globals();

        /// <summary>
        /// Private Constructor
        /// </summary>
        public Globals()
        {
        }

        /// <summary>
        /// Gets the instance of this class.
        /// </summary>
        public static Globals Instance
        {
            get { return m_Instance ?? (m_Instance = new Globals()); }
        }

        /// <summary>
        /// Returns an offset from the loaded configuration.
        /// </summary>
        /// <param name="strOffsetName"></param>
        /// <returns></returns>
        public Int32 GetOffset(String strOffsetName)
        {
            var offset = this.Config.GetOffset(strOffsetName);
            return (offset != null) ? offset.Value : 0;
        }

        /// <summary>
        /// Returns a patch from the loaded configuration.
        /// </summary>
        /// <param name="strPatchName"></param>
        /// <returns></returns>
        public Patch GetPatch(String strPatchName)
        {
            var patch = this.Config.GetPatch(strPatchName);
            return patch ?? new Patch { Name = "Invalid" };
        }

        /// <summary>
        /// Gets or sets the current configuration.
        /// </summary>
        public Configuration Config { get; set; }

        /// <summary>
        /// Gets or sets if this application is closing.
        /// </summary>
        public bool IsClosing { get; set; }
    }
}