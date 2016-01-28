#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([rot13-gtk], [0.2], [newlandmatthew@msn.com])
AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])

# Checks for programs.

AC_PROG_CC
AC_PROG_RANLIB
AM_PROG_AR
AM_PROG_VALAC

AC_PATH_PROG([GLIB_COMPILE_RESOURCES], [glib-compile-resources], [no])   

if test x$GLIB_COMPILE_RESOURCES = xno; then
    AC_MSG_ERROR([glib-compile-resources cannot be fount in PATH.])
fi

AC_SUBST(GLIB_COMPILE_RESOURCES)

# Checks for libraries.

PKG_CHECK_MODULES([GTK3], [gtk+-3.0 >= 3.16])
PKG_CHECK_MODULES([GIO], [gio-2.0])

AC_CONFIG_FILES([Makefile
                 src/Makefile
                 data/Makefile])
AC_OUTPUT
