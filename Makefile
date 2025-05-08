GHC=ghc

libffi-example.so: Example.o wrapper.o
	$(GHC) -o $@ -shared -dynamic -fPIC $^  -flink-rts 

Example_stub.h Example.o: Example.hs
	$(GHC) -c -dynamic -fPIC Example.hs

wrapper.o: wrapper.c Example_stub.h
	$(GHC) -c -dynamic -fPIC wrapper.c

clean:
	rm -f *.hi *.o *_stub.[ch]

clean-all:
	rm -f *.hi *.o *_stub.[ch] *.so


# Runs the example Python program
example: libffi-example.so
	python program.py
