TOOLPATH = ../z_tools/
MAKE     = $(TOOLPATH)make.exe -r
NASK     = $(TOOLPATH)nask.exe
EDIMG    = $(TOOLPATH)edimg.exe
IMGTOL   = $(TOOLPATH)imgtol.com
COPY     = copy
DEL      = del


default :
	$(MAKE) img


ipl.bin : ipl.nas Makefile
	../z_tools/nask.exe ipl.nas ipl.bin ipl.lst


haribote.sys : haribote.nas Makefile
	$(NASK) haribote.nas haribote.sys haribote.lst

os.img : ipl.bin haribote.sys Makefile
	$(EDIMG) imgin:../z_tools/fdimg0at.tek \
	wbinimg src:ipl.bin len:512 from:0 to:0 \
	copy from:haribote.sys to:@: \
	imgout:os.img  

asm :
	../z_tools/make.exe -r ipl.bin

img :
	../z_tools/make.exe -r os.img

run :
	../z_tools/make.exe img
	copy os.img ..\z_tools\qemu\fdimage0.bin
	../z_tools/make.exe -C ../z_tools/qemu

install :
	../z_tools/make.exe img
	../z_tools/imgtol.com w a: os.img

clean :
	-del ipl.bin
	-del ipl.lst

src_only :
	../z_tools/make.exe clean
	-del os.img