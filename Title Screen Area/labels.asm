/* Global Structs - Pointers */
$g_global_timer equ 0x8032D5D4
$g_level_num equ 0x8032DDF8
$g_mario equ 0x8033B170
$g_mario_obj_ptr equ 0x80361158
$g_current_obj_ptr equ 0x80361160

/* Object Struct */
$o_gfx_flags equ 0x2
$o_scale_x equ 0x2C
$o_scale_y equ 0x30
$o_scale_z equ 0x34
$o_active_flags equ 0x74
$o_opacity equ 0x17C

/* Mario State Properties */
$m_area equ 0x90

/* Functions */
.definelabel $warp_special, 0x8024978C
.definelabel $set_mario_action, 0x80252CF4
.definelabel $play_sound, 0x802CA1E0
.definelabel $play_transition, 0x8027B1A0

