# This file is part of MXE.
# See index.html for further information.

PKG             := qtserialport
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := a60e2d2113c1c3895b71c901921f83b81e9b3c59e3620cf94bd8647730efa866
$(PKG)_SUBDIR    = $(subst qtbase,qtserialport,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtserialport,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtserialport,$(qtbase_URL))
$(PKG)_DEPS     := gcc qtbase

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    # invoke qmake with removed debug options as a workaround for
    # https://bugreports.qt-project.org/browse/QTBUG-30898
    cd '$(1)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake' CONFIG-='debug debug_and_release'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
