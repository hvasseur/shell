#! /bin/zsh

#create sim link in Home directory
ln -s $PWD/zshrc .zshrc

#check the packet manager installed
if type yaourt > /dev/null; then
	PACKET_MANAGER=yaourt
elif type pacman > /dev/null; then
	PACKET_MANAGER=pacman
else
	echo "this deos not seems to be an Arch distribution... Aborting"
	exit
fi

#now simply install utils

#CTAGS
if !type ctags > /dev/null; then
	$PACKET_MANAGER -S ctags
fi

ln -s $PWD/ctagsrc .ctags
#build the ctags
echo "building tags for C development"
ctags -R --sort=0 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C -f utils -L /usr/include/string.h /usr/include/stdio.h /usr/include/stdlib.h
ctags -R --sort=0 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C -f network -L /usr/include/net/if.h /usr/include/netinet/in.h /usr/inclued/arpa/inet.h
ctags -R --sort=0 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C -f ioctl sys/ioctl.h
ctags -R --sort=0 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C -f socket sys/soket.h


#VIM
if !type vim > /dev/null; then
	$PACKET_MANAGER -S gvim
fi
	ln -s $PWD/vimrc .vimrc



#exit by launching a new shell
echo "all utils installed. Launching new shell"
zsh
