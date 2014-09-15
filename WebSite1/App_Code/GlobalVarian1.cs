using System;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Contains my site's global variables.
/// </summary>
public static class Global1
{
    /// <summary>
    /// Global variable storing important stuff.
    /// </summary>
    public static int MaLichHencuaBenhNhan = -1;
    public static void Reset()
    {
        MaLichHencuaBenhNhan = -1;
    }

}