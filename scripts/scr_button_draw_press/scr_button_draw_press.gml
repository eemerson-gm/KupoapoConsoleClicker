
///@param button x
///@param button y
///@param button sprite-index
///@param button sprite
///@param button icon-index
///@param button icon
///@param button alt
///@param button sound in
///@param button sound out

//Gets the button sprite and position.
var _button_x		= argument0;
var _button_y		= argument1;
var _button_sprind	= argument2;
var _button_spr		= argument3;
var _button_icoind	= argument4;
var _button_ico		= argument5;
var _button_alt		= argument6;
var _button_snd_in	= argument7;
var _button_snd_out	= argument8;

//Gets the button pressed state.
var _button_hovered		= point_in_rectangle(mouse_x, mouse_y, _button_x, _button_y, _button_x + sprite_get_width(_button_spr), _button_y + sprite_get_height(_button_spr));
var _button_pressed		= (_button_hovered && mouse_check_button(mb_left));
var _button_released	= (_button_hovered && mouse_check_button_released(mb_left));
var _button_tap			= (_button_hovered && mouse_check_button_pressed(mb_left));

//Checks if an alternate button has been defined.
if (_button_alt != undefined){
	_button_pressed		= _button_pressed || keyboard_check(_button_alt);
	_button_released	= _button_released || keyboard_check_released(_button_alt);
	_button_tap			= _button_tap || keyboard_check_pressed(_button_alt);
}

//Draws the button at the location.
draw_sprite(_button_spr, _button_sprind + _button_pressed, _button_x, _button_y);
if (_button_ico != undefined){ draw_sprite(_button_ico, _button_icoind, _button_x + (sprite_get_width(_button_spr)/2), _button_y + (sprite_get_height(_button_spr)/2) + _button_pressed); }

//Plays the corresponding button sounds.
if (_button_tap) && (!audio_is_playing(_button_snd_in)) && (_button_snd_in != undefined)			{ audio_play_sound(_button_snd_in, 0, false); }
if (_button_released) && (!audio_is_playing(_button_snd_out)) && (_button_snd_out != undefined)		{ audio_play_sound(_button_snd_out, 0, false); }

//Returns whether the button has been pressed.
return _button_released;