namespace Core.Classes.Player
{
    using System;
    using System.Linq;
    using System.Text;
    using System.Diagnostics;
    using System.Threading.Tasks;

    /// <summary>
    /// Player (Partial Class)
    /// 
    /// Auto-Detect 
    /// Contains definitions and properties used for detecting nearby players
    /// to allow hacks to auto-disable themselves.
    /// </summary>
    public partial class Player
    {
        /// <summary>
        /// Attempts to detect players to disable hacks when near others.
        /// </summary>
        public  void ScanForPlayers()
        {

            // Get the current zone id..
            var currZone = GetZoneId();

            // Are we Zoning..
            if (currZone == 0)
                isZoning = true;

            // Are we in an excluded zone..?
            if (UseExclusions)
            {
                // Zone Id Exceptions..
                if (Globals.Instance.Config.ExcludedZones.Any(z => Convert.ToInt16(z) == currZone))
                    return;
            }

            // Have we zoned?
            if ((isZoning && currZone != 0) || CurrentZone == 0)
            {
                // Set as detected..
                IsDetectingPlayer = true;
                ZoneCooldown = Globals.Instance.Config.ZoneDelay;
                DetectedPlayerName = string.Format(">> Zoning Cooldown {0}", ZoneCooldown);
                Timer = ZoneCooldown * 10;
                // Set the zone for next loop..
                CurrentZone = currZone;
                isZoning = false;

                return;
            }

            // Are we under a zone cooldown?
            if (ZoneCooldown != 0)
            {
                if (Timer != 0)
                {
                    Timer--;
                }
                if (Timer % 10 == 0)
                {
                    DetectedPlayerName = string.Format(">> Zoning Cooldown {0}", ZoneCooldown);
                    ZoneCooldown--;
                }
                return;
            }

            var tempBuffer = new byte[4];

            // Read the current NPCMAP pointer..
            if (!Memory.Peek(process, pointerFactory["NPCMAP" + process.MainWindowTitle], tempBuffer))
                return;
            var npcmap = BitConverter.ToInt32(tempBuffer, 0);

            // Loop the NPC map looking for players..
            for (var x = 0; x < 4000; x++)
            {
                if (playerExit)
                    break;
                // Read current pointer..
                Memory.Peek(process, (IntPtr)npcmap + (x * 4), tempBuffer);
                if (BitConverter.ToInt32(tempBuffer, 0) == 0)
                    continue;

                // Ensure this entity is a .
                var typeBuffer = new byte[1];
                Memory.Peek(process, (IntPtr)BitConverter.ToInt32(tempBuffer, 0) + Globals.Instance.GetOffset("MOB_TYPE"), typeBuffer);
                if (typeBuffer[0] != 0)
                {
                    var spawnBuffer = new byte[1];
                    Memory.Peek(process, (IntPtr)BitConverter.ToInt32(tempBuffer, 0) + Globals.Instance.GetOffset("MOB_SPAWNTYPE"), spawnBuffer);
                    if (spawnBuffer[0] != 1)
                        continue;
                }

                // Read the entity name..
                var nameBuffer = new byte[25];
                Memory.Peek(process, (IntPtr)BitConverter.ToInt32(tempBuffer, 0) + Globals.Instance.GetOffset("MOB_NAME"), nameBuffer);

                var entityName = Encoding.ASCII.GetString(nameBuffer);
                var nameIndex = Array.FindIndex(entityName.ToCharArray(), c => !char.IsLetter(c));
                if (nameIndex != -1)
                    entityName = entityName.Substring(0, nameIndex);

                // Check if name is valid..
                if (String.IsNullOrWhiteSpace(entityName) || entityName[0] == 0x00 || Name.Equals(entityName))
                    continue;

                if (UseExclusions)
                {
                    // Check if name is excluded..
                    var foundExcludedPlayer = Globals.Instance.Config.ExcludedPlayers.Any(p => p.ToLower() == entityName.ToLower());
                    if (foundExcludedPlayer)
                        continue;
                }

                // Read the entity visible flag..
                var visibleBuffer = new byte[4];
                Memory.Peek(process, (IntPtr)BitConverter.ToInt32(tempBuffer, 0) + Globals.Instance.GetOffset("MOB_RENDER"), visibleBuffer);
                //if (visibleBuffer[0] != 4 && visibleBuffer[0] != 8 &&
                //    visibleBuffer[0] != 12 && // Chocobo
                //    visibleBuffer[0] != 20 && visibleBuffer[0] != 28) // Fishing..?
                if ((BitConverter.ToInt32(visibleBuffer, 0) & 0x200) == 0)
                {
                    continue;
                }

                // Ignore players over 50 yalms away..
                var mobDistance = new byte[4];
                Memory.Peek(process, (IntPtr)BitConverter.ToInt32(tempBuffer, 0) + Globals.Instance.GetOffset("MOB_DISTANCE"), mobDistance);
                if (Math.Sqrt(BitConverter.ToSingle(mobDistance, 0)) > 50.0f)
                    continue;

                // Detected a .
                IsDetectingPlayer = true;
                DetectedPlayerName = entityName;
                return;
            }

            IsDetectingPlayer = false;
            DetectedPlayerName = String.Empty;
        }

        /// <summary>
        /// Gets or sets if the auto-detection found a 
        /// </summary>
        public bool IsDetectingPlayer { get; set; }

        /// <summary>
        /// Gets or sets the name of the detected 
        /// </summary>
        public string DetectedPlayerName { get; set; }

        /// <summary>
        /// Gets or sets if exclusions should be used when scanning for players.
        /// </summary>
        public bool UseExclusions { get; set; }

        /// <summary>
        /// Gets or sets the players current zone used to compare to the in-memory value.
        /// </summary>
        public short CurrentZone { get; set; }

        /// <summary>
        /// Gets or sets wether the player is zoning or not.
        /// </summary>
        public bool isZoning { get; set; }

        /// <summary>
        /// Gets or sets the current cooldown increment if the player has zoned already.
        /// </summary>
        public int ZoneCooldown { get; set; }

        /// <summary>
        /// Gets or sets the current cooldown increment if the player has zoned already.
        /// </summary>
        public int Timer { get; set; }
    }
}