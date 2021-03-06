# Generated automatically from Makefile.in by configure.
# $Id: Makefile.in,v 1.2 2006-01-25 16:06:17 ynaka Exp $
# $Release: omnirpc-2.0.1 $
# $Copyright:
#  OmniRPC Version 1.0
#  Copyright (C) 2002-2004 HPCS Laboratory, University of Tsukuba.
#  
#  This software is free software; you can redistribute it and/or modify
#  it under the terms of the GNU Lesser General Public License version
#  2.1 published by the Free Software Foundation.
#  
#  Please check the Copyright and License information in the files named
#  COPYRIGHT and LICENSE under the top  directory of the OmniRPC Grid PRC 
#  System release kit.
#  
#  
#  $

all:	makeAll

#DIRS		=	./include ./src/libomrpc ./src/omrpc-agent ./src/omrpc-daemon \
#			./src/omrpc-gen ./src/omrpc-gen-xmp ./src/omrpc-gen-mpi ./src/omrpc-register \
#			./tools/tlogview ./tools/monitor ./src/omrpc-register-yml
DIRS		=	./include ./src/libomrpc ./src/omrpc-gen-mpi ./src/omrpc-gen-xmp ./src/omrpc-gen ./src/omrpc-register-yml

TESTDIRS	=	./test/exec-test ./test/call-test ./test/stub-test

EXAMPLEDIRS	=	./example/ep ./example/cpi ./example/knap

makeAll:
	for i in $(DIRS); do \
		(cd $$i; make); \
	done;

install:
	for i in $(DIRS); do \
		(cd $$i; make DESTDIR=$(DESTDIR) install); \
	done;

clean:
	for i in $(DIRS); do \
		(cd $$i; make clean); \
	done;
	for i in $(TESTDIRS); do \
		(cd $$i; make clean); \
	done;

distclean:
	for i in $(DIRS); do \
		(cd $$i; make distclean); \
	done;
	for i in $(TESTDIRS); do \
		(cd $$i; make distclean); \
	done;
	for i in $(EXAMPLEDIRS); do \
		(cd $$i; make distclean); \
	done;
	rm -rf config.* Makefile *~

Makefile::
	@if test -x ./config.status; then \
		sh ./config.status; \
	fi;

Makefiles:	Makefile


