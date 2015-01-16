;/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
;
; Set up GDT
;
; thanks for http://softwaretechnique.jp/OS_Development/kernel_loader2.html
;
;/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
[bits 16]
Setup_GDT:
	CLI
	PUSHA
	LGDT	[GDT_TOC]
	STI
	POPA
	RET

GDT_TOC:
	DW 4*8
	DD GDT
GDT:
	; Null descriptor
	DW 0x0000
	DW 0x0000
	DW 0x0000
	DW 0x0000

	; Code descriptor
	DB 0xFF			; Segment Limit
	DB 0xFF
	DW 0x0000		; Base Address
	DB 0x00
	DB 10011010b		; Type, S, DPL, P
	DB 11001111b		; Segment Limit Hi, AVL, 0, D/B, G
	DB 0			; Base Address Hi
	; Data descriptor
	DB 0xFF
	DB 0xFF
	DW 0x0000
	DB 0x00
	DB 10010010b
	DB 11001111b
	DB 0

	; TEMPORARY
	DW 0x0000
	DW 0x0000
	DW 0x0000
	DW 0x0000