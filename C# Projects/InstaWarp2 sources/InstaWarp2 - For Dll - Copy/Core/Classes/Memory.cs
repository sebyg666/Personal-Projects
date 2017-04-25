

namespace Core.Classes
{
    using System;
    using System.Diagnostics;
    using System.Runtime.InteropServices;

    /// <summary>
    /// Memory Helper Class
    /// 
    /// Wraps ReadProcessMemory and WriteProcessMemory API for easier usage.
    /// </summary>
    public static class Memory
    {
        /// <summary>
        /// Reads the amount of bytes from the given location.
        /// </summary>
        /// <param name="p"></param>
        /// <param name="lpAddress"></param>
        /// <param name="btBuffer"></param>
        /// <returns></returns>
        public static bool Peek(Process p, IntPtr lpAddress, byte[] btBuffer)
        {
            if (p == null || btBuffer == null || btBuffer.Length == 0)
                return false;

            var read = new IntPtr(0);
            return NativeMethods.ReadProcessMemory(p.Handle, lpAddress, btBuffer, (uint)btBuffer.Length, ref read);
        }

        /// <summary>
        /// Writes the given bytes to the given memory location.
        /// </summary>
        /// <param name="p"></param>
        /// <param name="lpAddress"></param>
        /// <param name="btBuffer"></param>
        /// <returns></returns>
        public static bool Poke(Process p, IntPtr lpAddress, byte[] btBuffer)
        {
            if (p == null)
                return false;

            var written = new IntPtr(0);
            return NativeMethods.WriteProcessMemory(p.Handle, lpAddress, btBuffer, (uint)btBuffer.Length, ref written);
        }
    }

    /// <summary>
    /// Internal NativeMethods Import Definitions
    /// 
    /// </summary>
    internal static class NativeMethods
    {
        /// <summary>
        /// kernel32.ReadProcessMemory Import
        /// </summary>
        /// <param name="hProcess"></param>
        /// <param name="lpBaseAddress"></param>
        /// <param name="lpBuffer"></param>
        /// <param name="nSize"></param>
        /// <param name="lpNumberOfBytesRead"></param>
        /// <returns></returns>
        [DllImport("kernel32.dll", SetLastError = true)]
        internal static extern bool ReadProcessMemory(
            IntPtr hProcess,
            IntPtr lpBaseAddress,
            [In, Out] byte[] lpBuffer,
            UInt32 nSize,
            ref IntPtr lpNumberOfBytesRead
            );

        /// <summary>
        /// kernel32.WriteProcessMemory Import
        /// </summary>
        /// <param name="hProcess"></param>
        /// <param name="lpBaseAddress"></param>
        /// <param name="lpBuffer"></param>
        /// <param name="nSize"></param>
        /// <param name="lpNumberOfBytesWritten"></param>
        /// <returns></returns>
        [DllImport("kernel32.dll", SetLastError = true)]
        internal static extern bool WriteProcessMemory(
            IntPtr hProcess,
            IntPtr lpBaseAddress,
            [In, Out] byte[] lpBuffer,
            UInt32 nSize,
            ref IntPtr lpNumberOfBytesWritten
            );
    }
}