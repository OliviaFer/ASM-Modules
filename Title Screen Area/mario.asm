$act_title_impl:
	JR RA
	SLL V0, R0, 0x0
	
$set_title_flag_on_mario:
	ADDIU SP, SP, 0xFFE8
	SW RA, 0x14 (SP)
	
		JAL $is_title_area
		NOP
		BEQ V0, R0, @@return
		NOP
			LI T1, 1
			SB T1, $is_title

	@@return:
	LW RA, 0x14 (SP)
	JR RA
	ADDIU SP, SP, 0x18

$hide_mario_set_action:
	ADDIU SP, SP, 0xFFE8
	SW RA, 0x14 (SP)
	
		LB T0, $is_title
		BEQ T0, R0, @@return
		NOP
			; Hide Mario
			LW T0, $g_mario_obj_ptr
			LHU T1, $o_gfx_flags (T0)
			ANDI T1, T1, 0xFFFE
			SH T1, $o_gfx_flags (T0)
			
			; Set Act
			LI A0, $g_mario
			LI A1, $ACT_TITLE
			JAL $set_mario_action
			SLL A2, R0, 0x0
	
	@@return:
	LW RA, 0x14 (SP)
	JR RA
	ADDIU SP, SP, 0x18