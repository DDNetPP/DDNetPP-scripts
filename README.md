# DDNetPP-scripts
A repo holding all scripts that run DDNet++

# Setup (not completed at all)

You need apache2 installed an running for the website.
```
cd /var/www/html/
git clone https://github.com/ChillerDragon/DDNet-web
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
git clone https://github.com/ChillerDragon/DDNetPP
```

For the supporter server panel on the website you have to edit ``visudo``
And add following lines:
```
www-data    ALL=(ALL)   NOPASSWD: /home/chiller/ddpp_database/web_scripts/init_restart.sh
www-data    ALL=(ALL)   NOPASSWD: /home/chiller/ddpp_database/web_scripts/cancle_restart.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /home/chiller/ddpp_database/web_scripts/github_update.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /home/chiller/ddpp_database/web_scripts/restart_bot_cb.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /home/chiller/ddpp_database/web_scripts/restart_bot_bl.sh
www-data    ALL=(chiller:chiller) NOPASSWD: /var/www/update_ddpp_scritps.sh
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
