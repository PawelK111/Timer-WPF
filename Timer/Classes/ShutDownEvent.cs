using System.Diagnostics;

namespace Timer.Classes
{
    public class ShutDownEvent : TimerEvent
    {
        public ShutDownEvent(string c_time, string c_description) :base (c_time, c_description) { }
        public override bool P_CheckEvent(string clockTime)
        {
            if (P_Time == clockTime)
                return true;
            return false;
        }
        public override void P_ExecuteEvent()
        {
            if (P_Description == "shutdown")
                Process.Start("shutdown", "/s /t 0");
            else
                Process.Start("shutdown", "/r /t 0");
            System.Windows.Application.Current.Shutdown();
        }

    }
}
