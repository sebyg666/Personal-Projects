namespace InstaWarp2
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Xml.Serialization;

    /// <summary>
    /// FilesToDownload Object Class
    /// 
    /// Holds definition information for a single File.
    /// </summary>
    public class FilesToDownload
    {
        /// <summary>
        /// The name of this file.
        /// </summary>
        [XmlAttribute("name")]
        public String Name;

        /// <summary>
        /// The version of the file.
        /// </summary>
        [XmlAttribute("version")]
        public String Version;

        /// <summary>
        /// The type of the file.
        /// </summary>
        [XmlAttribute("type")]
        public String Type;

        /// <summary>
        /// The directory of the file.
        /// </summary>
        [XmlAttribute("directory")]
        public String Directory;

    }

    public class url
    {

        /// <summary>
        /// The name of this file.
        /// </summary>
        [XmlAttribute("url")]
        public String Url;
    }

    public class FilesToUpdate
    {
        /// <summary>
        /// Default Constructor
        /// </summary>
        public FilesToUpdate()
        {
            this.files = new List<FilesToDownload>();
            this.urlToFiles = new List<url>();
            
        }

        public List<FilesToDownload> files { get; set; }
        public List<url> urlToFiles { get; set; }

        public url GetUrl()
        {
            return this.urlToFiles[0];
        }

        public FilesToDownload GetFile(String strName)
        {
            return (from s in this.files
                    where s.Name.ToLower() == strName.ToLower()
                    select s).SingleOrDefault();
        }
    }
}
