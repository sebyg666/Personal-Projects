using System;
using System.Net;
using System.Xml;
using System.Xml.Serialization;
using System.Windows.Forms;
using System.Windows;
using System.Windows.Controls;
using System.IO;

namespace InstaWarp2
{
    public class Update
    {
        internal static bool IsNewerThan(string currentVersion, string newVersion )
        {
            Version cVer = null;
            Version nVer = null;
            Version.TryParse(currentVersion, out cVer);
            Version.TryParse(newVersion, out nVer);
            if (cVer < nVer)
                return true;
            else if (cVer == nVer)
                return false;
            else
                return false;

        }

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

        internal static void Parse(Uri location)
        {
            try
            {
                // Load the document
                XmlDocument doc = new XmlDocument();
                doc.Load(location.AbsoluteUri);

                using (var reader = new XmlNodeReader(doc.DocumentElement))
                {
                    var serializer = new XmlSerializer(typeof(FilesToUpdate));
                    UpDateFile.Instance.File = (FilesToUpdate)serializer.Deserialize(reader);
                }
            }
            //catch { return null; }
            catch (Exception ex)
            {
                string strErrorMsg = "Something went wrong while updating! Error was:\r\n\r\n" + ex.ToString();
                System.Windows.MessageBox.Show(strErrorMsg, "Error", MessageBoxButton.OK, MessageBoxImage.Asterisk);
            }
        }
    }
}
