bin_PROGRAMS = rot13-gtk
dist_rot13_gtk_SOURCES = main.vala rot13.vala
nodist_rot13_gtk_SOURCES = rot13-gtk.gresource.c

AM_VALAFLAGS = --pkg gtk+-3.0 --target-glib=2.38 --gresources ../ui/rot13-gtk.gresource.xml

rot13_gtk_CFLAGS = $(GTK3_CFLAGS)
rot13_gtk_LDFLAGS = $(GTK3_LIBS)
rot13-gtk.gresource.c: resources/rot13-gtk.gresource.xml
	$(GLIB_COMPILE_RESOURCES) --generate-source --sourcedir=$(srcdir)/resources --target $@ $<
all: rot13-gtk.gresource.c

EXTRA_DIST = resources/rot13.ui resources/rot13-gtk.gresource.xml

