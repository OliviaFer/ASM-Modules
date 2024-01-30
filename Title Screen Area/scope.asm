$is_title_area:
	LHU T0, $g_level_num
	LI T1, $TITLE_LEVEL
	BNE T0, T1, @@set_false
	NOP
	LHU T0, 0x8033BACA ;current area
	LI T1, $TITLE_AREA
	BNE T0, T1, @@set_false
	NOP
	JR RA
	ORI V0, R0, 1
	
	@@set_false:
	JR RA
	SLL V0, R0, 0x0