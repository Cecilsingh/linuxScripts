#Create 50 text files, each 1mb, and delete them.
#Record the time taken to do so.
sudo dd if=/dev/zero of=file.out bs=1MB count=50
