#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([rot13-gtk], [0.1.1], [newlandmatthew@msn.com])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])

# Checks for programs.

AC_PROG_CC
AM_PROG_VALAC

# Checks for libraries.

PKG_CHECK_MODULES([GTK3], [gtk+-3.0 >= 3.16])

AC_CONFIG_FILES([Makefile
                 src/Makefile
                 data/Makefile])
AC_OUTPUT
