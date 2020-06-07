#!/bin/sh
# Compares bn6f.gba and bn6f-lan-pervert.gba

# create bn6f.txt if necessary
if [ ! -f bn6f.txt ]; then
	hexdump -C bn6f.gba > bn6f.txt # can create an empty bn6f.txt if no bn6f.gba
fi

hexdump -C bn6f-lan-pervert.gba > bn6f-lan-pervert.txt

diff -u bn6f.txt bn6f-lan-pervert.txt | less
