#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
MAN_DIR?=$(DESTDIR)$(PREFIX)/share/man
PROFILE_DIR=$(DESTDIR)$(PREFIX)/share/anzuiso

SCRIPT_FILES=$(wildcard configs/*/profiledef.sh) $(wildcard configs/*/airootfs/usr/local/bin/*)
VERSION?=$(shell git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/\.r0\.g.*//')

#sudo rm -rf build/
#sudo ./mkanzuiso -v -w build/ -o out/ configs/sway
#./run_anzuiso.sh -u -i out/anz-*.iso

all:

install: install-scripts install-profiles

install-scripts:
	install -vDm 755 ./mkanzuiso -t "$(BIN_DIR)/"
	install -vDm 755 ./run_anzuiso.sh "$(BIN_DIR)/run_anzuiso"

install-profiles:
	install -d -m 755 $(PROFILE_DIR)
	cp -a --no-preserve=ownership configs $(PROFILE_DIR)/

.PHONY: all install install-profiles install-scripts
