
;;
;;  Logic.ly Faster
;;
;;      Date:       February 17th, 2016
;;      Version:    0.1.0
;;      Author:     fyodorjung
;;      License:    Public Domain
;;

^+L::

    ;;
    ;;  Settings!
    ;;

    LogiclySexySpeed := 20
    ;
    ;   You can speed up the mouse movements with this setting. "0" is fastest
    ;   and "100" is slowest. Why wouldn't we just set it to the fastest? Well,
    ;   try it and see. When too fast, logic.ly's web demo (Javascript) doesn't
    ;   respond fast enough, e.g. animating their curvature, snapping the ends,
    ;   calculating any new flow of 1's and 0's, such that AutoHotkey's already
    ;   clicking the next node before it's ready, thus resulting in unconnected
    ;   nodes. It's possible that the desktop (installed) version responds much
    ;   faster, and also that you have a faster computer than mine. Any faster
    ;   than a speed of 15 for me and I get missed connections; your mileage may
    ;   vary. (Plus, you can always manually connect the one that it missed. Me
    ;   personally, I'd rather let it take its time and do it right while I send
    ;   a text.)
    ;   
    
    LogiclySexyTolerance := 5
    ;
    ;   If you keep getting an error about not making a straight-enough horizontal
    ;   or vertical line, increase this number to say, 10. If your name is Michael
    ;   J. Fox, then, say, 100.
    ;
    
    ;;
    ;;  Code!
    ;;
    
    InputBox nodes, Nodes, 0. Let's get started! How many wires (pairs of nodes) do you want to connect?
    
    If ( nodes <= 0 )
    {
        MsgBox Enter a positive number!
        Return
    }

    MsgBox 1. Great. Now, without clicking or hitting any keys, carefully position your mouse over the first node you want to connect. When you've done so, hit space or enter to close this message box and register its coordinates. The more you're zoomed in, the more accurate this will be. Do not zoom in or out or pan the field of view, or move or resize the window in any way during this process. If you accidentally do, just restart AutoHotkey and start over.
    
    CoordMode, Mouse, Screen
    MouseGetPos, pos_a1x, pos_a1y
    
    MsgBox 2. Cool. Now do the same for the last node you want to connect on the same component, i.e. position your mouse, then hit space or enter to close this message box and register its coordinates.
    
    CoordMode, Mouse, Screen
    MouseGetPos, pos_a2x, pos_a2y
    
    If ( Abs( pos_a1x - pos_a2x ) < LogiclySexyTolerance )
    {
        pos_a1x := (pos_a1x + pos_a2x) / 2
        delta_ay := (pos_a2y - pos_a1y) / (nodes - 1)
        delta_ax := 0
    }
    Else If ( Abs( pos_a1y - pos_a2y ) < LogiclySexyTolerance )
    {
        pos_a1y := (pos_a1y + pos_a2y) / 2
        delta_ax := (pos_a2x - pos_a1x) / (nodes - 1)
        delta_ay := 0
    }
    Else
    {
        MsgBox Sorry, your two clicks didn't form a straight-enough horizontal or vertical line... exiting.
        Return
    }
    
    MsgBox 3. Alright, now on to the second chip! Same procedure. Start with the first node you want to connect. Hit space or enter when you're ready.
    
    CoordMode, Mouse, Screen
    MouseGetPos, pos_b1x, pos_b1y
    
    MsgBox 4. Finally, for the second chip again, the last node you want to connect. Hit space or enter when you're ready.
    
    CoordMode, Mouse, Screen
    MouseGetPos, pos_b2x, pos_b2y

    If ( Abs( pos_b1x - pos_b2x ) < LogiclySexyTolerance )
    {
        pos_b1x := (pos_b1x + pos_b2x) / 2
        delta_by := (pos_b2y - pos_b1y) / (nodes - 1)
        delta_bx := 0
    }
    Else If ( Abs( pos_b1y - pos_b2y ) < LogiclySexyTolerance )
    {
        pos_b1y := (pos_b1y + pos_b2y) / 2
        delta_bx := (pos_b2x - pos_b1x) / (nodes - 1)
        delta_by := 0
    }
    Else
    {
        MsgBox Sorry, your two clicks didn't form a straight-enough horizontal or vertical line... exiting.
        Return
    }
    
    pos_a1x := floor(pos_a1x)
    pos_a2x := floor(pos_a2x)
    pos_a1y := floor(pos_a1y)
    pos_a2y := floor(pos_a2y)
    pos_b1x := floor(pos_b1x)
    pos_b2x := floor(pos_b2x)
    pos_b1y := floor(pos_b1y)
    pos_b2y := floor(pos_b2y)
    
    i := 0
    While ( i++ < nodes )
    {
        MouseClickDrag, Left, %pos_a1x%, %pos_a1y%, %pos_b1x%, %pos_b1y%, LogiclySexySpeed
        pos_a1x := pos_a1x + delta_ax
        pos_a1y := pos_a1y + delta_ay
        pos_b1x := pos_b1x + delta_bx
        pos_b1y := pos_b1y + delta_by
    }
    
    Return
