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
When deal with output from 'git status -s', the selection may be like "MM source.c". It may need some processing be it can be used as a argument for the successor, " echo {}|sed balabala " may be a good start.
## More actions
Choose by enter, and return it is only one default way to deal with the selection. 

It's possible to customize what to do with the selection and bind many keys to decide in which way to process the selection.
use --bind "**key**:**action**" to customize these. fzf provide some default actions, like: page up, page down. Like prevew, you can use "execute(**commmand**)" do more. Like preview, the **command** is more like a script than one command.