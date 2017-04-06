
#!/bin/bash
#Backup data
#START
echo "Starting backup now..."
sleep 2
TIME=$(date '+%n-%d-%m-%y')  #add date to backup file
FILENAME=backup-$TIME.tar.gz #create backup filename format
EXCLUDE=--exclude "/dev" --exclude "/proc" --exclude "/sys" --exclude "/tmp" --$
SRCDIR=./ $EXCLUDE  #Source (part to backup)
DESDIR=/home/network/backup #Destination
sudo tar -cvpzf $DESDIR/$FILENAME $SRCDIR

if [ $? -eq 0 ]
then
  echo "Backup successful"
  echo"Backing up to other machine..."
  sleep 2
 # sudo scp -r /backup 192.168.1.12:/home/network/backup
  sleep 3

sudo tar -cvpzf $DESDIR/$FILENAME $SRCDIR

if [ $? -eq 0 ]
then
  echo "Backup successful"
  echo"Backing up to other machine..."
  sleep 2
 # sudo scp -r /backup 192.168.1.12:/home/network/backup
  sleep 3
  exit 0
else
  echo "Backup did not complete fully or failed"
  echo "Will back up partial backup file anyway..."
  sleep 2
 # sudo scp -r /backup 192.168.1.12:/home/network/backup
  sleep 2
  exit 1
fi
