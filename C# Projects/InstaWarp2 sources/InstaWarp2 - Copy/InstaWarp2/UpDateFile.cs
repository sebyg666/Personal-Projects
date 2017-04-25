
namespace InstaWarp2
{
    using System;
    using System.Diagnostics;
    using System.Threading;

    class UpDateFile
    {
        
        /// <summary>
        /// Internal singleton instance of this class.
        /// </summary>
        private static UpDateFile m_Instance = new UpDateFile();

        /// <summary>
        /// Private Constructor
        /// </summary>
        public UpDateFile()
        {
        }

        /// <summary>
        /// Gets the instance of this class.
        /// </summary>
        public static UpDateFile Instance
        {
            get { return m_Instance ?? (m_Instance = new UpDateFile()); }
        }

        /// <summary>
        /// Gets or sets the current configuration.
        /// </summary>
        public FilesToUpdate File { get; set; }

        public string GetUrl()
        {
            return this.File.GetUrl().Url;
        }

        public string GetVersion(String FileName)
        {
            var ver = this.File.GetFile(FileName);
            return ver.Version;
        }
        public string GetType(String FileName)
        {
            var type = this.File.GetFile(FileName);
            return type.Type;
        }

        public string GetDirectory(String FileName)
        {
            var type = this.File.GetFile(FileName);
            return type.Directory;
        }

    }
}
