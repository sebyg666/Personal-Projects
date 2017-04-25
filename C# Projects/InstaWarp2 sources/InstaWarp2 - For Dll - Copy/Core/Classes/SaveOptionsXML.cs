using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Serialization;
using System.IO;

namespace Core.Classes
{
    public class XmlSave
    {
        public static void SaveData(object IClass, string filename)
        {
            StreamWriter writer = null;
            try
            {
                XmlSerializer xmlSerializer = new XmlSerializer((IClass.GetType()));
                writer = new StreamWriter(filename);
                xmlSerializer.Serialize(writer, IClass);
            }
            finally
            {
                if (writer != null)
                    writer.Close();
                writer = null;
            }
        }
    }

    public class XmlLoad<T>
    {
        public static Type type;

        public XmlLoad()
        {
            type = typeof(T);
        }

        public T LoadData(string filename)
        {
            T result;
            XmlSerializer xmlserializer = new XmlSerializer(type);
            TextReader fs = new StreamReader(filename);
            result = (T)xmlserializer.Deserialize(fs);
            fs.Close();
            return result;
        }
    }
}
