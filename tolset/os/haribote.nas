; 有关 BOOT_INFO

CYLS    EQU     0x0ff0
LEDS    EQU     0x0ff1
VMODE   EQU     0x0ff2
SCRNX   EQU     0x0ff4  ; 分辨率 x
SCRNY   EQU     0x0ff6  ; 分辨率 y
VRAM    EQU     0x0ff8  ; 图像缓冲区的开始地址



        ORG     0xc200


        MOV     AL,0x13 ; VGA 显卡
        MOV     AH,0x00
        INT     0x10

        MOV     BYTE [VMODE],8     ;记录画面模式
        MOV     WORD [SCRNX],320
        MOV     WORD [SCRNY],200
        MOV     DWORD [VRAM],0x000a0000     ;用 bios 取得键盘上各种 LED 指示灯的状态
        MOV     AH,0x02
        INT     0x16        ; keyboard bios
        MOV     [LEDS],AL

fin:
        HLT
        JMP     fin