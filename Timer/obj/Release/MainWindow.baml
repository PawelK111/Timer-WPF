   M S B A M L   `   `   `  ���� @  <Timer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:TimerTimer  O Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem     Timer.MainWindow   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     %localclr-namespace:Timer     V RMaterialDesignThemes.Wpf, Version=2.5.0.1205, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  3System&clr-namespace:System;assembly=mscorlib  -     �Name$  Timer�� � Title$ Timer��
���   �$	��350��$	��700�� � WindowStartupLocation$ CenterScreen=� � 
ResizeMode$ CanMinimize=� � 	Resources    MenuOpen �� TargetProperty �� 
TargetName9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O� KeyTime O� Value  	MenuClose��%  &	        &	 w     �� .��U� $ (FrameworkElement.Height)�$ NewActionGrid��.\�  $ 0��$ 30Q�  $ 0:0:0.5��$	 310Q��� .��U� $ (FrameworkElement.Height)�$ NewActionGrid��.\�  $ 0��$	 310Q�  $ 0:0:0.5��$ 30Q�	 � Triggers	 :� 
 :� RoutedEvent$
 ButtonBase.Click�� :� 
SourceName$ OpenActionMenu��.[��� #��[  :� $
 ButtonBase.Click��$ CloseActionMenu��.[��� #��[ .���  � ColumnDefinitions �� $
��178* ��� $
��169* �.+��� -    ��Name$ 
clockLabel��  DS-DIGI#��[ 
��� � �$��  0:00��$
��Left=�$	��Top=�$��	10,10,0,0q�$	��138��$	��333��$	��144(�$
��Bold"��� -   $ secondLabel��#��[ 
��� � �$��00��$
��Left=�$	��Top=�$��
348,89,0,0q�$��48(�$
��Bold"�$��59��$��59�� J� RenderTransformOrigin$ 
0.55,0.674&�$��2���� -   $ 	dateLabel��#��[ 
��� � �$��STY 01 2000��$
��Left=�$	��Top=�$��
22,160,0,0q�$��81��$	��321��$��60(�$
��Bold"��� -   $ dayLabel��#��[ 
��� � �$��SOBOTA��$
��Left=�$	��Top=�$��325,160,-2,0q�$��81��$	��371��$��60(�$
��Bold"�$��2���� -   $ 
eventLabel��#��[ $�� ��
�������$
��Left=�$��
22,235,0,0q�$	��Top=�$
��Bold"�$��36(��� -   $ timeEventLabel��#��[ $�� ��
�������$
��Left=�$��200,235,0,0q�$	��Top=�$
��Bold"�$��36(��� -    ��Name$ DeleteActionButton��$y�Hidden=�$��DELETE EVENT!��$
��Left=�$	��Top=�$	��120��$��118.724,246,0,0q�
���   �$��1��� -	    �Name$ NewActionGrid��$��35�����	#FF252525$��Bottom=�$��2��.+�	� -
    	�Name$ radioShutdown��#��[ $��Shutdown��
�������$
��Left=�$	��Top=�$��	70,72,0,0q�$��22(�$��30��$	��198�� d� 	IsChecked$
 TrueY�	� -   $ radioRestart��#��[ $��Restart��
�������$
��Left=�$	��Top=�$��
70,107,0,0q�$��22(�$��30��$	��226���� -    ��Name$ hoursset��#��[ $
��Left=�$	��Top=�$��60��$��
462,70,0,0q�$��25�� �� 
IsReadOnly . �� -   $ minset��#��[ $
��Left=�$	��Top=�$��60��$��
527,70,0,0q�$ 0.929,-0.187&�$��25�� . �� -   $ ActionTitleLabel��#��[ $��CHOOSE ACTION: ��
��� � �$
��Left=�$��	70,40,0,0q�$	��Top=�$
��Bold"�$��22(��� -   $ ComboBoxLabel��#��[ $��SET DATE AND TIME��
��� � �$
��Left=�$	��Top=�$��
442,40,0,0q�$
��Bold"�$��24(��� -   $ 
ErrorLabel��#��[ $�� ��
���  ��$
��Left=�$��157,209,0,0q�$	��Top=�$
��Bold"�$��22(��� -   $��	SET EVENT��$
��Left=�$	��Top=�$	��160��$��32��$��266,246,0,0q����� �� .+��� -   $ OpenActionMenu��$��Bottom=�$
��Left=���Z� ��Z� .��'  !MaterialDesignThemes.Wpf.PackIcon  
�������$��Center=��  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.5.0.1205, Culture=neutral, PublicKeyToken=null]]   Kind$ ArrowUp=�$	��700��$��30���� -   $ CloseActionMenu��$��Bottom=�$
��Left=�$y�	Collapsed=���Z� ��Z� .��  
�������$��Center=�$ 	ArrowDown=�$	��700��$��30��