; R800 mode switch for MSX Turbo R by GDX
;
; This routine can be executed under MSX-DOS or
; Basic (BLOAD"R800.COM",R)
;
; Entry: Nome
; Output: None
; Modify: All registers

CALSLT	equ	0001Ch
MNROM	equ	0fcc1h
MSXVER	equ	0002dh
RDSLT	equ	0000Ch

	db	0FEh
	dw	Start
	dw	Start+01bh	; No modify this address
	dw	Start	

	org	0F67Ah		; No modify this address
Start:
	ld	hl,MSXVER
	ld	hl,MSXVER
	ld	a,(0fcc1h)	; A = Main ROM Slot number
	call	RDSLT		; Read MSXVER
	cp	3
	ret	nz		; Back if not Turbo R
	ld	a,081h
	ld	ix,00180h
	ld	iy,(MNROM-1)
	jp	CALSLT		; Z80 mode
End: