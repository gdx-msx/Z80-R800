; Z80 mode switch for MSX Turbo R by GDX
;
; This routine can be executed under MSX-DOS or
; Basic (BLOAD"Z80.COM",R)
;
; Entry: Nome
; Output: None
; Modify: All registers

CALSLT	equ	0001Ch
MNROM	equ	0FCC1h
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
	ld	a,(0FCC1h)	; A = Main ROM Slot number
	call	RDSLT		; Read MSXVER
	cp	3
	ret	nz		; Back if not Turbo R
	ld	a,080h
	ld	ix,00180h
	ld	iy,(MNROM-1)
	jp	CALSLT		; Z80 mode
End: