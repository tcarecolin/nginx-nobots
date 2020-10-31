HOME=$PWD
CONF=/etc/nginx/conf.d
URL=http://www.stopforumspam.com/downloads/bannedips.zip
ERROR=/var/log/nginx/error.log

[[ -f "$HOME/bannedips.zip" ]] && rm "$HOME/bannedips.zip"
wget -O "$HOME/bannedips.zip" "$URL"
unzip -o "$HOME/bannedips.zip" -d "$HOME"
[[ -f "$CONF/bannedips.conf" ]] && rm "$CONF/bannedips.conf"

while read -r -d , ip ; do
    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "deny $ip;" >> "$STORE/bannedips.conf"
    else
        echo "Can not deny '$ip', mismatching format" >> $ERROR
    fi
done < "$HOME/bannedips.csv"

service nginx reload