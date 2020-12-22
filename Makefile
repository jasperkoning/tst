entitlements = en.plist
name = tst
BUILD = .build
packagename = tst
files =  appdelegate.m rvc.xm main.m
flags = -I$(THEOS)/include -fobjc-arc
ldflags = -lsubstrate
frameworks = UIKit Foundation AudioToolbox IOKit
installdir = /Applications/tst.app
include /opt/theos/makefiles/jk.mk

package: $(BINARYDIR)/$(name)
	@mkdir -p $(BUILD)/$(packagename)/DEBIAN
	@cp control $(BUILD)/$(packagename)/DEBIAN/control
	@cp Resources/* $(BUILD)/$(packagename)/$(installdir)/
	@dpkg-deb --build $(BUILD)/$(packagename)

install:
	@dpkg -i $(BUILD)/$(packagename).deb

