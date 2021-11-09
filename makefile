FNAME = mycc
INPUT = 123

CFLAGS=-std=c11 -g -static

$(FNAME): $(FNAME).c

test: $(FNAME)
	./test.sh

clean:
	rm -f $(FNAME) *.o *~ tmp*

.PHONY: test clean

assemble: $(FNAME)
	./$(FNAME) $(INPUT) > tmp.s

chmod:
	chmod a+x test.sh