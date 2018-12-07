# conceps module
fzf offser a interactive list which you can search its options fuzzily.

The list's options consis of every single line of fzf's input.

When you choose an options by pressing enter. fzf prints (or echo) the selected options as its output.

# customization
refer https://github.com/junegunn/fzf/blob/master/man/man1/fzf.1
or **man fzf** for details of options
## Custom input source
You have many optunities to process the selected line later, not too much to do to standerdize the input for fzf. Just redirect the output info to fzf with **|** will be fine.
## Preview window
fzf provide a window to show detail of your selection, for files, it might be its content, for commits, it might be its difference.
use --preview=**COMMAND** to tell fzf how to present a preview. In this command, **{}** is used to refer the current selection.

The manual use phase "COMMAND", but it works more like this: fzf create preview window which works like a shell, and run the **COMMAND** as a script in it, and **{}** refers to the only input argument for the script: the selected content. The **COMMAND** can actually contains more than one command.

So it would be a good idea to tune the output **COMMAND** in a stand alone script, and paste it after "--prevew=". fzf provide many alternative notations to avoid problems when prasing **COMMAND**, make good use of them.

--prevew-window can be used to customize the preview window. Like where to put the preview window or what its size should be.
## Make use of the chosen option
When deal with output from 'git status -s', the selection may be like "MM source.c". It may need some processing be it can be used as a argument for the successor, " echo {}|sed balabala " may be a good start.<br/>
fzf provide some option to do simple preprocessing to the selection. By option "-d ':' " fzf can divide a grep output into three part like:


filename<font color=red>{1} | divider(assgined by "-d") | line num<font color=red>{2} | diveder | line content<font color=red>{3}|
|:----:|:----:|:----|:----:|:---| 
|arch/arm/cpu/armv7/sunxi/psci.c|:|122|:|static void __secure sunxi_set_entry_address(void *entry)|

besides you can use option "-n <font color=red>3</font>" to limit the search region within part {3}.
        
## More actions
Choose by enter, and return it is only one default way to deal with the selection. 

It's possible to customize what to do with the selection and bind many keys to decide in which way to process the selection.
use --bind "**key**:**action**" to customize these. fzf provide some default actions, like: page up, page down. Like prevew, you can use "execute(**commmand**)" do more. Like preview, the **command** is more like a script than one command.

Attentation, dealt with variables carefully. When you send a option like --bind "enter: echo $var", the "$" active before fzf received the string, resulting that fzf keeps echo the same value because the action fzf actualy received is, for example,  "echo <font color=red>24</font>"(24 is the value when you run the fzf command). Yes, your variable is no longer variable for fzf by the time you run fzf command. So add "\\" properly so that variables are solved by the time fzf run that command, not the time you run fzf cmd.