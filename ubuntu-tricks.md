# Tips and tricks for fast Ubuntu:

### Manage startup applications
* Leave only the basic apps
* To show hidden programs: `sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop`
* Apps can be set to start with a delay

### Install preload (still TESTING)
* `preload` monitors the programs used frequently and starts them faster 

