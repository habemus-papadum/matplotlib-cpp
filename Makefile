ANACONDA3 := $(HOME)/anaconda3
FLAGS:=$(shell $(ANACONDA3)/bin/python3-config --cflags --ldflags) -I$(ANACONDA3)/lib/python3.6/site-packages/numpy/core/include -L$(ANACONDA3)/lib

LINK:=DYLD_INSERT_LIBRARIES=$(ANACONDA3)/lib/libpython3.6m.dylib:$(ANACONDA3)//lib/libmkl_intel_thread.dylib:$(ANACONDA3)/lib/libiomp5.dylib:$(ANACONDA3)/lib/libmkl_core.dylib

examples: minimal basic modern animation

minimal: examples/minimal.cpp matplotlibcpp.h
	cd examples && g++ -DWITHOUT_NUMPY minimal.cpp $(FLAGS) -o minimal -std=c++11
	@ $(LINK) ./examples/minimal

basic: examples/basic.cpp matplotlibcpp.h
	cd examples && g++ basic.cpp $(FLAGS) -o basic -std=c++11
	@ $(LINK) ./examples/basic

modern: examples/modern.cpp matplotlibcpp.h
	cd examples && g++ modern.cpp $(FLAGS) -o modern -std=c++11
	@ $(LINK) ./examples/modern

animation: examples/animation.cpp matplotlibcpp.h
	cd examples && g++ animation.cpp $(FLAGS) -o animation -std=c++11
	@ $(LINK) ./examples/animation

