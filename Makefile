# libbiscuit
# shane tully (shane@shanetully.com)
# shanetully.com

CC=gcc
LANG=c

PROJ_NAME = libbiscuit
VERSION = "\"1.0.0\""

SO = $(PROJ_NAME).so
ARCHIVE = $(PROJ_NAME).a

SOURCES = $(wildcard src/*.c)
OBJECTS = $(SOURCES:.$(LANG)=.o)

INCLUDE_DIRS = -Iinclude/

CFLAGS = -std=c99 -Wall -Wextra $(INCLUDE_DIRS) -fPIC -DVERSION=$(VERSION) -D_BSD_SOURCE

DEBUG ?= 1
ifeq ($(DEBUG), 1)
	CFLAGS += -ggdb -DDEBUG
else
	CFLAGS += -O2
endif

.PHONY = all install remove clean

all: $(OBJECTS)
	$(CC) -shared -o bin/shared/$(SO) $^
	ar rcs bin/static/$(ARCHIVE) $(OBJECTS)

install:
	echo "Not implemented."

remove:
	rm $(INSTALL_DIR)$(BINARY)

.$(LANG).o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS)
	rm -f bin/shared/$(SO)
	rm -f bin/static/$(ARCHIVE)
