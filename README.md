# DDNetPP-scripts
A repo holding all scripts that run DDNet++

# Setup (not completed at all)

dependencys on debian based systems:
```
sudo apt install git php apache2 php-sqlite3 jq
```

You need apache2 installed an running for the website.
```
cd /var/www/html/
git clone https://github.com/DDNetPP/DDNet-web
```

Then you need the two server directorys
```
adduser chiller
su chiller
cd
mkdir chillblock
mkdir BlmapChill
mkdir git
cd git
git clone --recursive https://github.com/DDNetPP/DDNetPP
```

For the supporter server panel on the website you have to edit ``visudo``
And add following lines:
```
www-data    ALL=(ALL)   NOPASSWD: /home/chiller/ddpp_database/web_scripts/init_restart.sh
www-data    ALL=(ALL)   NOPASSWD: /home/chiller/ddpp_database/web_scripts/cancle_restart.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /home/chiller/ddpp_database/web_scripts/github_update.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /home/chiller/ddpp_database/web_scripts/restart_bot_cb.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /home/chiller/ddpp_database/web_scripts/restart_bot_bl.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /var/www/update_ddpp_scripts.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /home/chiller/ddpp_database/web_scripts/ddpp_shutdown_BlmapChill.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /home/chiller/ddpp_database/web_scripts/ddpp_shutdown_chillblock.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /home/chiller/ddpp_database/web_scripts/init_restart.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /home/chiller/ddpp_database/web_scripts/cancle_restart.sh

www-data    ALL=(chiller:chiller) NOPASSWD: /home/chiller/ddpp_database/web_scripts/test_srv/start.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /home/chiller/ddpp_database/web_scripts/test_srv/stop.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /home/chiller/ddpp_database/web_scripts/test_srv/github_update.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /home/chiller/ddpp_database/web_scripts/test_srv/github_update_tmp.sh
```

Add the update scripts update script:

``vim /var/www/update_ddpp_scripts.sh``


Add following bash code:

```
#!/bin/bash
if [ "$USER" != "chiller" ]
then
    echo "Error: you=$USER != ddpp=chiller"
    exit
fi

cd
cd ddpp_database
git pull
echo "<br/>done.</br>"
```

Add the user chiller as owner:
```
chown chiller /var/www/update_ddpp_scripts.sh
```

Create a ``web_scripts/status.private`` file containing a server name on each line. This is used for the server panel on the website to montitor uptime.
