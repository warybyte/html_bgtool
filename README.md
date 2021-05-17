# html_bgtool
Workstation background changer with the flexibility of a web page.

This might seem like a re-invention of Conky because it is. I tried Conky for about a year and never really got it to work exactly like I wanted. Being a novice to Lua scripting didn't help, so I went about using technology I'm more familiar with to accomplish something similar. Hopefully others find the idea of converting an easily edited HTML/CSS file into a functional background.

To make my background a little more dynamic, I use something like the following to change the data every 15 seconds. Cron or Bash alias could work as well or even a systemctl service (I'm working on the latter for myself), whatever you like for running the shell script.

while true; do ~/bgtool/bg.sh; sleep 15; done
