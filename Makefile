#Makefile for boot

#Program, flags, etc.
ASM			= nasm
DASM		= ndisasm
#ASMBFLAGS	= -I boot/include
ASMBFLAGS	:= -I boot/include/
ASMKFLAGS	= -I include/ -f elf
GCC			= gcc
GCCFLAGS	= -I include -c -m32 -fno-builtin
LD			= ld
LDFLAGS		= -m elf_i386 -s -Ttext $(ENTRYPOINT) 
ENTRYPOINT	= 0x30400

#This	Program
FISHOSBOOT	= boot/boot.bin	boot/loader.bin 
OBJS		= kernel/kernel.o kernel/start.o kernel/main.o kernel/i8259.o kernel/protect.o kernel/global.o lib/klibc.o lib/klib.o lib/string.o 
FISHOSKERNEL= kernel/kernel.bin

Directories	= boot include kernel lib
Files		= bochsrc.bxrc fishos.img format format.c Makefile MemeAndPage.inc README

#TEST		= kernel/kernel.bin

# All Phony Targets
.PHONY : everything clean all boot kernel

# Default starting position
everything : $(FISHOSBOOT) $(OBJS) $(FISHOSKERNEL)

# Create boot.bin and loader.bin
boot:	$(FISHOSBOOT)

# Create OBJS, which are kernel/kernel.o, kernel/start.o, lib/klib.o and lib/string.o.
objs: $(OBJS)

# Create kernel.bin
kernel:	$(FISHOSKERNEL)

# Remove all files
realclean:
	rm -f $(FISHOSBOOT) $(OBJS) $(FISHOSKERNEL)
# Remove boot.bin, loader.bin and kernel.bin
clean:
	rm -f $(FISHOSBOOT) $(FISHOSKERNEL)

# Remove boot.bin and loader.bin
cleanboot:
	rm -f $(FISHOSBOOT)

# Remove kernel.bin
cleankernel:
	rm -f $(FISHOSKERNEL)

# Remove OBJS, which are kernel/kernel.o, kernel/start.o, lib/klib.o and lib/string.o.
cleanobjs:
	rm -f $(OBJS)

# In this program, copy loader.bin and kernel.bin to boot.img.
buildimg:
	sudo losetup /dev/loop1 fishos.img
	mkdosfs -F32 -f 2 /dev/loop1
	sudo mount /dev/loop1 /mnt
	sudo cp -f boot/loader.bin /mnt
	sudo cp -f kernel/kernel.bin /mnt
	umount /mnt/
	sudo losetup -d /dev/loop1
	./format

# Firstly, clean boot.bin, loader.bin and kernel.bin. Secondly, create them again.
file : realclean everything

all	: file buildimg

commit: 

boot/boot.bin:	boot/boot.asm boot/include/FAT32Head.inc
			$(ASM) $(ASMBFLAGS) -o $@ $<

boot/loader.bin:	boot/loader.asm boot/include/FAT32Head.inc boot/include/pm.inc
			$(ASM) $(ASMBFLAGS) -o $@ $<

kernel/kernel.o:	kernel/kernel.asm include/sconst.inc
			$(ASM) $(ASMKFLAGS) -o $@ $<

lib/string.o:	lib/string.asm
			$(ASM) $(ASMKFLAGS) -f elf -o $@ $<

lib/klib.o:	lib/klib.asm
			$(ASM) $(ASMKFLAGS) -f elf -o $@ $<
lib/klibc.o:   lib/klib.c include/type.h include/const.h include/protect.h include/string.h include/proto.h include/global.h
			$(GCC) $(GCCFLAGS) -o $@ $<
kernel/start.o:	kernel/start.c include/type.h include/const.h include/protect.h include/string.h include/proto.h include/global.h include/proc.h
			$(GCC) $(GCCFLAGS) -o $@ $<

kernel/i8259.o: kernel/i8259.c include/type.h include/const.h include/protect.h include/proto.h include/global.h
			$(GCC) $(GCCFLAGS) -o $@ $<
	
kernel/protect.o: kernel/protect.c include/global.h include/type.h include/const.h include/protect.h
			$(GCC) $(GCCFLAGS) -o $@ $<

kernel/global.o: kernel/global.c include/type.h include/const.h include/protect.h include/proto.h include/global.h include/proc.h
			$(GCC) $(GCCFLAGS) -o $@ $<

kernel/main.o:	kernel/main.c include/global.h include/type.h include/proto.h include/const.h include/string.h include/protect.h include/proc.h
			$(GCC) $(GCCFLAGS) -o $@ $<

kernel/kernel.bin:	$(OBJS)
			$(LD) $(LDFLAGS) -o $(FISHOSKERNEL) $(OBJS)
