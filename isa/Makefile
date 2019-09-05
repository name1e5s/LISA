srcs = $(wildcard *.S)
objs = $(patsubst %.S, %.o, $(srcs))

$(TOPDIR)/libisa.a: $(objs)
	$(CROSS_COMPILE)$(AR) -cr  $@ $?

clean:
	rm -f *.o *.a *.s


-include $(TOPDIR)/rules.make
