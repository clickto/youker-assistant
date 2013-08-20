#############################################################################
# Makefile for building: youker-assistant
# Generated by qmake (2.01a) (Qt 4.8.4) on: ?? 8? 20 11:29:27 2013
# Project:  youker-assistant.pro
# Template: subdirs
# Command: /usr/lib/i386-linux-gnu/qt4/bin/qmake -nocache QMAKE_CFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_LFLAGS_RELEASE=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_LFLAGS_DEBUG=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_STRIP=: PREFIX=/usr QMAKE_CXXFLAGS=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security -o Makefile youker-assistant.pro
#############################################################################

first: make_default
MAKEFILE      = Makefile
QMAKE         = /usr/lib/i386-linux-gnu/qt4/bin/qmake
DEL_FILE      = rm -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p
COPY          = cp -f
COPY_FILE     = $(COPY)
COPY_DIR      = $(COPY) -r
INSTALL_FILE  = install -m 644 -p
INSTALL_PROGRAM = install -m 755 -p
INSTALL_DIR   = $(COPY_DIR)
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p
SUBTARGETS    =  \
		sub-src \
		sub-qml \
		sub-backends

src//$(MAKEFILE): 
	@$(CHK_DIR_EXISTS) src/ || $(MKDIR) src/ 
	cd src/ && $(QMAKE) /home/jack/yj/Dev/youker-assistant/src/src.pro -nocache QMAKE_CFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_LFLAGS_RELEASE=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_LFLAGS_DEBUG=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_STRIP=: PREFIX=/usr QMAKE_CXXFLAGS=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security -o $(MAKEFILE)
sub-src-qmake_all:  FORCE
	@$(CHK_DIR_EXISTS) src/ || $(MKDIR) src/ 
	cd src/ && $(QMAKE) /home/jack/yj/Dev/youker-assistant/src/src.pro -nocache QMAKE_CFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_LFLAGS_RELEASE=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_LFLAGS_DEBUG=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_STRIP=: PREFIX=/usr QMAKE_CXXFLAGS=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security -o $(MAKEFILE)
sub-src: src//$(MAKEFILE) FORCE
	cd src/ && $(MAKE) -f $(MAKEFILE)
sub-src-make_default: src//$(MAKEFILE) FORCE
	cd src/ && $(MAKE) -f $(MAKEFILE) 
sub-src-make_first: src//$(MAKEFILE) FORCE
	cd src/ && $(MAKE) -f $(MAKEFILE) first
sub-src-all: src//$(MAKEFILE) FORCE
	cd src/ && $(MAKE) -f $(MAKEFILE) all
sub-src-clean: src//$(MAKEFILE) FORCE
	cd src/ && $(MAKE) -f $(MAKEFILE) clean
sub-src-distclean: src//$(MAKEFILE) FORCE
	cd src/ && $(MAKE) -f $(MAKEFILE) distclean
sub-src-install_subtargets: src//$(MAKEFILE) FORCE
	cd src/ && $(MAKE) -f $(MAKEFILE) install
sub-src-uninstall_subtargets: src//$(MAKEFILE) FORCE
	cd src/ && $(MAKE) -f $(MAKEFILE) uninstall
qml//$(MAKEFILE): 
	@$(CHK_DIR_EXISTS) qml/ || $(MKDIR) qml/ 
	cd qml/ && $(QMAKE) /home/jack/yj/Dev/youker-assistant/qml/qml.pro -nocache QMAKE_CFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_LFLAGS_RELEASE=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_LFLAGS_DEBUG=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_STRIP=: PREFIX=/usr QMAKE_CXXFLAGS=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security -o $(MAKEFILE)
sub-qml-qmake_all:  FORCE
	@$(CHK_DIR_EXISTS) qml/ || $(MKDIR) qml/ 
	cd qml/ && $(QMAKE) /home/jack/yj/Dev/youker-assistant/qml/qml.pro -nocache QMAKE_CFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_LFLAGS_RELEASE=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_LFLAGS_DEBUG=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_STRIP=: PREFIX=/usr QMAKE_CXXFLAGS=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security -o $(MAKEFILE)
