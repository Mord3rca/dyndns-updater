
PREFIX ?= /usr/local
bindir ?= $(PREFIX)/bin
libdir ?= $(PREFIX)/lib

RM ?= rm
INSTALL ?= install

.PHONY: all install uninstall

# Avoid to call install target by default
all:

install:
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL) dyndns-updater $(DESTDIR)$(bindir)

	$(INSTALL) -d $(DESTDIR)$(libdir)/dyndns-updater
	$(INSTALL) lib/* $(DESTDIR)$(libdir)/dyndns-updater

uninstall:
	$(RM) -f $(DESTDIR)$(bindir)/dyndns-updater
	$(RM) -rf $(DESTDIR)$(libdir)/dyndns-updater
