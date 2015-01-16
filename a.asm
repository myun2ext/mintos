[bits 16]
CALL	print_dot

; stack pointe setup
MOV	AX, 0x9000
MOV	SS, AX
MOV	SP, 0xFFFC

CALL	Setup_GDT

; A20
CALL	print_dot
CALL	Enable_A20

; Protected Mode
CALL	print_dot
CLI
JMP	0x8:start_pmode

HLT

%include "gdt.inc"
%include "a20.inc"

print_dot:
	MOV	AH, 0x0E	; Function
	MOV	AL, 0x2e	; Charactor Code
	MOV	BH, 0x00
	MOV	BL, 0x07	; Color
	INT	0x10
	RET

[BITS 32]
start_pmode:
	MOV	AX, 0x10
	MOV	SS, AX
	MOV	ES, AX
	MOV	FS, AX
	MOV	GS, AX
	MOV	DS, AX
	MOV	ESP, 90000h
	RET

TIMES 510 - ($ - $$) DB 0
DW 0xAA55
