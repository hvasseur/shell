#
# Licence: GPL
# Created: $(date --rfc-2822)
# Main authors:
#     - $NAME <$EMAIL>
#
CC = gcc
CFLAGS= -Wall
LDFLAGS =
PREFIX = /usr/local

#Color your Makefile!
RED = "\033[31m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
PURPLE = "\033[35m"
NORMAL = "\033[0m"

all: ${DIR}

${DIR}: main.o
-include ${DIR}.d
$CURSOR

%.o: %.c
	@echo $(YELLOW)Building $@ with $^$(NORMAL)
	\$(COMPILE.c) -MMD -c -o \$@ \$<

clean:
	@echo $(RED)Removing all intermediate objects$(NORMAL)
	rm -f *.o *.d

distclean: clean
	@echo $(RED)Removing all generated objects$(NORMAL)	
	rm ${DIR}

install:
	@echo $(PURPLE)Install the library and associated headers$(NORMAL)
	install -s -D -m 755 ${DIR} \$(PREFIX)/bin
