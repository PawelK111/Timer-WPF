   M S B A M L   `   `   `  ����@  <Timer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:TimerTimer  5   	   O Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem 5   	       Timer.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   %localclr-namespace:Timer     5   	   V RMaterialDesignThemes.Wpf, Version=2.5.0.1205, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   3System&clr-namespace:System;assembly=mscorlib  5   	   -   5          �Name$  Timer��5   ?    � Title$ Timer��5
   	   
���   �$	��350��6*   $	��700��67    � WindowStartupLocation$ CenterScreen=�6Z    � 
ResizeMode$ CanMinimize=�6    � 	Resources 5         MenuOpen �� TargetProperty �� 
TargetName9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O� KeyTime O� Value  	MenuClose��%�  &	        &	 �     �� 5   
   .��5      U� $ (FrameworkElement.Height)�6,   $ NewActionGrid��6c   .\�5        $ 0��6'   $ 30Q�63     5      $ 0:0:0.5��6'   $	 310Q�69   5      5      �� 5   
   .��5      U� $ (FrameworkElement.Height)�6,   $ NewActionGrid��6b   .\�5        $ 0��6'   $	 310Q�63     5      $ 0:0:0.5��6'   $ 30Q�69   5      5      5      	 � Triggers	 5      :� 5   
   
 :� RoutedEvent$
 ButtonBase.Click��6    :� 
SourceName$ OpenActionMenu��66   .[�5      �� #��[  6   5      :� 5   
   $
 ButtonBase.Click��6   $ CloseActionMenu��66   .[�5      �� #��[ 6   5      .��5!      �  � ColumnDefinitions 5"   
   �� 5#      $
��178* �6   �� 5$      $
��169* �6   .+�5&   
   �� -   5         ��Name$ 
clockLabel��5&        DS-DIGI#��[ 6$   
��� � �$��  0:00��6W   $
��Left=�6h   $	��Top=�6�   $��	10,10,0,0q�6�   $	��138��6�   $	��333��6�   $	��144(�6�   $
��Bold"�6�   �� 5'   
   -   5        $ secondLabel��5'      #��[ 6%   
��� � �$��00��6Y   $
��Left=�6f   $	��Top=�6�   $��
348,89,0,0q�6�   $��48(�6�   $
��Bold"�6�   $��59��6�   $��59��6�    J� RenderTransformOrigin$ 
0.55,0.674&�6�   $��2��6  �� 5(   
   -   5        $ 	dateLabel��5(      #��[ 6$   
��� � �$��STY 01 2000��6X   $
��Left=�6n   $	��Top=�6�   $��
22,160,0,0q�6�   $��81��6�   $	��321��6�   $��60(�6�   $
��Bold"�6�   �� 5)   
   -   5        $ dayLabel��5)      #��[ 6"   
��� � �$��SOBOTA��6V   $
��Left=�6g   $	��Top=�6�   $��325,160,-2,0q�6�   $��81��6�   $	��371��6�   $��60(�6�   $
��Bold"�6�   $��2��6�   �� 5*   
   -   5        $ 
eventLabel��5*      #��[ 6$   $�� ��6E   
�������$
��Left=�6c   $��
22,235,0,0q�6~   $	��Top=�6�   $
��Bold"�6�   $��36(�6�   �� 5+   
   -   5        $ timeEventLabel��5+      #��[ 6(   $�� ��6I   
�������$
��Left=�6g   $��200,235,0,0q�6�   $	��Top=�6�   $
��Bold"�6�   $��36(�6�   �� 5,   
   -   5         ��Name$ DeleteActionButton��5,      $y�Hidden=�6-   $��DELETE EVENT!��6A   $
��Left=�6Y   $	��Top=�6t   $	��130��6�   $��118.724,246,0,0q�6�   
���   �$��1��6�   � 5-   
   -	   5         �Name$ NewActionGrid��5-      $��35��6&   ���	#FF252525$��Bottom=�6I   $��2��6d   .+�5.      	� -
   5         	�Name$ radioShutdown��5.      #��[ 61   $��Shutdown��6R   
�������$
��Left=�6x   $	��Top=�6�   $��	70,72,0,0q�6�   $��22(�6�   $��30��6�   $	��198��6�    d� 	IsChecked$
 TrueY�6�   	� 5/      -   5        $ radioRestart��5/      #��[ 60   $��Restart��6Q   
�������$
��Left=�6v   $	��Top=�6�   $��
70,107,0,0q�6�   $��22(�6�   $��30��6�   $	��226��6�   �� 50      -   5         ��Name$ hoursset��50      #��[ 6)   $
��Left=�6J   $	��Top=�6e   $��60��6}   $��
462,70,0,0q�6�   $��25��6�    �� 
IsReadOnly .  �� SelectedIndex$ 0��6�   �� 51      -   5        $ minset��51      #��[ 6(   $
��Left=�6I   $	��Top=�6d   $��60��6|   $��
527,70,0,0q�6�   $ 0.929,-0.187&�6�   $��25��6�    . $ 0��6�   �� 52      -   5        $ ActionTitleLabel��52      #��[ 6.   $��CHOOSE ACTION: ��6O   
��� � �$
��Left=�6{   $��	70,40,0,0q�6�   $	��Top=�6�   $
��Bold"�6�   $��22(�6�   �� 53      -   5        $ ComboBoxLabel��53      #��[ 6+   $��SET TIME��6L   
��� � �$
��Left=�6q   $	��Top=�6�   $��
442,40,0,0q�6�   $
��Bold"�6�   $��24(�6�   �� 54      -   5        $ 
ErrorLabel��54      #��[ 6(   $�� ��6I   
���  ��$
��Left=�6e   $��157,209,0,0q�6�   $	��Top=�6�   $
��Bold"�6�   $��22(�6�   �� 55      -   5        $��	SET EVENT��55      $
��Left=�6)   $	��Top=�6D   $	��160��6\   $��32��6h   $��266,246,0,0q�6t   ��56      �� 57      59      �� 5:      .+�5;      �� -   5        $ OpenActionMenu��5;      $��Bottom=�61   $
��Left=�6L   ��6g   Z� ��6}   Z� .��5<      '  !MaterialDesignThemes.Wpf.PackIcon  
�������$��Center=�6A   �  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.5.0.1205, Culture=neutral, PublicKeyToken=null]]   Kind$ ArrowUp=�6^   $	��700��6m   $��30��6z   5=      �� 5>      -   5        $ CloseActionMenu��5>      $��Bottom=�62   $
��Left=�6M   $y�	Collapsed=�6h   ��6   Z� ��6�   Z� .��5?        
�������$��Center=�6A   $ 	ArrowDown=�6^   $	��700��6o   $��30��6|   5@      5A      5B      5C      5D      