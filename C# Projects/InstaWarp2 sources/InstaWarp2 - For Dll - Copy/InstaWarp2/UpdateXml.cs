using System;
using System.Net;
using System.Xml;
using System.Windows.Forms;
using System.Windows;
using System.Windows.Controls;

namespace InstaWarp2
{
    internal class UpdateXml
    {
        private Version version;
        private Uri uri;
        private string fileName;

        /// <summary>
        /// The update version #
        /// </summary>
        internal Version Version
        {
            get { return this.version; }
        }

        /// <summary>
        /// The location of the update binary
        /// </summary>
        internal Uri Uri
        {
            get { return this.uri; }
        }

        /// <summary>
        /// The file name of the binary
        /// for use on local computer
        /// </summary>
        internal string FileName
        {
            get { return this.fileName; }
        }

        /// <summary>
        /// Creates a new SharpUpdateXml object
        /// </summary>
        internal UpdateXml(Version version, Uri uri, string fileName)
        {
            this.version = version;
            this.uri = uri;
            this.fileName = fileName;
        }

        /// <summary>
        /// Checks if update's version is newer than the old version
        /// </summary>
        /// <param name="version">Application's current version</param>
        /// <returns>If the update's version # is newer</returns>
        internal bool IsNewerThan(string version)
        {
            Version ver = null;
            Version.TryParse(version, out ver);
            return this.version > ver;
        }

        /// <summary>
        /// Checks the Uri to make sure file exist
        /// </summary>
        /// <param name="location">The Uri of the update.xml</param>
        /// <returns>If the file exists</returns>
        internal static bool ExistsOnServer(Uri location)
        {
            try
            {
                // Request the update.xml
                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(location.AbsoluteUri);
                // Read for response
                HttpWebResponse resp = (HttpWebResponse)req.GetResponse();
                resp.Close();

                return resp.StatusCode == HttpStatusCode.OK;
            }
            catch { return false; }
        }

        /// <summary>
        /// Parses the update.xml into SharpUpdateXml object
        /// </summary>
        /// <param name="location">Uri of update.xml on server</param>
        /// <param name="appID">The application's ID</param>
        /// <returns>The SharpUpdateXml object with the data, or null of any errors</returns>
        internal static UpdateXml Parse(Uri location, string appID)
        {
            Version version = null;
            string url = "", fileName = "";

            try
            {
                // Load the document
                XmlDocument doc = new XmlDocument();
                doc.Load(location.AbsoluteUri);

                // Gets the appId's node with the update info
                // This allows you to store all program's update nodes in one file
                XmlNode updateNode = doc.DocumentElement.SelectSingleNode("//update[@appId='" + appID + "']");

                // If the node doesn't exist, there is no update
                if (updateNode == null)
                    return null;

                // Parse data
                version = Version.Parse(updateNode["version"].InnerText);
                url = updateNode["url"].InnerText;
                fileName = updateNode["fileName"].InnerText;

                return new UpdateXml(version, new Uri(url), fileName);
            }
            //catch { return null; }
            catch (Exception ex)
            {
                string strErrorMsg = "Something went wrong while updating! Error was:\r\n\r\n" + ex.ToString();
                System.Windows.MessageBox.Show(strErrorMsg, "Error", MessageBoxButton.OK, MessageBoxImage.Asterisk);
                return null;
            }
        }
    }
}
