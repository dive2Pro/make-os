
# 默认动作

default :
	../z_tools/make.exe img

# 镜像文件生成

ipl.bin : ipl.nas Makefile
	../z_tools/nask.exe ipl.nas ipl.bin ipl.lst

# 这里的空格要注意，要直接定格换行
os.img : ipl.bin Makefile
	../z_tools/edimg.exe\
	imgin:../z_tools/fdimg0at.tek \
	wbinimg src:ipl.bin len:512 from:0 to:0   imgout:os.img  

# 其他指令

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