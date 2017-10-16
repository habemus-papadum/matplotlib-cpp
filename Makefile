FLAGS := $(shell python-config --cflags --ldflags) -I$(HOME)/anaconda3/lib/python3.6/site-packages/numpy/core/include

examples: minimal basic modern animation

minimal: examples/minimal.cpp matplotlibcpp.h
	cd examples && g++ -DWITHOUT_NUMPY minimal.cpp $(FLAGS) -o ../mpl.app/Contents/MacOS/minimal -std=c++11

basic: examples/basic.cpp matplotlibcpp.h
	cd examples && g++ basic.cpp $(FLAGS) -o ../mpl.app/Contents/MacOS/basic -std=c++11

modern: examples/modern.cpp matplotlibcpp.h
	cd examples && g++ modern.cpp $(FLAGS) -o ../mpl.app/Contents/MacOS/modern -std=c++11

animation: examples/animation.cpp matplotlibcpp.h
	cd examples && g++ animation.cpp $(FLAGS) -o ../mpl.app/Contents/MacOS/animation -std=c++11

