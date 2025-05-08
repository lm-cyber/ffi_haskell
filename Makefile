GHC=ghc
GHC_RUNTIME_LINKER_FLAG=-L/home/void/.ghcup/ghc/9.6.7/lib/ghc-9.6.7/lib/x86_64-linux-ghc-9.6.7/ -lHSrts-1.0.2-ghc9.6.7

libffi-example.so: Example.o wrapper.o
	$(GHC) -o $@ -shared -dynamic -fPIC $^ $(GHC_RUNTIME_LINKER_FLAG)

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
