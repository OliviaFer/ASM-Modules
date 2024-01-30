@float_table_appear:
.incbin "./splash-table1.bin"
@float_table_hide:
.incbin "./splash-table2.bin"

bhv_title_area_logo:
	.word 0x11010001
	.word 0x0C000000, @splash_init
	.word 0x103D00FF
	.halfword 0x0100, $TIME_UNTIL_SPLASH
	.word 0x0C000000, @splash_sound
	.word 0x08000000
		.word 0x0C000000, @splash
	.word 0x09000000

bhv_title_area_tm_copyright:
	.word 0x11010001
	.halfword 0x0100, $TIME_UNTIL_TM
	.word 0x08000000
		.word 0x0C000000, @tm_loop
	.word 0x09000000

;0xF4, timer for both
@tm_loop:
	LW T0, $g_current_obj_ptr
	LH T0, 0xF4 (T0)
	SLTI T1, T0, 56
	BEQ T1, R0, @@elseif_hide
	NOP
		LW T0, $g_current_obj_ptr
		LW T1, $o_opacity (T0)
		ADDIU T1, T1, 26
		SLTI T2, T1, 256
		BEQ T2, R0, @@set_255
		NOP
		SW T1, $o_opacity (T0)
		B @@returnxd
		NOP
		@@set_255:
		LI T1, 255
		SW T1, $o_opacity (T0)
		B @@returnxd
		NOP
		
		@@elseif_hide:
		LW T0, $g_current_obj_ptr
		LW T1, $o_opacity (T0)
		ADDIU T1, T1, -18
		SLTI T2, T1, 0
		BNE T2, R0, @@set_0
		NOP
		SW T1, $o_opacity (T0)
		B @@returnxd
		NOP
		@@set_0:
		SW R0, $o_opacity (T0)
		SH R0, $o_active_flags (T0) 
		B @@return
		SH R0, 0xF4 (T0)
		
	@@returnxd:
	LW T0, $g_current_obj_ptr
	LH T1, 0xF4 (T0)
	ADDIU T1, T1, 1
	SH T1, 0xF4 (T0)
	
	@@return:
	JR RA
	NOP

@splash_init:
	LW T0, $g_current_obj_ptr
	SW R0, $o_scale_x (T0)
	SW R0, $o_scale_y (T0)
	JR RA
	SW R0, $o_scale_z (T0)
	
@splash_sound:
	LI A0, $SOUND
	J $play_sound
	NOP
	
@splash:
	LB T0, $is_title
	BEQ T0, R0, @@return
	NOP
		LI A0, @float_table_appear
		LI A1, @float_table_hide
		
		LW T9, $g_current_obj_ptr
		LH T0, 0xF4 (T9)
		SLL T1, T0, 0x2
		SUBU T1, T1, T0
		SLL A2, T1, 0x2
		
		LH T0, 0xF4 (T9)
		BLTZ T0, @@elseif_hold
		NOP
		SLTI T1, T0, 20
		BEQ T1, R0, @@elseif_hold
		NOP
			ADDU T1, A0, A2
			LW T0, $g_current_obj_ptr
			LWC1 F4, 0x0 (T1)
			SWC1 F4, $o_scale_x (T0)
			LWC1 F4, 0x4 (T1)
			SWC1 F4, $o_scale_y (T0)
			LWC1 F4, 0x8 (T1)
			B @@return_xd
			SWC1 F4, $o_scale_z (T0)
		
		@@elseif_hold:
		LW T9, $g_current_obj_ptr
		LH T0, 0xF4 (T9)
		SLTI T1, T0, 20
		BNE T1, R0, @@elseif_hide
		NOP
		SLTI T1, T0, 75
		BEQ T1, R0, @@elseif_hide
		NOP
			LI.S F4, 1
			LW T0, $g_current_obj_ptr
			SWC1 F4, $o_scale_x (T0)
			SWC1 F4, $o_scale_y (T0)
			B @@return_xd
			SWC1 F4, $o_scale_z (T0)
			
		@@elseif_hide:
		LW T9, $g_current_obj_ptr
		LH T0, 0xF4 (T9)
		SLTI T1, T0, 75
		BNE T1, R0, @@else_kill
		NOP
		SLTI T1, T0, 91
		BEQ T1, R0, @@else_kill
		NOP
			ADDU T1, A1, A2
			LW T0, $g_current_obj_ptr
			LWC1 F4, 0xFC7C (T1)
			SWC1 F4, $o_scale_x (T0)
			LWC1 F4, 0xFC80 (T1)
			SWC1 F4, $o_scale_y (T0)
			LWC1 F4, 0xFC84 (T1)
			SWC1 F4, $o_scale_z (T0)
			.if $DISABLE_TITLE_FADE == 0
			LW T1, $o_opacity (T0)
			ADDIU T1, T1, -13
			SW T1, $o_opacity (T0)
			.endif
			B @@return_xd
			NOP
		
		@@else_kill:
		LW T0, $g_current_obj_ptr
		SW R0, $o_scale_x (T0)
		SW R0, $o_scale_y (T0)
		SW R0, $o_scale_z (T0)
		SH R0, 0xF4 (T0)
		SH R0, $o_active_flags (T0)
		B @@return
		.if $DISABLE_TITLE_FADE == 0
		SW R0, $o_opacity (T0)
		.endif
	@@return_xd:
	LW T9, $g_current_obj_ptr
	LH T1, 0xF4 (T9)
	ADDIU T1, T1, 1
	SH T1, 0xF4 (T9)

	@@return:
	JR RA
	NOP