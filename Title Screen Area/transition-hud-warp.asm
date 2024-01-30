$title_warp_timer:
.halfword 0
$warp_after_trans_timer:
.byte 0
$is_title:
.byte 0

$hide_hud:
	LB T0, $is_title
	BEQ T0, R0, @@return
	NOP
		LHU T0, 0x8033B26A
		ANDI T0, T0, 0xFFE0
		SH T0, 0x8033B26A
	@@return:
	#continue hide_hud
	NOP

;use fading transition instead of cutout star, if, user has chosen to
$initial_transition:
	ADDIU SP, SP, 0xFFE8
	SW RA, 0x14 (SP)
	.if $INITIAL_FADE
	LB T0, $is_title
	BNE T0, R0, @@returnxd
	NOP
	.endif
	#await initial_transition
	SW R0, 0x10 (SP)
	.if $INITIAL_FADE
	B @@return
	NOP
	
	@@returnxd:
	JAL 0x802CBBC4
	NOP
	.endif
	@@return:
	LW RA, 0x14 (SP)
	JR RA
	ADDIU SP, SP, 0x18

$play_or_not_sound: ;for r button
	ADDIU SP, SP, 0xFFE8
	SW RA, 0x14 (SP)
	
		LB T0, $is_title
		BNE T0, R0, @@return
		NOP
			#await play_or_not_sound
			NOP
	
	@@return:
	LW RA, 0x14 (SP)
	JR RA
	ADDIU SP, SP, 0x18

; Executes warp to the next screen, also does the fading to it
$transition_and_warp:
	ADDIU SP, SP, 0xFFE8
	SW RA, 0x14 (SP)
	
	LB T0, $is_title
	BEQ T0, R0, @@return
	NOP
	
		LH T0, $title_warp_timer
		ADDIU T0, T0, 1
		SH T0, $title_warp_timer
		
		SLTI T1, T0, $TIME_UNTIL_WARP
		BNE T1, R0, @@title_warp_questionable
		NOP
			;Activate Transitions
			.if $INITIAL_FADE == 0
			LHU T2, 0x8032DE6C	
			ADDIU T3, T2, 0xFFFF
			SH T3, 0x8032DE6C
			.endif
			
			LB T0, $warp_after_trans_timer
			LI T1, 10
			ADDIU T0, T0, 1
			SB T0, $warp_after_trans_timer
			BNE T1, T0, @@continue
			NOP
			
				.if $NEXT_SCREEN == 0
				JAL 0x80279BC8 ; Save File Reload
				NOP
				JAL $warp_special
				ADDIU A0, R0, -0x2 ; Mario Head
				B @@reset_everything
				NOP
				.else
				JAL 0x80279BC8 ; Save File Reload
				NOP
				JAL $warp_special
				ADDIU A0, R0, -0x9 ; File Select / First Level (see special-warp.asm)
				B @@reset_everything
				NOP
				.endif
			@@continue:
			ORI A0, R0, 0x1
			ORI A1, R0, 10 ;$fade_duration
			ORI A2, R0, $fade_red
			ORI A3, R0, $fade_green
			ORI AT, R0, $fade_blue
			JAL $play_transition
			SW AT, 0x10 (SP)
			B @@return
			NOP
			
			@@reset_everything:
			LI T1, 1
			SB T1, $title_done_once
			
			SB R0, $is_title
			SH R0, $title_warp_timer
			SB R0, $warp_after_trans_timer
			B @@return
			NOP
			
	@@title_warp_questionable:
	.if $INITIAL_FADE == 0
	SB R0, 0x8033BAB0
	.endif
	
	@@return:
	LW RA, 0x14 (SP)
	JR RA
	ADDIU SP, SP,  0x18