FNAME = mycc
INPUT = '1+2+9-8'

CFLAGS=-std=c11 -g -static

$(FNAME): $(FNAME).c

test: $(FNAME)
	./test.sh $(FNAME)

clean:
	rm -f $(FNAME) *.o *~ tmp*

.PHONY: test clean

assemble: $(FNAME)
	./$(FNAME) $(INPUT) > tmp.s

chmod:
	chmod a+x test.sh