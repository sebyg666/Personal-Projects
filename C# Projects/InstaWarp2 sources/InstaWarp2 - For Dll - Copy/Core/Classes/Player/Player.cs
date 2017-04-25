
namespace Core.Classes.Player
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.IO;
    using System.Diagnostics;
    using System.Threading;
    using System.Threading.Tasks;
    using System.Windows;
    using System.Windows.Controls;
    using System.Windows.Data;
    using System.Windows.Documents;
    using System.Windows.Input;
    using System.Windows.Media;
    using System.Windows.Media.Imaging;
    using System.Windows.Navigation;
    using System.Windows.Shapes;
    using System.Windows.Forms;
    using System.Drawing;
    using System.Drawing.Design;
    using Classes;
    using Classes.Player;
    using Delay;
    using System.Xml.Serialization;
    using System.Windows.Interop;
    
    /// <summary>
    /// Player (Partial Class)
    /// 
    /// Main player class definition that contains helpful functions and properties
    /// specific to the 
    /// </summary>
    public partial class Player
    {



        /// <summary>
        /// Position Direction Enumeration
        /// </summary>
        public enum PositionDirection
        {
            N = 0,
            S,
            E,
            W,
            NE,
            SE,
            NW,
            SW,
            Up,
            Down,
        }


        /// <summary>
        /// Default Constructor
        /// </summary>
        public Player()
        {
            process = null;
            pointerFactory = null;
            BackupName = "";
            playerExit = false;
            // Auto-detection initialization..
            IsDetectingPlayer = false;
            DetectedPlayerName = String.Empty;

            // GM Flag hack settings..
            UseGMFlag = false;

            // JAWait0 hack settings..
            UseJAWait0 = false;
            AutoDisableJAWait0Hack = false;

            // Speed hack settings..
            UseSpeedHack = false;
            SpeedAmount = 4.0f;
            SpeedAmountDisabled = 4.0f;
            AutoDisableSpeedHack = false;

            // Status hack settings..
            UseStatusHack = false;
            StatusMode = 0;
            AutoDisableStatusHack = false;

            // Z Coord hack settings.
            UseZCoordHack = false;
            LockedZCoord = 0.0f;
        }

        public bool playerExit
        {
            get;
            set;
        }

        /// <summary>
        /// Obtains the players current mob array pointer.
        /// </summary>
        /// <returns></returns>
        public  IntPtr GetPointer()
        {
            var tempBuffer = new byte[4];

            try
            {
                // Read the current NPCMAP pointer..
                if (!Memory.Peek(process, pointerFactory["NPCMAP" + process.MainWindowTitle ], tempBuffer))
                    throw new Exception("Failed to read NPCMAP pointer.");
                var npcmap = BitConverter.ToInt32(tempBuffer, 0);

                // Read the current OWNPOS pointer..
                if (!Memory.Peek(process, pointerFactory["OWNPOS" + process.MainWindowTitle], tempBuffer))
                    throw new Exception("Failed to read OWNPOS pointer.");
                var ownpos = BitConverter.ToInt32(tempBuffer, 0);

                // Read the players current NPCMAP index..
                if (!Memory.Peek(process, new IntPtr(ownpos + Globals.Instance.GetOffset("PTR_OWNPOS")), tempBuffer))
                    throw new Exception("Failed to read OWNPOS pointer.");
                ownpos = BitConverter.ToInt16(tempBuffer, 0);

                // Read the players current mob array pointer..
                if (!Memory.Peek(process, new IntPtr(npcmap + (ownpos * 4)), tempBuffer))
                    throw new Exception("Failed to read player mob pointer.");
                return (IntPtr)BitConverter.ToInt32(tempBuffer, 0);
            }
            catch
            {
                return IntPtr.Zero;
            }
        }

        /// <summary>
        /// Obtains the players current zone id.
        /// </summary>
        /// <returns></returns>
        public  Int16 GetZoneId()
        {
            // Read main map data pointer..
            var ptrBuffer = new byte[4];
            Memory.Peek(process, pointerFactory["ZONEID" + process.MainWindowTitle], ptrBuffer);
            Memory.Peek(process, (IntPtr)BitConverter.ToInt32(ptrBuffer, 0), ptrBuffer);

            // Read map id offset..
            var offBuffer = new byte[4];
            Memory.Peek(process, pointerFactory["ZONEID" + process.MainWindowTitle] + 7, offBuffer);

            // Read map id..
            var zoneBuffer = new byte[2];
            Memory.Peek(process, (IntPtr)BitConverter.ToInt32(ptrBuffer, 0) + BitConverter.ToInt32(offBuffer, 0), zoneBuffer);

            ZoneChangedEventArgs args = new ZoneChangedEventArgs();
            args.ZoneID = BitConverter.ToInt16(zoneBuffer, 0);
            args.PlayerName = BackupName;
            args.Player = this;

            if(zone != args.ZoneID)
            {
                zone = args.ZoneID;
                OnZoneChange(args);
            }
            

            return BitConverter.ToInt16(zoneBuffer, 0);
        }

        public short zone = 0;

        public event EventHandler<ZoneChangedEventArgs> ZoneChanged;

        protected virtual void OnZoneChange(ZoneChangedEventArgs e)
        {
            EventHandler<ZoneChangedEventArgs> handler = ZoneChanged;
            if (handler != null)
            {
                handler(this, e);
            }
        }


        /// <summary>
        /// Adjusts a players position with the given Co-Ordinates
        /// </summary>
        public  void GetCurrentLocation(out float posX, out float posY, out float posZ)
        {
            // Get the player pointer..
            var mobPtr = GetPointer();
            if (mobPtr == IntPtr.Zero)
            {
                posX = posY = posZ = 0;
                return;
            }
            // Read the warp struct pointer..
            var warpPtr = new byte[4];
            if (!Memory.Peek(process, mobPtr + Globals.Instance.GetOffset("MOB_WARP"), warpPtr))
            {
                posX = posY = posZ = 0;
                return;
            }

            // Read the players current position..
            var tempPosition = new byte[4];
            if (!Memory.Peek(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_1"), tempPosition))
            {
                posX = posY = posZ = 0;
                return;
            }
            var fPositionX = BitConverter.ToSingle(tempPosition, 0);
            posX = fPositionX;

            if (!Memory.Peek(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_1"), tempPosition))
            {
                posX = posY = posZ = 0;
                return;
            }
            var fPositionY = BitConverter.ToSingle(tempPosition, 0);
            posY = fPositionY;

            if (!Memory.Peek(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSZ_1"), tempPosition))
            {
                posX = posY = posZ = 0;
                return;
            }
            var fPositionZ = BitConverter.ToSingle(tempPosition, 0);
            posZ = fPositionZ;

        }
        /// <summary>
        /// Adjusts a players position with the given Co-Ordinates
        /// </summary>
        /// <param name="dir"></param>
        /// <param name="fAmount"></param>
        public  void WarpToPosition(float Xpos, float Ypos, float Zpos)
        {
            // Get the player pointer..
            var mobPtr = GetPointer();
            if (mobPtr == IntPtr.Zero)
                return;

            // Read the warp struct pointer..
            var warpPtr = new byte[4];
            if (!Memory.Peek(process, mobPtr + Globals.Instance.GetOffset("MOB_WARP"), warpPtr))
                return;

            //Xpos
            var adjustmentX = BitConverter.GetBytes(Xpos);
            Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_1"), adjustmentX);
            Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_2"), adjustmentX);
            //Ypos
            var adjustmentY = BitConverter.GetBytes(Ypos);
            Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_1"), adjustmentY);
            Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_2"), adjustmentY);
            //Zpos
            var adjustmentZ = BitConverter.GetBytes(Zpos);
            Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSZ_1"), adjustmentZ);
            Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSZ_2"), adjustmentZ);

        }
        /// <summary>
        /// Adjusts a players position with the given direction and amount.
        /// </summary>
        /// <param name="dir"></param>
        /// <param name="fAmount"></param>
        public  void AdjustPosition(PositionDirection dir, float fAmount)
        {
            // Cancel adjustment if we are detected and auto-disabled..
            if (IsDetectingPlayer && AutoDisablePositionHacks)
                return;

            // Get the player pointer..
            var mobPtr = GetPointer();
            if (mobPtr == IntPtr.Zero)
                return;

            // Read the warp struct pointer..
            var warpPtr = new byte[4];
            if (!Memory.Peek(process, mobPtr + Globals.Instance.GetOffset("MOB_WARP"), warpPtr))
                return;

            // Read the players current position..
            var tempPosition = new byte[4];
            if (!Memory.Peek(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_1"), tempPosition))
                return;
            var fPositionX = BitConverter.ToSingle(tempPosition, 0);

            if (!Memory.Peek(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_1"), tempPosition))
                return;
            var fPositionY = BitConverter.ToSingle(tempPosition, 0);

            if (!Memory.Peek(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSZ_1"), tempPosition))
                return;
            var fPositionZ = BitConverter.ToSingle(tempPosition, 0);

            switch (dir)
            {
                case PositionDirection.N:
                    {
                        var adjustment = BitConverter.GetBytes(fPositionY + fAmount);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_1"), adjustment);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_2"), adjustment);
                        break;
                    }
                case PositionDirection.S:
                    {
                        var adjustment = BitConverter.GetBytes(fPositionY - fAmount);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_1"), adjustment);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_2"), adjustment);
                        break;
                    }
                case PositionDirection.E:
                    {
                        var adjustment = BitConverter.GetBytes(fPositionX + fAmount);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_1"), adjustment);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_2"), adjustment);
                        break;
                    }
                case PositionDirection.W:
                    {
                        var adjustment = BitConverter.GetBytes(fPositionX - fAmount);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_1"), adjustment);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_2"), adjustment);
                        break;
                    }

                case PositionDirection.NW:
                    {
                        var fDistance = ((int)Math.Floor(fAmount % 2) == 0) ? fAmount / 2 : fAmount / 2 + 1;

                        var adjustmentX = BitConverter.GetBytes(fPositionX - fDistance);
                        var adjustmentY = BitConverter.GetBytes(fPositionY + fDistance);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_1"), adjustmentX);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_2"), adjustmentX);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_1"), adjustmentY);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_2"), adjustmentY);
                        break;
                    }
                case PositionDirection.NE:
                    {
                        var fDistance = ((int)Math.Floor(fAmount % 2) == 0) ? fAmount / 2 : fAmount / 2 + 1;

                        var adjustmentX = BitConverter.GetBytes(fPositionX + fDistance);
                        var adjustmentY = BitConverter.GetBytes(fPositionY + fDistance);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_1"), adjustmentX);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_2"), adjustmentX);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_1"), adjustmentY);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_2"), adjustmentY);
                        break;
                    }
                case PositionDirection.SW:
                    {
                        var fDistance = ((int)Math.Floor(fAmount % 2) == 0) ? fAmount / 2 : fAmount / 2 + 1;

                        var adjustmentX = BitConverter.GetBytes(fPositionX - fDistance);
                        var adjustmentY = BitConverter.GetBytes(fPositionY - fDistance);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_1"), adjustmentX);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_2"), adjustmentX);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_1"), adjustmentY);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_2"), adjustmentY);
                        break;
                    }
                case PositionDirection.SE:
                    {
                        var fDistance = ((int)Math.Floor(fAmount % 2) == 0) ? fAmount / 2 : fAmount / 2 + 1;

                        var adjustmentX = BitConverter.GetBytes(fPositionX + fDistance);
                        var adjustmentY = BitConverter.GetBytes(fPositionY - fDistance);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_1"), adjustmentX);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSX_2"), adjustmentX);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_1"), adjustmentY);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSY_2"), adjustmentY);
                        break;
                    }

                case PositionDirection.Up:
                    {
                        var adjustment = BitConverter.GetBytes(fPositionZ - fAmount);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSZ_1"), adjustment);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSZ_2"), adjustment);
                        break;
                    }
                case PositionDirection.Down:
                    {
                        var adjustment = BitConverter.GetBytes(fPositionZ + fAmount);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSZ_1"), adjustment);
                        Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpPtr, 0) + Globals.Instance.GetOffset("WARP_POSZ_2"), adjustment);
                        break;
                    }
            }
        }

        public string BackupName
        {
            get;
            set;
        }

        public  void Process(Process p)
        {
            process = p;
        }

        public  Process process
        { get; set; }

        public  void PointerFactory(PointerFactory p)
        {
            pointerFactory = p;
        }

        public  PointerFactory pointerFactory
        { get; set; }

        /// <summary>
        /// Gets the players name.
        /// </summary>
        public  String Name
        {
            get
            {
                var mobPtr = GetPointer();
                if (mobPtr != IntPtr.Zero)
                {
                    var nameBuffer = new byte[25];
                    Memory.Peek(process, mobPtr + Globals.Instance.GetOffset("MOB_NAME"), nameBuffer);

                    var entityName = Encoding.ASCII.GetString(nameBuffer);
                    var nameIndex = Array.FindIndex(entityName.ToCharArray(), c => !char.IsLetter(c));
                    if (nameIndex != -1)
                        entityName = entityName.Substring(0, nameIndex);

                    return entityName;
                }

                return "INVALID NAME";
            }
        }


        /// <summary>
        /// Gets or sets the players GM flag.
        /// </summary>
        public  Int32 GMFlag
        {
            get
            {
                var mobPtr = GetPointer();
                if (mobPtr != IntPtr.Zero)
                {
                    var flagBuffer = new byte[4];
                    Memory.Peek(process, mobPtr + Globals.Instance.GetOffset("MOB_FLAG"), flagBuffer);
                    return BitConverter.ToInt32(flagBuffer, 0);
                }

                return -1;
            }
            set
            {
                var mobPtr = GetPointer();
                if (mobPtr == IntPtr.Zero)
                    return;

                var flag = GMFlag;
                if (value == 0)
                {
                    if ((flag & 0x3800) != 0)
                        flag -= 0x3800;
                    Memory.Poke(process, mobPtr + Globals.Instance.GetOffset("MOB_FLAG"), BitConverter.GetBytes(flag));
                }
                else
                {
                    flag |= 0x3800;
                    Memory.Poke(process, mobPtr + Globals.Instance.GetOffset("MOB_FLAG"), BitConverter.GetBytes(flag));
                }
            }
        }

        /// <summary>
        /// Gets or sets the players current speed.
        /// </summary>
        public  float Speed
        {
            get
            {
                var mobPtr = GetPointer();
                if (mobPtr != IntPtr.Zero)
                {
                    var speedBuffer = new byte[4];
                    Memory.Peek(process, mobPtr + Globals.Instance.GetOffset("MOB_SPEED"), speedBuffer);
                    return BitConverter.ToSingle(speedBuffer, 0);
                }

                return 0.0f;
            }
            set
            {
                var mobPtr = GetPointer();
                if (mobPtr == IntPtr.Zero)
                    return;

                var speedBuffer = BitConverter.GetBytes(value);
                Memory.Poke(process, mobPtr + Globals.Instance.GetOffset("MOB_SPEED"), speedBuffer);
            }
        }

        /// <summary>
        /// Gets or sets the players current status.
        /// </summary>
        public  Int32 Status
        {
            get
            {
                var mobPtr = GetPointer();
                if (mobPtr != IntPtr.Zero)
                {
                    var statusBuffer = new byte[4];
                    Memory.Peek(process, mobPtr + Globals.Instance.GetOffset("MOB_STATUS"), statusBuffer);
                    return BitConverter.ToInt32(statusBuffer, 0);
                }

                return 0;
            }
            set
            {
                var mobPtr = GetPointer();
                if (mobPtr == IntPtr.Zero)
                    return;

                var statusBuffer = BitConverter.GetBytes(value);
                Memory.Poke(process, mobPtr + Globals.Instance.GetOffset("MOB_STATUS"), statusBuffer);
            }
        }

        /// <summary>
        /// Gets or sets the players current Z coord.
        /// </summary>
        public  float ZCoord
        {
            get
            {
                var mobPtr = GetPointer();
                if (mobPtr == IntPtr.Zero)
                    return 0.0f;

                var warpBuffer = new byte[4];
                if (!Memory.Peek(process, mobPtr + Globals.Instance.GetOffset("MOB_WARP"), warpBuffer))
                    return 0.0f;

                var tempPosition = new byte[4];
                if (!Memory.Peek(process, (IntPtr)BitConverter.ToInt32(warpBuffer, 0) + Globals.Instance.GetOffset("WARP_POSZ_1"), tempPosition))
                    return 0.0f;

                return BitConverter.ToSingle(tempPosition, 0);
            }
            set
            {
                var mobPtr = GetPointer();
                if (mobPtr == IntPtr.Zero)
                    return;

                var warpBuffer = new byte[4];
                if (!Memory.Peek(process, mobPtr + Globals.Instance.GetOffset("MOB_WARP"), warpBuffer))
                    return;

                var posBuffer = BitConverter.GetBytes(value);
                Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpBuffer, 0) + Globals.Instance.GetOffset("WARP_POSZ_1"), posBuffer);
                Memory.Poke(process, (IntPtr)BitConverter.ToInt32(warpBuffer, 0) + Globals.Instance.GetOffset("WARP_POSZ_2"), posBuffer);
            }
        }
    }
}