sub-qml: qml//$(MAKEFILE) FORCE
	cd qml/ && $(MAKE) -f $(MAKEFILE)
sub-qml-make_default: qml//$(MAKEFILE) FORCE
	cd qml/ && $(MAKE) -f $(MAKEFILE) 
sub-qml-make_first: qml//$(MAKEFILE) FORCE
	cd qml/ && $(MAKE) -f $(MAKEFILE) first
sub-qml-all: qml//$(MAKEFILE) FORCE
	cd qml/ && $(MAKE) -f $(MAKEFILE) all
sub-qml-clean: qml//$(MAKEFILE) FORCE
	cd qml/ && $(MAKE) -f $(MAKEFILE) clean
sub-qml-distclean: qml//$(MAKEFILE) FORCE
	cd qml/ && $(MAKE) -f $(MAKEFILE) distclean
sub-qml-install_subtargets: qml//$(MAKEFILE) FORCE
	cd qml/ && $(MAKE) -f $(MAKEFILE) install
sub-qml-uninstall_subtargets: qml//$(MAKEFILE) FORCE
	cd qml/ && $(MAKE) -f $(MAKEFILE) uninstall
backends//$(MAKEFILE): 
	@$(CHK_DIR_EXISTS) backends/ || $(MKDIR) backends/ 
	cd backends/ && $(QMAKE) /home/jack/yj/Dev/youker-assistant/backends/backends.pro -nocache QMAKE_CFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_LFLAGS_RELEASE=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_LFLAGS_DEBUG=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_STRIP=: PREFIX=/usr QMAKE_CXXFLAGS=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security -o $(MAKEFILE)
sub-backends-qmake_all:  FORCE
	@$(CHK_DIR_EXISTS) backends/ || $(MKDIR) backends/ 
	cd backends/ && $(QMAKE) /home/jack/yj/Dev/youker-assistant/backends/backends.pro -nocache QMAKE_CFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_LFLAGS_RELEASE=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_LFLAGS_DEBUG=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_STRIP=: PREFIX=/usr QMAKE_CXXFLAGS=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security -o $(MAKEFILE)
sub-backends: backends//$(MAKEFILE) FORCE
	cd backends/ && $(MAKE) -f $(MAKEFILE)
sub-backends-make_default: backends//$(MAKEFILE) FORCE
	cd backends/ && $(MAKE) -f $(MAKEFILE) 
sub-backends-make_first: backends//$(MAKEFILE) FORCE
	cd backends/ && $(MAKE) -f $(MAKEFILE) first
sub-backends-all: backends//$(MAKEFILE) FORCE
	cd backends/ && $(MAKE) -f $(MAKEFILE) all
sub-backends-clean: backends//$(MAKEFILE) FORCE
	cd backends/ && $(MAKE) -f $(MAKEFILE) clean
sub-backends-distclean: backends//$(MAKEFILE) FORCE
	cd backends/ && $(MAKE) -f $(MAKEFILE) distclean
sub-backends-install_subtargets: backends//$(MAKEFILE) FORCE
	cd backends/ && $(MAKE) -f $(MAKEFILE) install
sub-backends-uninstall_subtargets: backends//$(MAKEFILE) FORCE
	cd backends/ && $(MAKE) -f $(MAKEFILE) uninstall

Makefile: youker-assistant.pro /usr/share/qt4/mkspecs/linux-g++/qmake.conf /usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/common/gcc-base.conf \
		/usr/share/qt4/mkspecs/common/gcc-base-unix.conf \
		/usr/share/qt4/mkspecs/common/g++-base.conf \
		/usr/share/qt4/mkspecs/common/g++-unix.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_phonon.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/release.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/unix/gdb_dwarf_index.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/qt.prf \
		/usr/share/qt4/mkspecs/features/unix/thread.prf \
		/usr/share/qt4/mkspecs/features/moc.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		/usr/share/qt4/mkspecs/features/include_source_dir.prf
	$(QMAKE) -nocache QMAKE_CFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_LFLAGS_RELEASE=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_LFLAGS_DEBUG=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_STRIP=: PREFIX=/usr QMAKE_CXXFLAGS=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security -o Makefile youker-assistant.pro
