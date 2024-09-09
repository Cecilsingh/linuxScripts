#Use DD command to create 1000 files and delete them.
#Record the time taken to do so.
dd if=/dev/zero of=/home/test.img bs=512 count=1000 oflag=dsync
