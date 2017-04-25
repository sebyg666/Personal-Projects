
namespace Core.Classes
{
    using System;
    using System.Linq;

    public static class Helpers
    {
        /// <summary>
        /// Converts a hex string to a byte array.
        /// </summary>
        /// <param name="strPattern"></param>
        /// <returns></returns>
        public static byte[] HexStringToArray(String strPattern)
        {
            return Enumerable.Range(0, strPattern.Length)
                             .Where(x => x % 2 == 0)
                             .Select(x => Convert.ToByte(strPattern.Substring(x, 2), 16))
                             .ToArray();
        }
    }
}
