CYLS	EQU		10
		ORG		0x7c00
		 10         JMP        entry
		DB        0x90
		DB        "HARIBOTE"        ; freeparam �����������ƿ�����������ַ�����8�ֽڣ�
		DW        512                ; ÿ��������sector���Ĵ�С������Ϊ512�ֽڣ�
		DB        1                ; �أ�cluster���Ĵ�С������Ϊ1��������
		DW        1                ; FAT����ʼλ�ã�һ��ӵ�һ��������ʼ��
		DB        2                ; FAT�ĸ���������Ϊ2��
		DW        224                ; ��Ŀ¼�Ĵ�С��һ�����224�
		DW        2880            ; �ô��̵Ĵ�С��������2880������
		DB        0xf0            ; ���̵����ࣨ������0xf0��
		DW        9                ; FAT�ĳ��ȣ�������9������
		DW        18                ; 1���ŵ���track���м���������������18��
		DW        2                ; ��ͷ����������2��
		DD        0                ; ��ʹ�÷�����������0
		DD        2880            ; ��дһ�δ��̴�С
		DB        0,0,0x29        ; ���岻�����̶�
		DD        0xffffffff        ; �������ǣ��������
		DB        "HARIBOTEOS "    ; freeparam ���̵����ƣ�11�ֽڣ�
		DB        "FAT12   "        ; ���̸�ʽ���ƣ�8�ֽڣ�
		RESB    18                ; �ȿճ�18�ֽ�

entry:
        MOV     AX,0            ; ��ʼ���Ĵ���
        MOV     SS,AX
        MOV     SP,0x7c00
        MOV     DS,AX
        MOV     ES,AX

        MOV     SI,msg
putloop:
        MOV     AL,[SI]
        ADD     SI,1            ; ��SI��1
        CMP     AL,0

        JE      fin
        MOV     AH,0x0e         ; ��ʾһ������
        MOV     BX,15           ; ָ���ַ���ɫ
        INT     0x10            ; �����Կ�BIOS
        JMP     putloop
fin:
        HLT                     ; ��CPUֹͣ���ȴ�ָ��
        JMP     fin             ; ����ѭ��

msg:
        DB      0x0a, 0x0a      ; ����2��
        DB      "hello, world"
        DB      0x0a            ; ����
        DB      0


		RESB	0x7dfe-$


		DB		0x55, 0xaa