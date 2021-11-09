FNAME = mycc
INPUT = 123

CFLAGS=-std=c11 -g -static

$(FNAME): $(FNAME).c

test: $(FNAME)
	./test.sh

clean:
	rm -f $(FNAME) *.o *~ tmp*

.PHONY: test clean

# compile:
# 	cc -o $(FNAME) $(FNAME).c

# assemble: compile
# 	./$(FNAME) $(INPUT) > tmp.s

# testc: assemble
# 	chmod a+x test.sh
# 	./test.sh