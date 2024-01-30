; mostly copied vanilla code
BNE T8, AT, @@starcelebinit_1
NOP

	JAL 0x802A04C0
	ADDIU A0, R0, 0xCC ; Key Model ID
	
	LW T2, 0x80361160
	SW R0, 0xD0 (T2)
	
	LW T4, 0x80361160
	ORI T3, R0, 0xC000
	SW T3, 0xD8 (T4)
	
	LUI AT, 0x8034
	JAL 0x8029F430
	LWC1 F12, 0x8604 (AT)
	
	LW T6, 0x80361160
	ADDIU T5, R0, 0x1
	B @@return
	SW T5, 0xF4 (T6)

	@@starcelebinit_1:
	JAL 0x802A04C0
	ADDIU A0, R0, $STAR	; Star Model ID
	
	LW T0, 0x80361160
	SW R0, 0xD0 (T0)
	
	LW T1, 0x80361160
	SW R0, 0xD8 (T1)
	
	LUI AT, 0x8034
	JAL 0x8029F430
	LWC1 F12, 0x8608 (AT)
	
	LW T2, 0x80361160
	SW R0, 0xF4 (T2)

@@return:
LW RA, 0x14 (SP)
ADDIU SP, SP, 0x18
JR RA
NOP