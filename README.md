# html_bgtool
Workstation background changer with the flexibility of a web page.

This might seem like a re-invention of Conky because it is. I tried Conky for about a year and never really got it to work exactly like I wanted. Being a novice to Lua scripting didn't help, so I went about using technology I'm more familiar with to accomplish something similar. Hopefully others find the idea and use of pretty common tools.

To start, you'll need to install the 'imgkit' library in your Python environment. It's a nifty wrapper for wkhtmltopdf which I installed using Pip. 

`pip3 install imgkit`

Next, install the wkhtmtopdf package (I'm in Debian, so APT is my package manager)

`apt-get install wkhtmltopdf`

After my install I ran into issues with my image conversions, so I needed to add xvfb.

`apt-get install xvfb`

These all worked very well in Ubuntu 18. Your milage my vary depending on your version and repos.

To make my background a little more dynamic, I use something like the following to change the data every 15 seconds. Cron or Bash alias could work as well or even a systemctl service (I made mine a service), but you can test with the following to help with debugging.

`while true; do ~/bgtool/bg.sh; sleep 15; done`
