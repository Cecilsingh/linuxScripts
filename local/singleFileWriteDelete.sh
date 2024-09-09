#Use DD command to create a single file and delete it.
#Record the time taken to do so.
dd if=/dev/zero of=/home/test.img bs=512 count=1 oflag=dsync
