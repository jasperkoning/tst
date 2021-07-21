debname = jk.tst
kill_target = killall -9 tst
contents = /Applications/tst.app/tst
copy_resources = cp Resources/* build/tst/Applications/tst.app/
include /opt/default.mk

all: p i

CFLAGS = -I$(THEOS)/include -fobjc-arc -I/usr/include -I/opt/theos/vendor/include -I/usr/local/include -I. -fvisibility=hidden -c $< -o $@
build/%.o: %.mm
	$(compile_print) && $(CXX) $(CFLAGS)
build/%.o: %.m
	$(compile_print) && $(CC) $(CFLAGS)

%/tst: $(addprefix build/, appdelegate.o rvc.o main.o socketFromServer.o)
	$(link_print) && $(CXX) -L/usr/lib -F/System/Library/PrivateFrameworks $(addprefix -framework ,UIKit Foundation AudioToolbox AppSupport IOKit) -lsubjk -L/usr/local/lib -linject $^ -o $@
	ldid -Sen.plist $@
