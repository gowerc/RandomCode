

# Create a service file to run a command that
# prints the time

sudo cat <<'HERE' | sudo tee /etc/systemd/system/hellobob.service
[Unit]
Description=Echo hello bob with timestamp

[Service]
Type=oneshot
ExecStart=/bin/sh -c 'echo "hello bob $(date)"'
HERE

# Now create a timer file that runs that service
# every minute

cat <<'HERE' | sudo tee /etc/systemd/system/hellobob.timer 
[Unit]
Description=Run hellobob.service every minute

[Timer]
OnCalendar=*-*-* *:*:00
Unit=hellobob.service
# Should the service be run immediately if an event
# was missed due to shutdown or other interuption
Persistent=true

[Install]
WantedBy=timers.target
HERE


# Enable the service
sudo systemctl enable --now hellobob.timer

# Check the log
journalctl -u hellobob.service | grep 'sh\['


# Clean up
sudo systemctl disable hellobob.timer
sudo rm /etc/systemd/system/hellobob.service
sudo rm /etc/systemd/system/hellobob.timer