/usr/share/qt4/mkspecs/common/unix.conf:
/usr/share/qt4/mkspecs/common/linux.conf:
/usr/share/qt4/mkspecs/common/gcc-base.conf:
/usr/share/qt4/mkspecs/common/gcc-base-unix.conf:
/usr/share/qt4/mkspecs/common/g++-base.conf:
/usr/share/qt4/mkspecs/common/g++-unix.conf:
/usr/share/qt4/mkspecs/qconfig.pri:
/usr/share/qt4/mkspecs/modules/qt_phonon.pri:
/usr/share/qt4/mkspecs/features/qt_functions.prf:
/usr/share/qt4/mkspecs/features/qt_config.prf:
/usr/share/qt4/mkspecs/features/exclusive_builds.prf:
/usr/share/qt4/mkspecs/features/default_pre.prf:
/usr/share/qt4/mkspecs/features/release.prf:
/usr/share/qt4/mkspecs/features/default_post.prf:
/usr/share/qt4/mkspecs/features/unix/gdb_dwarf_index.prf:
/usr/share/qt4/mkspecs/features/warn_on.prf:
/usr/share/qt4/mkspecs/features/qt.prf:
/usr/share/qt4/mkspecs/features/unix/thread.prf:
/usr/share/qt4/mkspecs/features/moc.prf:
/usr/share/qt4/mkspecs/features/resources.prf:
/usr/share/qt4/mkspecs/features/uic.prf:
/usr/share/qt4/mkspecs/features/yacc.prf:
/usr/share/qt4/mkspecs/features/lex.prf:
/usr/share/qt4/mkspecs/features/include_source_dir.prf:
qmake: qmake_all FORCE
	@$(QMAKE) -nocache QMAKE_CFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_RELEASE=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_CXXFLAGS_DEBUG=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security\ -D_FORTIFY_SOURCE=2 QMAKE_LFLAGS_RELEASE=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_LFLAGS_DEBUG=-Wl,-Bsymbolic-functions\ -Wl,-z,relro QMAKE_STRIP=: PREFIX=/usr QMAKE_CXXFLAGS=-g\ -O2\ -fstack-protector\ --param=ssp-buffer-size=4\ -Wformat\ -Werror=format-security -o Makefile youker-assistant.pro

qmake_all: sub-src-qmake_all sub-qml-qmake_all sub-backends-qmake_all FORCE

make_default: sub-src-make_default sub-qml-make_default sub-backends-make_default FORCE
make_first: sub-src-make_first sub-qml-make_first sub-backends-make_first FORCE
all: sub-src-all sub-qml-all sub-backends-all FORCE
clean: sub-src-clean sub-qml-clean sub-backends-clean FORCE
distclean: sub-src-distclean sub-qml-distclean sub-backends-distclean FORCE
	-$(DEL_FILE) Makefile
install_subtargets: sub-src-install_subtargets sub-qml-install_subtargets sub-backends-install_subtargets FORCE
uninstall_subtargets: sub-src-uninstall_subtargets sub-qml-uninstall_subtargets sub-backends-uninstall_subtargets FORCE

sub-src-check: src/$(MAKEFILE)
	cd src/ && $(MAKE) -f $(MAKEFILE) check
sub-qml-check: qml/$(MAKEFILE)
	cd qml/ && $(MAKE) -f $(MAKEFILE) check
sub-backends-check: backends/$(MAKEFILE)
	cd backends/ && $(MAKE) -f $(MAKEFILE) check
check: sub-src-check sub-qml-check sub-backends-check

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all
install: install_subtargets  FORCE

uninstall:  uninstall_subtargets FORCE

FORCE:
