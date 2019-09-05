TOPDIR=$(shell pwd)

CFLAGS := -fno-builtin -mips1 -mfp32 -D_KERNEL -DMEMSTART=0x80000000 -DMEMSIZE=0x04000 -DCPU_COUNT_PER_US=1000 -I $(TOPDIR)/include
CFLAGS += -fno-reorder-blocks -fno-reorder-functions -fno-pic -mno-abicalls

OBJDIR = ./obj

export TOPDIR AR CFLAGS
export CROSS_COMPILE ?= mipsel-linux-gnu-

all:
	make compile

compile: main.bin convert
	./convert main.bin ./
	mkdir -p $(OBJDIR)
	mv main.elf  $(OBJDIR)/.
	mv test.s    $(OBJDIR)/.
	mv main.bin  $(OBJDIR)/.
	mv *.coe     $(OBJDIR)/.
	mv *.mif     $(OBJDIR)/.

main.bin: main.elf
	${CROSS_COMPILE}objcopy -O binary -j .text -j .data $< $@ 

main.elf: start.o libisa.a 
	${CROSS_COMPILE}gcc -E -P -Umips -D_LOADER -U_MAIN $(CFLAGS) bin.lds.S -o bin.lds
	${CROSS_COMPILE}ld -g -T bin.lds -o $@ start.o -L . -lisa
	${CROSS_COMPILE}objdump -alD $@ > test.s

libisa.a:
	make -C isa $(TOPDIR)/$@

convert: convert.c
	gcc $(ALIGNED) -std=c99 -o convert convert.c

clean:
	rm -f *.o *.a 
	rm -rf obj
	make -C isa clean
	rm -f bin.lds convert

reset:
	make clean
	rm -f bin.lds convert

-include rules.make
