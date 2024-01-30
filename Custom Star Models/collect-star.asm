; mostly copied vanilla code
	BEQ T4, R0, @@option2
	NOP

		JAL 0x802A04C0
		ADDIU A0, R0, $TRANSPARENT_STAR ; Transparent Star Model ID
		B @@sethitbox
		NOP

		@@option2:
		JAL 0x802A04C0
		ADDIU A0, R0, $STAR ; Star Model ID

	@@sethitbox:
	LUI A0, 0x8036
	LI.U A1, 0x80332784
	LI.L A1, 0x80332784
	JAL 0x802A34A4
	LW A0, 0x1160 (A0)

LW RA, 0x14 (SP)
ADDIU SP, SP, 0x20
JR RA
NOP