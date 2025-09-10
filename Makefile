
PREFIX ?= /usr/local
bindir ?= $(PREFIX)/bin
libdir ?= $(PREFIX)/lib
systemddir ?= $(libdir)/systemd/system

RM ?= rm
INSTALL ?= install

.PHONY: all install install-systemd uninstall uninstall-systemd

# Avoid to call install target by default
all:

install:
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL) dyndns-updater $(DESTDIR)$(bindir)

	$(INSTALL) -d $(DESTDIR)$(libdir)/dyndns-updater
	$(INSTALL) lib/* $(DESTDIR)$(libdir)/dyndns-updater

install-systemd:
	$(INSTALL) -D -m 600 systemd/config $(DESTDIR)/etc/dyndns-updater.conf
	$(INSTALL) -D -m 644 systemd/dyndns-updater.timer $(DESTDIR)$(systemddir)/dyndns-updater.timer
	$(INSTALL) -D -m 644 systemd/dyndns-updater.service $(DESTDIR)$(systemddir)/dyndns-updater.service

uninstall-systemd:
	$(RM) -f $(DESTDIR)/etc/dyndns-updater.conf
	$(RM) -f $(DESTDIR)$(systemddir)/dyndns-updater.timer
	$(RM) -f $(DESTDIR)$(systemddir)/dyndns-updater.service

uninstall: uninstall-systemd
	$(RM) -f $(DESTDIR)$(bindir)/dyndns-updater
	$(RM) -rf $(DESTDIR)$(libdir)/dyndns-updater
