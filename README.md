# ArchLinux Dotfiles

This config setup is originally forked from Luke Smiths' [LARBS](https://github.com/LukeSmithxyz/LARBS)
as it stood in January 2019.


## Programs whose configs can be found here

+ i3 (i3-gaps)
+ i3blocks
+ neovim
+ bash
+ ranger
+ mutt/msmtp/offlineimap
+ calcurse
+ ncmpcpp and mpd (my main music player)
+ mpv
+ And many little scripts I use filed in the `~/.scripts/` directory

## More documentation

There is a full pdf description of the repository - readme.pdf.
This can be accessed by pressing `Super+F1` to view the document offline.

In the system, tutorial videos on different programs used can be accessed
with `Super+Shift+e`. These videos are from [Luke Smiths YouTube channel](https://youtube.com/c/LukeSmithxyz).

The command `getkeys` will also show basic key binds for different programs.

## Dynamic Configuration Files

Store your favorite or high-traffic directories in `~/.bmdirs` or your most
important config files in `~/.bmfiles` with keyboard shortcuts. When you add
things to theses files, vimrc will automatically run the `shortcuts` script
which will dynamically generate shortcuts for these in bash, ranger and
optionally qutebrowser and fish.

