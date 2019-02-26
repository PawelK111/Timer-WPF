using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
using System.Windows.Threading;
using System.Windows.Forms;

namespace Timer
{
    /// <summary>
    /// Logika interakcji dla klasy MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        NotifyIcon nI = new NotifyIcon();
        int counterNotify = 0;

        public MainWindow()
        {
            InitializeComponent();
            nI.Visible = false;
            nI.Icon = new System.Drawing.Icon("Vcferreira-Firefox-Os-Clock.ico");
            nI.Text = "Timer nie posiada ustawionej akcji.";
            nI.MouseClick += new System.Windows.Forms.MouseEventHandler(nI_Click);
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            DispatcherTimer timer = new DispatcherTimer();
            timer.Interval = new TimeSpan(0, 0, 1);
            timer.Tick += timer_Tick;
            timer.Start();
            for (int i = 0; i < 24; i++)
            {
                hoursset.Items.Add(i);
            }
            for(int i = 0; i < 60; i++)
            {
                if (i < 10)
                {
                    minset.Items.Add("0" + i);
                }
                else
                {
                    minset.Items.Add(i);
                }
            }
        }
        private void timer_Tick(object sender, EventArgs e)
        {
            clockLabel.Content = DateTime.Now.ToString("HH:mm");
            secondLabel.Content = DateTime.Now.ToString("ss");
            dateLabel.Content = DateTime.Now.ToString("MMM dd yyyy");
            dayLabel.Content = DateTime.Now.ToString("dddd");
            check_event();
        }
        private void DeleteActionButton_Click(object sender, RoutedEventArgs e)
        {
                timeEventLabel.Content = "";
                eventLabel.Content = "";
                DeleteActionButton.Visibility = Visibility.Hidden;
                nI.Text = "Timer nie posiada ustawionej akcji.";
        }
        private void SetAction_Click(object sender, RoutedEventArgs e)
        {
            counterNotify = 0;
            try
            {
                timeEventLabel.Content = hoursset.SelectedItem.ToString() + ":" + minset.SelectedItem.ToString();
                if (radioShutdown.IsChecked == true)
                {
                    eventLabel.Content = "SHUTDOWN: ";
                }
                else if (radioRestart.IsChecked == true)
                {
                    eventLabel.Content = "RESTART: ";
                }
                ErrorLabel.Content = "";
                DeleteActionButton.Visibility = Visibility.Visible;
            }
            catch
            {
                ErrorLabel.Content = "GODZINA NIE JEST USTAWIONA PRAWIDŁOWO!";
            }
        }
        void check_event()
        {
            if((string)timeEventLabel.Content == (string)clockLabel.Content)
            {
                timeEventLabel.Content = "";
                nI.Text = "Timer nie posiada ustawionej akcji.";
                DeleteActionButton.Visibility = Visibility.Hidden;
                if ((string)eventLabel.Content == "SHUTDOWN: ")
                {
                    eventLabel.Content = "";
                    System.Diagnostics.Process.Start("shutdown", "/s /t 0");
                    System.Windows.Application.Current.Shutdown();
                }
                else if((string)eventLabel.Content == "RESTART: ")
                {
                    eventLabel.Content = "";
                    System.Diagnostics.Process.Start("shutdown", "/r /t 0");
                    System.Windows.Application.Current.Shutdown();
                }
            }
        }

        private void nI_Click(object senter, System.Windows.Forms.MouseEventArgs e)
        {
            this.Show();
            this.WindowState = System.Windows.WindowState.Normal;
            nI.Visible = false;
        }

        private void On_StateChanged(object sender, EventArgs e)
        {
            if(this.WindowState == System.Windows.WindowState.Minimized)
            {
                this.Hide();
                nI.Visible = true;
                if(counterNotify <= 0 )
                {
                    if ((string)eventLabel.Content == "SHUTDOWN: ")
                    {
                        nI.Text = "Zaplanowano wyłączenie komputera o godz.: " + timeEventLabel.Content;
                        nI.ShowBalloonTip(500, "Zaplanowano akcję!", "Zaplanowano wyłączenie komputera o godzinie: " + timeEventLabel.Content, ToolTipIcon.Info);
                    }
                    else if ((string)eventLabel.Content == "RESTART: ")
                    {
                        nI.Text = "Zaplanowano restart komputera o godz.: " + timeEventLabel.Content;
                        nI.ShowBalloonTip(500, "Zaplanowano akcję!", "Zaplanowano ponowne uruchomienie komputera o godzinie: " + timeEventLabel.Content, ToolTipIcon.Info);
                    }
                    counterNotify++;
                }
            }
        }
        private void App_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if ((string)eventLabel.Content != "")
            {
                string wiadomosc = "Timer posiada uruchomioną akcję. " +
                    "Wyłączenie aplikacji spowoduje usunięcie akcji oraz zamknięcie aplikacji. " +
                    "Czy chcesz kontynuować? Jeżeli chcesz, aby aplikacja działała w tle, użyj funkcji 'minimalizuj'.";
                string naglowek = "Uruchomiona akcja!";
                if ((System.Windows.MessageBox.Show(wiadomosc, naglowek, MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.No))
                {
                    e.Cancel = true;
                }
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
    }
}
