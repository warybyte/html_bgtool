# html_bgtool
Workstation background changer with the flexibility of a web page.

This might seem like a re-invention of Conky because it is. I tried Conky for about a year and never really got it to work exactly like I wanted. Being a novice to Lua scripting didn't help, so I went about using technology I'm more familiar with to accomplish something similar. Hopefully others find the idea useful!

The idea is simple: Use a dynamic webpage your desktop background instead of a static image.

Obviously most desktop UI managers allow for static image backgrounds and not URLs, so I set my manager to point to a specific image which is dynamically over-written every 'x' seconds by what ammounts to a screenshot of a status page. I run this process as a service when my system boots to make my background a dynamic HUD (heads up display) of my system and whatever else I want to monitor.

To start, you'll need to install the 'imgkit' library in your Python environment...as well as have a Python environment. It's a nifty wrapper for wkhtmltopdf which I installed using Pip. 

`pip3 install imgkit`

Next, install the wkhtmtopdf package (I'm in Debian, so APT is my package manager. Your *nix* may vary)

`apt-get install wkhtmltopdf`

After my install, I ran into issues with my image conversions which required 'xvfb' to resolve.

`apt-get install xvfb`

These all worked very well in Ubuntu 18. Your milage my vary depending on your version and repos.

To make my background a little more dynamic, I use something like the following to change the data every 15 seconds. Cron or Bash alias could work as well or even a systemctl service (I made mine a service), but you can test with the following to help with debugging.

`while true; do ~/bgtool/bg.sh; sleep 15; done`
