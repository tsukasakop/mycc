FNAME = mycc
INPUT = '1+2+9-8'

CFLAGS=-std=c11 -g -static
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)

# $(FNAME): $(FNAME).c
$(FNAME): $(OBJS)
	$(CC) -o $(FNAME) $(OBJS) $(LDFLAGS)

$(OBJS): $(FNAME).h

test: $(FNAME)
	./test.sh $(FNAME)

clean:
	rm -f $(FNAME) *.o *~ tmp*

.PHONY: test clean

assemble: $(FNAME)
	./$(FNAME) $(INPUT) > tmp.s

chmod:
	chmod a+x test.sh