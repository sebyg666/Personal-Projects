using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Serialization;

namespace Core.Classes
{
    public class Save
    {
        [XmlElement("UseGMFlag")]
        public bool UseGMFlag 
        { get; set; }

        [XmlElement("UseJAWait0")]
        public bool UseJAWait0 
        { get; set; }

        [XmlElement("AutoDisableJAWait0Hack")]
        public bool AutoDisableJAWait0Hack 
        { get; set; }


        // Speed hack settings..
        [XmlElement("UseSpeedHack")]
        public bool UseSpeedHack 
        { get; set; }

        [XmlElement("SpeedAmount")]
        public float SpeedAmount 
        { get; set; }

        [XmlElement("SpeedAmountDisabled")]
        public float SpeedAmountDisabled 
        { get; set; }

        [XmlElement("AutoDisableSpeedHack")]
        public bool AutoDisableSpeedHack 
        { get; set; }

        [XmlElement("UseExclusions")]
        public bool UseExclusions 
        { get; set; }

        [XmlElement("AutoDisablePositionHacks")]
        public bool AutoDisablePositionHacks
        { get; set; }

    }
}
