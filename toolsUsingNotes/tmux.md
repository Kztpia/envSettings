# concept module

>## server<br/>
>one server have serval sessions, server runs session in background. so you can detach from a session and attach into it any time and don't lose any previous state.<br/>besides, you can attach to your session from anywhere that can access you client, so you can continue you work from another place.
>>## session1
>>server have several sessions, each session can be attach with multiple clients
>>> ## window1
>>>each session have several windows, each window is a full screen in client's terminal
>>>>## pane1
>>>>each window have several panes, each pane refers a individual shell. When you use tmux to divide a screen into 4 parts, you actual create a window with 4 panes.
>>>>## pane2
>>>## window2
>>## session2

# pane interaction
Use <font size=4 color=#aoao00>tmux send-keys</font> command to control other pane through the tmux server.

# more acurate interaction
Use <font size=4 color=#aoao00>tmux list-(session|window|pane)</font> command with argument <font size=4 color=#aoao00>-F "#{<font size=4 color=00aoa0>variable name</font>}"</font>to check (session|window|pane) status, when you can give more acurate command to control tha (session|window|pane).

