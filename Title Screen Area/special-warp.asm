; for -0x9

.if $NEXT_SCREEN == 1
; Replace debug level select special warp with file select to be able to go there from area
.word 0x01100014, 0x002A6120, 0x002A65B0, 0x14000000
.elseif $NEXT_SCREEN == 2
; next level
.word 0x01100015, 0x002ABCA0, 0x002AC6B0, 0x15000000
.endif