using System.Linq;

namespace Timer.Classes
{
    public abstract class TimerEvent
    {
        public string P_Description { get; private set; }
        public string P_Time { get; set; }
        public string P_Minute { get; private set; }

        public TimerEvent(string c_time, string c_description)
        {
            P_Description = c_description;
            P_Time = c_time;
            P_Minute = c_time.Split(':').Last();
        }

        public abstract bool P_CheckEvent(string clockTime);
        public abstract void P_ExecuteEvent();
    }
}
