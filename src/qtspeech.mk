# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qtspeech
$(PKG)_WEBSITE   = $(qtbase_WEBSITE)
$(PKG)_DESCR    := Qt
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := 01526024437dfc1e4f652e0b883fc3333260321aacee4c51774018bf86bb99b0
$(PKG)_SUBDIR    = $(subst qtbase,qtspeech,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtspeech,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtspeech,$(qtbase_URL))
$(PKG)_DEPS     := gcc qtbase

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(BUILD_DIR)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake' '$(SOURCE_DIR)'
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install
endef