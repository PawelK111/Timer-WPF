using System;
using System.Windows;
using System.Windows.Threading;
using System.Windows.Forms;
using Timer.Classes;

namespace Timer
{
    public partial class MainWindow : Window
    {
        DispatcherTimer timer = new DispatcherTimer();
        NotifyIcon nI = new NotifyIcon();
        ShutDownEvent shutDownEvent;
        bool notifyForEvent;

        public MainWindow()
        {
            InitializeComponent();
            nI.Visible = false;
            nI.Icon = new System.Drawing.Icon("Vcferreira-Firefox-Os-Clock.ico");
            nI.MouseClick += new MouseEventHandler(nI_Click);
            cleanLabels();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Tick += timer_Tick;
            timer.Start();

            for (int i = 0; i < 60; i++)
            {
                if (i < 24)
                {
                    hoursset.Items.Add(i);
                    if (i < 10)
                        minset.Items.Add("0" + i);
                    else
                        minset.Items.Add(i);
                }
                else
                    minset.Items.Add(i);
            }
        }

        private void timer_Tick(object sender, EventArgs e)
        {
            clockLabel.Content = DateTime.Now.ToString("HH:mm");
            secondLabel.Content = DateTime.Now.ToString("ss");
            dateLabel.Content = DateTime.Now.ToString("dd MM yyyy");
            dayLabel.Content = DateTime.Now.ToString("dddd");
            if(eventLabel.Content.ToString() != "")
                checkEvent();
        }

        private void DeleteActionButton_Click(object sender, RoutedEventArgs e)
        {
            deleteEvent();
        }

        private void SetAction_Click(object sender, RoutedEventArgs e)
        {
            string description = "";
            try
            {
                switch(radioShutdown.IsChecked)
                {
                    case true:
                        description = "shutdown";
                        break;
                    case false:
                        description = "restart";
                        break;
                }
                shutDownEvent = new ShutDownEvent(hoursset.SelectedItem.ToString() + ":" + minset.SelectedItem.ToString(), description);
                eventLabel.Content = description;
                DeleteActionButton.Visibility = Visibility.Visible;
                ErrorLabel.Content = "";
                timeEventLabel.Content = shutDownEvent.P_Time;
                notifyForEvent = true;
            }
            catch
            {
                ErrorLabel.Content = "THE TIME IS NOT SETTING CORRECT!";
            }
        }

        private void nI_Click(object senter, MouseEventArgs e)
        {
            Show();
            WindowState = WindowState.Normal;
            nI.Visible = false;
        }

        private void On_StateChanged(object sender, EventArgs e)
        {
            if (WindowState == WindowState.Minimized)
            {
                Hide();
                nI.Visible = true;

                if (notifyForEvent == true)
                {
                    nI.Text = "Event has been planned at: " + shutDownEvent.P_Time;
                    nI.ShowBalloonTip(500, "Event has been planned!", nI.Text, ToolTipIcon.Info);
                }
            }
        }

        private void App_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (eventLabel.Content.ToString() != "")
            {
                string[] messageBox = {"Are you sure? You have a planned event!\n Click minimize if you don't want to break your planned event.",
                    "The event still exist!"};
                if ((System.Windows.MessageBox.Show(messageBox[0], messageBox[1], MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.No))
                    e.Cancel = true;
            }
        }
        private void OpenActionMenu_Click(object sender, RoutedEventArgs e)
        {
            CloseActionMenu.Visibility = Visibility.Visible;
            OpenActionMenu.Visibility = Visibility.Collapsed;
        }
        private void CloseActionMenu_Click(object sender, RoutedEventArgs e)
        {
            CloseActionMenu.Visibility = Visibility.Collapsed;
            OpenActionMenu.Visibility = Visibility.Visible;
        }
        private void deleteEvent()
        {
            cleanLabels();
            shutDownEvent = null;
            GC.Collect();
            GC.WaitForPendingFinalizers();
        }
        private void cleanLabels()
        {
            notifyForEvent = false;
            timeEventLabel.Content = "";
            eventLabel.Content = "";
            nI.Text = "The Timer does not have set action.";
            DeleteActionButton.Visibility = Visibility.Hidden;
        }
        private void checkEvent()
        {
            if (shutDownEvent.P_CheckEvent((string)clockLabel.Content))
            {
                cleanLabels();
                shutDownEvent.P_ExecuteEvent();
            }
        }
    }
}
