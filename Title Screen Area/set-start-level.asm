$title_done_once:
.byte 0
.align 4

$set_title_done: ;for file select and mario head in case boot to screen is changed to another option
	LI T1, 1
	SB T1, $title_done_once
	#continue set_title_done
	NOP

$init_from_save_file:
	;if title is done once, start using the 'next level'
	LB T0, $title_done_once
	BNE T0, R0, @@use_selected
	NOP
	
	;otherwise, start at the starting level from bbp, usually the title
	B @@return
	NOP
	
	@@use_selected:
	ORI A1, R0, $STAGE_AFTER_TITLE_AREA
	SH A1, $g_level_num
	SLL V0, A1, 0x0
	
	@@return:
	#continue init_from_save_file
	NOP