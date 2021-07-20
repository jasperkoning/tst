entitlements = en.plist
name = tst
BUILD = .build
packagename = tst
files =  appdelegate.m rvc.mm main.m socketFromServer.m
flags = -I$(THEOS)/include -fobjc-arc -I/usr/include -I. -fvisibility=hidden
ldflags = -L/usr/local/include -linject
frameworks = UIKit Foundation AudioToolbox IOKit AppSupport
type = app
include /opt/theos/makefiles/jk.mk

