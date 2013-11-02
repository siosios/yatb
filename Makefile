CPPFLAGS = -W -Wall -g -m32 -I/usr/local/ssl/include -Iinclude

.cc.o   :
	 g++ -c $(CPPFLAGS) $< -o $@

all:
	@echo "To compile yatb type"
	@echo "  - 'make linux' (linux-debug,linux-static,linux-debug-static) to compile under linux"
	@echo "  - or 'make bsd' (bsd-debug,bsd-static,bsd-debug-static) to compile under bsd"
	@echo "  - or 'make cygwin' (cygwin-debug,cygwin-static,cygwin-debug-static) to compile under cygwin"
	@echo "  - or 'make solaris' (solaris-debug,solaris-static,solaris-debug-static) to compile under solaris"
	@echo "  - or 'make clean'"

linux: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -lpthread -lcrypto -o bin/yatb; strip bin/yatb
	g++ src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt -lssl -lcrypto -lpthread; strip bin/blowcrypt
	g++ src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck -lssl -lcrypto -lpthread; strip bin/bnccheck

linux-debug: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -lpthread -lcrypto -o bin/yatb-debug
	g++ src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt-debug -lssl -lcrypto -lpthread
	g++ src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck-debug -lssl -lcrypto -lpthread

linux-static: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ -static src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -lpthread -lcrypto -o bin/yatb-static; strip bin/yatb-static
	g++ -static src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt-static -lssl -lcrypto -lpthread; strip bin/blowcrypt-static
	g++ -static src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck-static -lssl -lcrypto -lpthread; strip bin/bnccheck-static

linux-debug-static: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ -static src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -lpthread -lcrypto -o bin/yatb-static-debug
	g++ -static src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt-static-debug -lssl -lcrypto -lpthread
	g++ -static src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck-static-debug -lssl -lcrypto -lpthread

bsd: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -pthread -lcrypto -o bin/yatb; strip bin/yatb
	g++ src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt -lssl -lcrypto -pthread; strip bin/blowcrypt
	g++ src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck -lssl -lcrypto -pthread; strip bin/bnccheck
	
bsd-debug: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -pthread -lcrypto -o bin/yatb-debug
	g++ src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt-debug -lssl -lcrypto -pthread
	g++ src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck-debug -lssl -lcrypto -pthread

bsd-static: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ -static src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -pthread -lcrypto -o bin/yatb-static; strip bin/yatb-static
	g++ -static src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt-static -lssl -lcrypto -pthread; strip bin/blowcrypt-static
	g++ -static src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck-static -lssl -lcrypto -pthread; strip bin/bnccheck-static

bsd-debug-static: src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ -static src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -pthread -lcrypto -o bin/yatb-static-debug
	g++ -static src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt-static-debug -lssl -lcrypto -pthread
	g++ -static src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck-static-debug -lssl -lcrypto -pthread

cygwin: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -lpthread -lcrypto -o bin/yatb; strip bin/yatb.exe
	g++ src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt -lssl -lcrypto -lpthread; strip bin/blowcrypt.exe
	g++ src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck -lssl -lcrypto -lpthread; strip bin/bnccheck.exe

cygwin-debug: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -lpthread -lcrypto -o bin/yatb-debug
	g++ src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt-debug -lssl -lcrypto -lpthread
	g++ src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck-debug -lssl -lcrypto -lpthread

cygwin-static: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ -static src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -lpthread -lcrypto -o bin/yatb-static; strip bin/yatb-static.exe
	g++ -static src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt-static -lssl -lcrypto -lpthread; strip bin/blowcrypt-static.exe
	g++ -static src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck-static -lssl -lcrypto -lpthread; strip bin/bnccheck-static.exe

cygwin-debug-static: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ -static src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -lpthread -lcrypto -o bin/yatb-static-debug
	g++ -static src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt-static-debug -lssl -lcrypto -lpthread
	g++ -static src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck-static-debug -lssl -lcrypto -lpthread

solaris: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -lpthread -lcrypto -o bin/yatb; strip bin/yatb
	g++ src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt -lssl -lcrypto -lpthread; strip bin/blowcrypt
	g++ src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck -lssl -lcrypto -lpthread; strip bin/bnccheck

solaris-debug: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ src/fxpiplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -lpthread -lcrypto -o bin/yatb-debug
	g++ src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt-debug -lssl -lcrypto -lpthread
	g++ src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck-debug -lssl -lcrypto -lpthread

solaris-static: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ -static src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -lpthread -lcrypto -o bin/yatb-static; strip bin/yatb-static
	g++ -static src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt-static -lssl -lcrypto -lpthread; strip bin/blowcrypt-static
	g++ -static src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck-static -lssl -lcrypto -lpthread; strip bin/bnccheck-static

solaris-debug-static: src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/controlthread.o src/datathread.o src/config.o src/tls.o src/stringlist.o src/tools.o src/lock.o src/blowcrypt.o src/bnccheck.o
	g++ -static src/fxpiplist.o src/iplist.o src/yatb.o src/forward.o src/counter.o src/config.o src/controlthread.o src/datathread.o src/tls.o src/stringlist.o src/tools.o src/lock.o -lssl -lpthread -lcrypto -o bin/yatb-static-debug
	g++ -static src/blowcrypt.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/blowcrypt-static-debug -lssl -lcrypto -lpthread
	g++ -static src/bnccheck.o src/config.o src/lock.o src/counter.o src/tools.o -o bin/bnccheck-static-debug -lssl -lcrypto -lpthread

       
clean:
	@(rm -f bin/yatb bin/blowcrypt bin/yatb-static bin/blowcrypt-static bin/yatb-debug bin/blowcrypt-debug bin/yatb-static-debug bin/blowcrypt-static-debug bin/bnccheck bin/bnccheck-static bin/bnccheck-debug bin/bnccheck-static-debug bin/*.exe src/*.o)
	@(echo "Clean succesful")
