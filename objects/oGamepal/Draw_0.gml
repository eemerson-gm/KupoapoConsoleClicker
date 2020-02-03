/// @description Gamepal - Buttons.

//Inherit the parent event.
event_inherited();

//Gets the position of the console button.
var gamepal_dpad_x		= 11;
var gamepal_dpad_y		= 37;
var gamepal_A_x			= 34;
var gamepal_A_y			= 47;
var gamepal_B_x			= 39;
var gamepal_B_y			= 37;
var gamepal_start_x		= 19;
var gamepal_start_y		= 59;
var gamepal_select_x	= 28;
var gamepal_select_y	= 59;

//Gets the button alt-keys.
var gamepal_A_alt		= ord("Z");
var gamepal_B_alt		= ord("X");
var gamepal_start_alt	= vk_enter;
var gamepal_select_alt	= vk_shift;

//Checks if any button is pressed.
var is_pressed			= false;

//Draws the console buttons.
if scr_button_draw_press(x + gamepal_dpad_x, y + gamepal_dpad_y - console_z, 0, spr_console_gamepal_button_dpad, 0, undefined, undefined, sound_effect_tap_in, sound_effect_tap_out)					{ is_pressed = true; }
if scr_button_draw_press(x + gamepal_A_x, y + gamepal_A_y - console_z, 0, spr_console_gamepal_button_A, 0, undefined, gamepal_A_alt, sound_effect_tap_in, sound_effect_tap_out)							{ is_pressed = true; }
if scr_button_draw_press(x + gamepal_B_x, y + gamepal_B_y - console_z, 0, spr_console_gamepal_button_B, 0, undefined, gamepal_B_alt, sound_effect_tap_in, sound_effect_tap_out)							{ is_pressed = true; }
if scr_button_draw_press(x + gamepal_start_x, y + gamepal_start_y - console_z, 0, spr_console_gamepal_button_start, 0, undefined, gamepal_start_alt, sound_effect_tap_in, sound_effect_tap_out)		{ is_pressed = true; }
if scr_button_draw_press(x + gamepal_select_x, y + gamepal_select_y - console_z, 0, spr_console_gamepal_button_select, 0, undefined, gamepal_select_alt, sound_effect_tap_in, sound_effect_tap_out)	{ is_pressed = true; }

//Adds points to the point counter.
if (is_pressed){ clicker_points += clicker_rank; clicker_xp += clicker_rank; }

//Checks if the clicker should rank up.
if (clicker_xp >= power(CLICKER_XP_MINIMUM, clicker_rank)){ clicker_rank++; clicker_xp = 0; }