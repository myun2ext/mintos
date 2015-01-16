[bits 16]
MOV	AH, 0x06
MOV	AL, 0x00
MOV	BH, 0x00
MOV	CH, 0x00
MOV	CL, 0x00
MOV	DH, 0x00
MOV	DL, 0x00
INT	0x10

MOV	AH, 0x0E
MOV	AL, 0x42
MOV	BH, 0x00
MOV	BL, 0x07
INT	0x10


MOV	AX, 0x9000
MOV	SS, AX
MOV	SP, 0xFFFC

CALL	Setup_GDT

CALL	Enable_A20


HLT

%include "gdt.inc"
%include "a20.inc"

TIMES 510 - ($ - $$) DB 0
DW 0xAA55
